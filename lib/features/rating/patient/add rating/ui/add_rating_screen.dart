import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:x_dent_project/core/helpers/shared_pref_helper.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/features/rating/patient/add%20rating/logic/add_rating_cubit.dart';
import 'package:x_dent_project/features/rating/patient/add%20rating/logic/add_rating_state.dart';

class AddRatingDialogScreen extends StatefulWidget {
  final int doctorId;

  const AddRatingDialogScreen({Key? key, required this.doctorId}) : super(key: key);

  @override
  State<AddRatingDialogScreen> createState() => _AddRatingDialogScreenState();
}

class _AddRatingDialogScreenState extends State<AddRatingDialogScreen> with TickerProviderStateMixin {
  int _rating = 0;
  String _reviewText = '';
  final List<AnimationController> _starControllers = [];
  final List<Animation<double>> _scaleAnimations = [];
  final List<Animation<double>> _opacityAnimations = [];

  @override
  void initState() {
    super.initState();
    try {
      for (int i = 0; i < 5; i++) {
        final controller = AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 150),
        );
        _starControllers.add(controller);
        _scaleAnimations.add(
          Tween<double>(begin: 1.0, end: 1.2).animate(
            CurvedAnimation(parent: controller, curve: Curves.easeInOut),
          ),
        );
        _opacityAnimations.add(
          Tween<double>(begin: 0.7, end: 1.0).animate(
            CurvedAnimation(parent: controller, curve: Curves.easeInOut),
          ),
        );
      }
    } catch (e) {
      debugPrint('Error initializing animations: $e');
      _starControllers.clear();
      _scaleAnimations.clear();
      _opacityAnimations.clear();
    }
  }

  @override
  void dispose() {
    for (var controller in _starControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _animateStar(int index) {
    if (index < _starControllers.length) {
      _starControllers[index].forward().then((_) {
        _starControllers[index].reverse();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<AddRatingCubit>(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 7, sigmaY: 5),
            ),
            Center(
              child: Material(
                child: AlertDialog(
                  backgroundColor: ColorsManager.OfWhite,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  title: Text(
                    "Add Rating",
                    style: TextStyles.font28BlackMedium,
                  ),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (index) {
                            bool isStarSelected = index < _rating;
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.w),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _rating = index + 1;
                                  });
                                  _animateStar(index);
                                },
                                child: _starControllers.isNotEmpty &&
                                    index < _starControllers.length
                                    ? AnimatedBuilder(
                                  animation: Listenable.merge([
                                    _scaleAnimations[index],
                                    _opacityAnimations[index],
                                  ]),
                                  builder: (context, child) {
                                    return Transform.scale(
                                      scale: _scaleAnimations[index].value,
                                      child: Opacity(
                                        opacity: _opacityAnimations[index].value,
                                        child: isStarSelected
                                            ? Icon(
                                          Icons.star,
                                          color: ColorsManager.Blue,
                                          size: 40,
                                        )
                                            : Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.white,
                                              size: 40,
                                            ),
                                            Icon(
                                              Icons.star_border,
                                              color: ColorsManager.Blue,
                                              size: 40,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                )
                                    : Icon(
                                  isStarSelected
                                      ? Icons.star
                                      : Icons.star_border,
                                  color: ColorsManager.Blue,
                                  size: 40,
                                ),
                              ),
                            );
                          }),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          "Enter your review",
                          style: TextStyles.font14BlackSemi,
                        ),
                        SizedBox(height: 12.h),
                        TextField(
                          minLines: 3,
                          maxLines: 5,
                          onChanged: (value) {
                            _reviewText = value;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: ColorsManager.Blue,
                                width: 2.0,
                              ),
                            ),
                            hintText: "Write your review here...",
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    Row(
                      children: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text("Cancel", style: TextStyles.font22BlackMedium),
                        ),
                        const Spacer(),
                        BlocConsumer<AddRatingCubit, AddRatingState>(
                          listener: (context, state) {
                            state.when(
                              initial: () {},
                              loading: () {},
                              success: (response) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(' ${response.message}'),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                                Navigator.of(context).pop();
                              },
                              error: (error) {
                                String errorMessage = error.message.contains('The service is not available')
                                    ? 'The evaluation could not be submitted. Please check your connection or doctor ID.'
                                    : error.message;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(errorMessage)),
                                );
                              },
                            );
                          },
                          builder: (context, state) {
                            return state.maybeWhen(
                              loading: () => CircularProgressIndicator(color: ColorsManager.Blue),
                              orElse: () => ElevatedButton(
                                onPressed: () async {
                                  if (_rating == 0) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Please choose a rating')),
                                    );
                                    return;
                                  }
                                  if (_reviewText.trim().isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Please enter review text')),
                                    );
                                    return;
                                  }
                                  final token = await SharedPrefHelper.getSecuredString('access_token');
                                  if (token.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Please log in to submit your review.')),
                                    );
                                    return;
                                  }
                                  if (widget.doctorId <= 0) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('The doctor ID is invalid')),
                                    );
                                    return;
                                  }
                                  debugPrint('AddRatingScreen: Submitting review - doctorId: ${widget.doctorId}, rating: $_rating, review: $_reviewText, token: $token (length: ${token.length})');
                                  context.read<AddRatingCubit>().submitReview(
                                    token: token,
                                    doctorId: widget.doctorId,
                                    review: _reviewText,
                                    rating: _rating.toString(),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorsManager.Blue,
                                ),
                                child: Text("Confirm", style: TextStyles.font22WhiteMedium),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}