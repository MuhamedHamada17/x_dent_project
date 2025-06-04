import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/helpers/shared_pref_helper.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/data/models/specialization_doctors_model.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/logic/make_appointment_cubit.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/logic/make_appointment_state.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/logic/time_slots_cubit.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/logic/time_slots_state.dart';
import '../../../../../../core/theiming/colors.dart';
import '../../../../../../core/theiming/styles.dart';
import '../widgets/list_days_widget.dart';
import '../widgets/list_times_widget.dart';

class DoctorDetailsScreen extends StatefulWidget {
  final String specialization;
  final int doctorId;

  const DoctorDetailsScreen({
    super.key,
    required this.specialization,
    required this.doctorId,
  });

  @override
  _DoctorDetailsScreenState createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  String? selectedDay;
  String selectedTime = '';

  String _formatDateForApi(String day) {
    try {
      if (day.toLowerCase().startsWith('today')) {
        return DateFormat('yyyy-MM-dd').format(DateTime.now());
      }
      if (day.contains(' ')) {
        final parts = day.split(' ');
        if (parts.length >= 2) {
          final parsedDate = DateFormat('d MMM').parse(parts.skip(parts[0].toLowerCase() == 'today' ? 1 : 0).join(' '));
          final now = DateTime.now();
          final year = parsedDate.month < now.month ? now.year + 1 : now.year;
          return DateFormat('yyyy-MM-dd').format(DateTime(year, parsedDate.month, parsedDate.day));
        }
      }
      final daysOfWeek = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
      if (daysOfWeek.contains(day)) {
        final now = DateTime.now();
        int targetDayIndex = daysOfWeek.indexOf(day);
        int currentDayIndex = now.weekday - 1;
        int daysUntilTarget = (targetDayIndex - currentDayIndex + 7) % 7;
        if (daysUntilTarget == 0) daysUntilTarget = 7;
        final targetDate = now.add(Duration(days: daysUntilTarget));
        return DateFormat('yyyy-MM-dd').format(targetDate);
      }
      DateFormat('yyyy-MM-dd').parse(day);
      return day;
    } catch (e) {
      debugPrint('Error formatting date: $e');
      return DateFormat('yyyy-MM-dd').format(DateTime.now());
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('DoctorDetailsScreen: Received specialization: "${widget.specialization}", doctorId: ${widget.doctorId}');
    if (widget.specialization.isEmpty || widget.doctorId == 0) {
      debugPrint('DoctorDetailsScreen: Error - Invalid specialization: "${widget.specialization}", doctorId: ${widget.doctorId}');
      return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsManager.white,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, size: 30),
            onPressed: () => context.pop(),
          ),
          title: Text('Doctor Details', style: TextStyles.font14BlackRegular),
        ),
        body: Center(
          child: Text(
            'Error: Invalid specialization or doctor ID',
            style: TextStyles.font16BlueRegular,
          ),
        ),
      );
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetIt.instance<TimeSlotsCubit>()),
        BlocProvider(create: (context) => GetIt.instance<MakeAppointmentCubit>()),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsManager.white,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, size: 30),
            onPressed: () => context.pop(),
          ),
          title: Text('Doctor Details', style: TextStyles.font14BlackRegular),
        ),
        body: FutureBuilder<DoctorData?>(
          future: SharedPrefHelper.getDoctorData(widget.doctorId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator(color: ColorsManager.Blue));
            }
            if (!snapshot.hasData || snapshot.data == null) {
              debugPrint('DoctorDetailsScreen: No data found for doctorId: ${widget.doctorId}');
              return FutureBuilder<List<DoctorData>>(
                future: SharedPrefHelper.getDoctors(widget.specialization),
                builder: (context, specializationSnapshot) {
                  if (specializationSnapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator(color: ColorsManager.Blue));
                  }
                  if (!specializationSnapshot.hasData || specializationSnapshot.data!.isEmpty) {
                    debugPrint('DoctorDetailsScreen: No data found for specialization: ${widget.specialization}');
                    return Center(
                      child: Text(
                        'No doctor data found for ${widget.specialization}',
                        style: TextStyles.font16BlueRegular,
                      ),
                    );
                  }
                  final doctor = specializationSnapshot.data!.firstWhere(
                        (d) => d.id == widget.doctorId,
                    orElse: () => DoctorData(
                      id: widget.doctorId,
                      first_name: '',
                      last_name: '',
                      name: 'Unknown Doctor',
                      email: '',
                      role: '',
                      degree: '',
                      university: '',
                      specialization: [],
                      schedules: [],
                      reviews_count: 0,
                      average_rating: 0,
                      created_at: '',
                      updated_at: '',
                    ),
                  );
                  return buildDoctorDetails(context, doctor);
                },
              );
            }
            final doctor = snapshot.data!;
            return buildDoctorDetails(context, doctor);
          },
        ),
      ),
    );
  }

  Widget buildDoctorDetails(BuildContext context, DoctorData doctor) {
    if (selectedDay == null && doctor.schedules.isNotEmpty) {
      selectedDay = doctor.schedules.first.available_days;
      context.read<TimeSlotsCubit>().fetchAvailableSlots(
        widget.doctorId,
        _formatDateForApi(selectedDay!),
      );
    }

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 96.w,
                  height: 96.h,
                  child: CircleAvatar(
                    radius: 24.r,
                    backgroundColor: ColorsManager.OfWhite,
                    child: Text(
                      doctor.name.isNotEmpty ? doctor.name.substring(0, 2).toUpperCase() : "AZ",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctor.name,
                      style: TextStyles.font22BlackMedium,
                    ),
                    verticalSpace(8),
                    Text(
                      doctor.specialization.isNotEmpty ? doctor.specialization.join(", ") : 'Unknown Specialization',
                      style: TextStyles.font12BlackRegular,
                    ),
                    verticalSpace(8),
                    Row(
                      children: [
                        Image.asset(
                          "assets/png/location_patient.png",
                          width: 24.w,
                          height: 24.h,
                        ),
                        Text(
                          doctor.location ?? 'No location provided',
                          style: TextStyles.font12GreyRegular,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Image.asset(
                      "assets/png/patients.png",
                      width: 44.w,
                      height: 44.h,
                    ),
                    Text('2400+', style: TextStyles.font14BlueRegular),
                    Text('Patients', style: TextStyles.font12BlueRegular),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/png/years.png",
                      width: 44.w,
                      height: 44.h,
                    ),
                    Text('10+', style: TextStyles.font14BlueRegular),
                    Text('Years Exp.', style: TextStyles.font12BlackRegular),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/png/rating.png",
                      width: 44.w,
                      height: 44.h,
                    ),
                    Text(
                      '${doctor.average_rating.toDouble()}',
                      style: TextStyles.font14BlueRegular,
                    ),
                    Text('Rating', style: TextStyles.font12BlackRegular),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.pushNamed(
                          Routes.AddRatingDialogScreen,
                          arguments: {
                            'doctorId': widget.doctorId,
                          },
                        );
                      },
                      child: Image.asset(
                        "assets/png/writeRating.png",
                        width: 44.w,
                        height: 44.h,
                      ),
                    ),
                    Text(
                        '${doctor.reviews_count}+',
                        style: TextStyles.font14BlueRegular),
                    Text('Add Rating', style: TextStyles.font12BlackRegular),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Text('About', style: TextStyles.font22BlackMedium),
            verticalSpace(8),
            Text(
              doctor.degree.isNotEmpty && doctor.university.isNotEmpty
                  ? 'Degree: ${doctor.degree}\nUniversity: ${doctor.university}'
                  : 'No information available.',
              style: TextStyles.font12BlackRegular,
            ),
            verticalSpace(10),
            const Divider(height: 20),
            Row(
              children: [
                Text('Book Appointment', style: TextStyles.font14BlackRegular),
                const Spacer(),
                Text('May 2025', style: TextStyles.font14BlueRegular),
              ],
            ),
            verticalSpace(10),
            Text("Location", style: TextStyles.font22BlackMedium),
            verticalSpace(6),
            Row(
              children: [
                SizedBox(
                  width: 134.w,
                  height: 25.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsManager.Blue,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        side: BorderSide.none,
                      ),
                    ),
                    child: Text(
                      doctor.location ?? 'Unknown Location',
                      style: TextStyles.font12WhiteRegular,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                horizontalSpace(10),
                SizedBox(
                  width: 134.w,
                  height: 25.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsManager.lighterBLUE,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        side: BorderSide.none,
                      ),
                    ),
                    child: Text(
                      'Other location',
                      style: TextStyles.font12BlueRegular,
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(10),
            Text("Day", style: TextStyles.font22BlackMedium),
            verticalSpace(6),
            ListDaysWidget(
              initialDay: selectedDay ?? (doctor.schedules.isNotEmpty ? doctor.schedules.first.available_days : ''),
              onDaySelected: (day) {
                setState(() {
                  selectedDay = day;
                  context.read<TimeSlotsCubit>().fetchAvailableSlots(
                    widget.doctorId,
                    _formatDateForApi(day),
                  );
                });
              },
              doctorData: doctor,
            ),
            verticalSpace(10),
            Text("Time", style: TextStyles.font22BlackMedium),
            verticalSpace(6),
            BlocBuilder<TimeSlotsCubit, TimeSlotsState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const Center(child: Text('Select a day to view available appointments')),
                  loading: () => const Center(child: CircularProgressIndicator(color: ColorsManager.Blue)),
                  success: (response) {
                    final slots = response.slots;
                    if (slots.isEmpty) {
                      return const Center(child: Text('There are no appointments available for today'));
                    }
                    return ListTimesWidget(
                      initialTime: selectedTime.isEmpty ? slots.first : selectedTime,
                      onTimeSelected: (time) {
                        setState(() {
                          selectedTime = time;
                        });
                      },
                      availableTimes: slots,
                    );
                  },
                  error: (error) => Center(
                    child: Column(
                      children: [
                        Text(
                          error.message,
                          style: TextStyles.font16BlueRegular,
                          textAlign: TextAlign.center,
                        ),
                        verticalSpace(10),
                        ElevatedButton(
                          onPressed: () {
                            if (selectedDay != null) {
                              context.read<TimeSlotsCubit>().fetchAvailableSlots(
                                widget.doctorId,
                                _formatDateForApi(selectedDay!),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: ColorsManager.Blue),
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            verticalSpace(40),
            Center(
              child: SizedBox(
                width: 221.w,
                height: 44.h,
                child: BlocConsumer<MakeAppointmentCubit, MakeAppointmentState>(
                  listener: (context, state) {
                    // دائمًا أظهر SnackBar باللون الأخضر وانتقل إلى شاشة الدفع
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Appointment booked with ${doctor.name}'),
                        backgroundColor: Colors.green,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                    // الانتقال إلى شاشة الدفع
                    Navigator.pushNamed(
                      context,
                      Routes.PatientDetailsPaymentScreen, // تأكد من أن هذا هو اسم المسار الصحيح
                      arguments: {
                        'doctorId': widget.doctorId,
                        'doctorName': doctor.name,
                        'date': selectedDay,
                        'time': selectedTime,
                      },
                    );
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: selectedDay == null || selectedTime.isEmpty || state is Loading
                          ? null
                          : () async {
                        await SharedPrefHelper.saveDoctorData(widget.doctorId, doctor);
                        await SharedPrefHelper.saveAppointmentId(widget.doctorId);
                        context.read<MakeAppointmentCubit>().makeAppointment(
                          doctorId: widget.doctorId,
                          day: _formatDateForApi(selectedDay!),
                          time: selectedTime,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: ColorsManager.Blue,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      child: state is Loading
                          ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                          : Text(
                        'Make Appointment',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                        ),
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}