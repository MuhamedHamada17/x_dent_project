import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/helpers/shared_pref_helper.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/data/models/specialization_doctors_model.dart';
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
  String selectedDay = 'Today 4 Oct';
  String selectedTime = '8:00 PM';

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
      body: FutureBuilder<DoctorData?>(
        future: SharedPrefHelper.getDoctorData(widget.doctorId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: ColorsManager.Blue));
          }
          if (!snapshot.hasData || snapshot.data == null) {
            debugPrint('DoctorDetailsScreen: No data found for doctorId: ${widget.doctorId}');
            // Fallback to fetching from specialization if no doctor data is stored
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
    );
  }

  Widget buildDoctorDetails(BuildContext context, DoctorData doctor) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // قسم المعلومات الشخصية للطبيب
            Row(
              children: [
                SizedBox(
                  width: 96.w,
                  height: 96.h,
                  child: CircleAvatar(
                    radius: 24.r,
                    backgroundColor: ColorsManager.OfWhite,
                    child: Text(
                      doctor.name.isNotEmpty
                          ? doctor.name.substring(0, 2).toUpperCase()
                          : "AZ",
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
                      doctor.specialization.isNotEmpty
                          ? doctor.specialization.join(", ")
                          : 'Unknown Specialization',
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
            // إحصائيات الطبيب
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
                        style: TextStyles.font14BlueRegular),
                    Text('Rating', style: TextStyles.font12BlackRegular),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/png/writeRating.png",
                      width: 44.w,
                      height: 44.h,
                    ),
                    Text(
                      '${doctor.reviews_count}+',
                      style: TextStyles.font14BlueRegular,
                    ),
                    Text('Reviews', style: TextStyles.font12BlackRegular),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            // قسم About
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
                Text('Oct. 2025', style: TextStyles.font14BlueRegular),
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
                    child: Text(
                      doctor.location ?? 'Unknown Location',
                      style: TextStyles.font12WhiteRegular,
                      overflow: TextOverflow.ellipsis,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsManager.Blue,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        side: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                horizontalSpace(10),
                SizedBox(
                  width: 134.w,
                  height: 25.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Other location',
                      style: TextStyles.font12BlueRegular,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsManager.lighterBLUE,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        side: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(10),
            Text("Day", style: TextStyles.font22BlackMedium),
            verticalSpace(6),
            ListDaysWidget(
              initialDay: selectedDay,
              onDaySelected: (day) {
                setState(() {
                  selectedDay = day;
                });
              },
              doctorData: doctor, // تمرير doctorData
            ),
            verticalSpace(10),
            Text("Time", style: TextStyles.font22BlackMedium),
            verticalSpace(6),
            ListTimesWidget(
              initialTime: selectedTime,
              onTimeSelected: (time) {
                setState(() {
                  selectedTime = time;
                });
              },
            ),
            verticalSpace(20),
            Center(
              child: SizedBox(
                width: 221.w,
                height: 44.h,
                child: ElevatedButton(
                  onPressed: () {
                    // Save doctor data and appointment ID
                    SharedPrefHelper.saveDoctorData(widget.doctorId, doctor);
                    SharedPrefHelper.saveAppointmentId(doctor.id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Appointment booked with ${doctor.name}')),
                    );
                    // Navigate to AppointmentDetailsPatientScreen
                    context.pushNamed(Routes.appointmentDetailsPatientScreen);
                  },
                  child: Text(
                    'Make Appointment',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal,
                    ),
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: ColorsManager.Blue,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}