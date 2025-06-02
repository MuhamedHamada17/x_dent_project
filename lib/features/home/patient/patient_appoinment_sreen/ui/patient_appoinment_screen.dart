import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/logic/appointment_patient_cubit.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/logic/cancel_appointment_cubit.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/ui/widgets/bloc_builder_appointment.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/ui/widgets/custom_container_row.dart';

import '../logic/appointment_patient_state.dart';
import '../logic/cancel_appointment_state.dart';

class PatientAppointmentScreen extends StatefulWidget {
  const PatientAppointmentScreen({super.key});

  @override
  State<PatientAppointmentScreen> createState() => _PatientAppointmentScreenState();
}

class _PatientAppointmentScreenState extends State<PatientAppointmentScreen> {
  String selectedStatus = "upcoming";
  bool _isFetching = false;

  void _handleStatusChange(int index, AppointmentPatientCubit cubit) async {
    if (_isFetching) return;

    final newStatus = index == 0 ? "upcoming" : index == 1 ? "completed" : "cancelled";
    if (newStatus == selectedStatus) return;

    print('Status changed to: $newStatus'); // Debug print

    setState(() {
      _isFetching = true;
      selectedStatus = newStatus;
    });

    if (selectedStatus == "upcoming") {
      await cubit.fetchUpcomingAppointments();
    } else if (selectedStatus == "completed") {
      await cubit.fetchConfirmedAppointments();
    } else if (selectedStatus == "cancelled") {
      await cubit.fetchCancelledAppointments();
    }

    setState(() {
      _isFetching = false;
    });
  }

  Future<void> _refreshAppointments(AppointmentPatientCubit cubit) async {
    if (_isFetching) return;

    setState(() {
      _isFetching = true;
    });

    if (selectedStatus == "upcoming") {
      await cubit.fetchUpcomingAppointments();
    } else if (selectedStatus == "completed") {
      await cubit.fetchConfirmedAppointments();
    } else if (selectedStatus == "cancelled") {
      await cubit.fetchCancelledAppointments();
    }

    setState(() {
      _isFetching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetIt.instance<AppointmentPatientCubit>(),
        ),
        BlocProvider(
          create: (context) => GetIt.instance<CancelAppointmentCubit>(),
        ),
      ],
      child: BlocConsumer<AppointmentPatientCubit, AppointmentPatientState>(
        listener: (context, state) {
          print("AppointmentPatientCubit state: $state");
          state.maybeWhen(
            upcomingError: (error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                    content: Text(error.message ?? 'Error fetching upcoming appointments')),
              );
            },
            confirmedError: (error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(error.message ?? 'Error fetching confirmed appointments'),
                  backgroundColor: Colors.red,

                ),
              );
            },
            cancelledError: (error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(error.message ?? 'Error fetching cancelled appointments'),
                  backgroundColor: Colors.red,
                ),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          final cubit = context.read<AppointmentPatientCubit>();

          if (state is UpcomingLoading && !_isFetching && selectedStatus == "upcoming") {
            cubit.fetchUpcomingAppointments();
          }

          return Scaffold(
            body: Column(
              children: [
                Container(
                  color: ColorsManager.lighterBLUE,
                  width: double.infinity,
                  height: 185.h,
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("My Appointments", style: TextStyles.font28BlackMedium),
                          Image.asset(
                            "assets/png/search_appointment.png",
                            width: 44.w,
                            height: 44.h,
                          ),
                        ],
                      ),
                      verticalSpace(20),
                      CustomContainerRow(
                        onStatusChanged: (index) => _handleStatusChange(index, cubit),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: RefreshIndicator(
                    color: ColorsManager.Blue,
                    onRefresh: () => _refreshAppointments(cubit),
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height - 185.h,
                        ),
                        child: BlocConsumer<CancelAppointmentCubit, CancelAppointmentState>(
                          listener: (context, cancelState) {
                            cancelState.whenOrNull(
                              success: (response) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(response.message)),
                                );
                                // Refresh upcoming appointments
                                if (selectedStatus == "upcoming") {
                                  context.read<AppointmentPatientCubit>().fetchUpcomingAppointments();
                                }
                              },
                              error: (error) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text(error)),
                                );
                              },
                            );
                          },
                          builder: (context, cancelState) {
                            return Column(
                              children: [
                                cancelState.maybeWhen(
                                  loading: () =>  Center(child: CircularProgressIndicator(
                                    color: ColorsManager.Blue,
                                  )),
                                  orElse: () => const SizedBox.shrink(),
                                ),
                                AppointmentBlocBuilder(selectedStatus: selectedStatus),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}