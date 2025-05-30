import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repo/display_xrays_repo.dart';
import 'display_xrays_state.dart';

class DisplayXraysCubit extends Cubit<DisplayXraysState> {
  final DisplayXraysRepo repo;

  DisplayXraysCubit(this.repo) : super(const DisplayXraysState.initial());

  Future<void> fetchXrays(String token) async {
    print('DisplayXraysCubit: Fetching X-rays with token: $token');
    try {
      if (token.isEmpty || token == 'Bearer ') {
        emit(const DisplayXraysState.error('يجب تسجيل الدخول أولاً'));
        return;
      }
      emit(const DisplayXraysState.loading());
      final xrays = await repo.getXrays(token);
      print('DisplayXraysCubit: Successfully fetched ${xrays.xrays.length} X-rays');
      emit(DisplayXraysState.success(xrays));
    } catch (e) {
      final message = e.toString().contains('Token')
          ? 'يجب تسجيل الدخول أولاً'
          : 'حدث خطأ: ${e.toString()}';
      print('DisplayXraysCubit: Error: $message');
      emit(DisplayXraysState.error(message));
    }
  }
}