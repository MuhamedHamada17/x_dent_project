import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/features/home/doctor/doctor_appointment/logic/doctors_payment_appointments_cubit.dart';
import 'package:x_dent_project/features/home/doctor/doctor_appointment/logic/doctors_payment_appointments_state.dart';
import 'package:x_dent_project/features/home/doctor/doctor_appointment/ui/widgets/detail_row.dart';

class PaymentPage extends StatelessWidget {
  final int? appointmentId;

  const PaymentPage({super.key, this.appointmentId});

  @override
  Widget build(BuildContext context) {
    debugPrint('PaymentPage: Building with appointmentId = $appointmentId');
    if (appointmentId == null || appointmentId! <= 0) {
      debugPrint('PaymentPage: Invalid appointmentId');
      return const Center(
          child: Text('معرف الموعد غير صالح، برجاء اختيار موعد صالح'));
    }

    final cubit = GetIt.instance<DoctorPaymentCubit>();
    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<DoctorPaymentCubit, DoctorPaymentState>(
        key: ValueKey(appointmentId),
        builder: (context, state) {
          debugPrint('PaymentPage: BlocBuilder state = $state');
          if ((state == const DoctorPaymentState.initial()) ||
              (state == const DoctorPaymentState.loading())) {
            if (!cubit.isClosed) {
              cubit.reset();
              cubit.fetchDoctorPaymentAppointment(appointmentId!);
            }
          }
          return state.when(
            initial: () {
              debugPrint('PaymentPage: Initial state');
              return const Center(child: Text('جاري التحضير...'));
            },
            loading: () {
              debugPrint('PaymentPage: Loading state');
              return const Center(
                  child: CircularProgressIndicator(
                color: ColorsManager.Blue,
              ));
            },
            error: (message) {
              debugPrint('PaymentPage: Error state - $message');
              return Center(child: Text('خطأ: $message'));
            },
            success: (data) {
              if (data.appointments.id != appointmentId) {
                debugPrint(
                    'PaymentPage: Mismatch - Data ID: ${data.appointments.id}, Expected ID: $appointmentId');
                if (!cubit.isClosed) {
                  cubit.reset();
                  cubit.fetchDoctorPaymentAppointment(appointmentId!);
                }
                return const Center(
                    child: CircularProgressIndicator(
                  color: ColorsManager.Blue,
                ));
              }
              debugPrint(
                  'PaymentPage: Success state - Data: ${data.appointments.toJson()}');
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Center(
                        child: Text(data.appointments.amount ?? "500 L.E",
                            style: TextStyles.font34BlackBoldOpen)),
                    const SizedBox(height: 16),
                    const SizedBox(height: 8),
                    DetailRow(
                        label: "Recipient", value: data.appointments.recipient),
                    DetailRow(
                        label: "Date",
                        value: data.appointments.date ?? "1/7/2025"),
                    DetailRow(
                        label: "Reference", value: data.appointments.reference),
                    DetailRow(
                        label: "Payment Method",
                        value: data.appointments.paymentMethod),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
