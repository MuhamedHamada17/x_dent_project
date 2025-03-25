import 'package:flutter/material.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import '../../../../core/theiming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterPatientScreen extends StatefulWidget {
  const FilterPatientScreen({Key? key}) : super(key: key);

  @override
  State<FilterPatientScreen> createState() => _FilterPatientScreenState();
}

class _FilterPatientScreenState extends State<FilterPatientScreen> {
  // حقول لتخزين القيم المدخلة
  String selectedLocation = 'Any area';
  double minReview = 0.0;
  RangeValues priceRange = const RangeValues(0, 1000);
  int minYear = 0;
  int maxYear = 50;

  // المراجعات المختارة
  String selectedReviewOption = 'Any';

  // قائمة التخصصات
  final List<String> specialties = [
    'Cavities',
    'Dental Hygiene',
    'Orthopedics',
    'Implants',
    'Dentures',
    'Surgery',
    'Periodontology',
    'Veneers',
    'Cosmetics',
    'Extraction',
    'Radiology',
  ];

  // لتخزين التخصصات المختارة
  List<String> selectedSpecialties = [];

  // دالة لإعادة تعيين (Reset) كل القيم
  void _resetAll() {
    setState(() {
      selectedLocation = 'Any area';
      selectedReviewOption = 'Any';
      priceRange = const RangeValues(0, 1000);
      minYear = 0;
      maxYear = 50;
      selectedSpecialties.clear();
    });
  }

  // دالة للتحكم في اختيار أو إلغاء اختيار تخصص معين
  void _toggleSpecialty(String specialty) {
    setState(() {
      if (selectedSpecialties.contains(specialty)) {
        selectedSpecialties.remove(specialty);
      } else {
        selectedSpecialties.add(specialty);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // تأكد من تهيئة ScreenUtil إذا لم يكن مُهيئ مسبقاً
    ScreenUtil.init(context);

    return Scaffold(
      backgroundColor: ColorsManager.white,
      appBar: AppBar(
        backgroundColor: ColorsManager.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Filter',
          style: TextStyles.font20BlackRegular,
        ),
        actions: [
          TextButton(
            onPressed: _resetAll,
            child: Text(
              'Reset all',
              style: TextStyle(
                color: ColorsManager.Blue,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // اختيار الموقع
            Text(
              'Location',
              style: TextStyles.font14GreySemi,
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: selectedLocation,
              items: <String>['Any area', 'Location 1', 'Location 2', 'Location 3']
                  .map((loc) => DropdownMenuItem<String>(
                value: loc,
                child: Text(loc),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedLocation = value ?? 'Any area';
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: ColorsManager.OfWhite,
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorsManager.Grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorsManager.Grey, width: 0.8),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // المراجعات
            Text(
              'Reviews',
              style: TextStyles.font14GreySemi
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              children: [
                _buildCustomChip('Any'),
                _buildCustomChip('1.5+'),
                _buildCustomChip('3+'),
                _buildCustomChip('4+'),
              ],
            ),

            const SizedBox(height: 16),

            // نطاق السعر
            Text(
              'Price range',
              style: TextStyles.font14GreySemi
            ),
            const SizedBox(height: 8),
            RangeSlider(
              values: priceRange,
              min: 0,
              max: 1000,
              divisions: 20,
              activeColor: ColorsManager.Blue,
              inactiveColor: ColorsManager.lighterBLUE,
              labels: RangeLabels(
                '\$${priceRange.start.round()}',
                '\$${priceRange.end.round()}',
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  priceRange = values;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$${priceRange.start.round()}', style: TextStyles.font14GreySemi),
                Text('\$${priceRange.end.round()}', style: TextStyles.font14GreySemi),
              ],
            ),

            const SizedBox(height: 16),

            // سنوات الخبرة
            Text(
              'Year in Practice',
              style:TextStyles.font14GreySemi
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: minYear.toString(),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: ColorsManager.OfWhite,
                      labelText: 'Min',
                      labelStyle: TextStyles.font14GreySemi,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorsManager.Grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorsManager.Grey, width: 0.8),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        minYear = int.tryParse(value) ?? 0;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    initialValue: maxYear.toString(),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: ColorsManager.OfWhite,
                      labelText: 'Max',
                      labelStyle: TextStyles.font14GreySemi,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorsManager.Grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorsManager.Grey, width: 0.8),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        maxYear = int.tryParse(value) ?? 50;
                      });
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // التخصصات
            Text(
              'Specialty',
              style:TextStyles.font14GreySemi
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: specialties.map((spec) {
                return _buildCustomChip(spec, isSpecialty: true);
              }).toList(),
            ),

            const SizedBox(height: 24),

            // زر عرض النتائج
            Center(
              child: SizedBox(
                width: 161.w,
                height: 44.h,
                child: ElevatedButton(
                  onPressed: () {
                    debugPrint('Location: $selectedLocation');
                    debugPrint('Review: $selectedReviewOption');
                    debugPrint('Price range: ${priceRange.start} - ${priceRange.end}');
                    debugPrint('Years in practice: $minYear - $maxYear');
                    debugPrint('Specialties: $selectedSpecialties');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsManager.Blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'View Result',
                    style: TextStyles.font18WhiteRegular,)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // تابع مساعد لبناء شريحة (Chip) مخصصة لكل من الريفيو والتخصص
  Widget _buildCustomChip(String label, {bool isSpecialty = false}) {
    // إذا كانت شريحة الريفيو أو التخصص تريد أن تكون دائماً بنفس اللون (لايت بلو) والنص أسود
    return ChoiceChip(
      label: Text(
        label,
        style: TextStyle(
          color: ColorsManager.Black,
          fontSize: 14,
        ),
      ),
      selected: (isSpecialty)
          ? selectedSpecialties.contains(label)
          : selectedReviewOption == label,
      // نجعل الخلفية دائماً "لايت بلو"
      selectedColor: ColorsManager.lighterBLUE,
      backgroundColor: ColorsManager.lighterBLUE,
      onSelected: (selected) {
        setState(() {
          if (isSpecialty) {
            if (selectedSpecialties.contains(label)) {
              selectedSpecialties.remove(label);
            } else {
              selectedSpecialties.add(label);
            }
          } else {
            selectedReviewOption = label;
          }
        });
      },
    );
  }
}
