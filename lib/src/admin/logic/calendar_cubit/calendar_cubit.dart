import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kezanat_alsama/model/daily_work/calendar_model.dart';
import 'package:kezanat_alsama/src/core/data_source/remote.dart';
import 'package:kezanat_alsama/src/core/entity/data_state.dart';
import 'package:kezanat_alsama/src/core/entity/data_status.dart';
import 'package:kezanat_alsama/utils/utils.dart';

part 'calendar_cubit.freezed.dart';
part 'calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit()
      : super(const CalendarState.initial(datastatus: StateIdeal()));
  getCalendarEvent() async {
    emit(state.copyWith(datastatus: const StateLoading()));

    final data = await FireStoreRemote.getCalendarApi();

    if (data is DataSuccess && data.data != null) {
      final today = getCalculation(
        data.data!,
      );

      emit(
        state.copyWith(
            datastatus: const StateSucess(),
            calendarModel: data.data,
            today: today),
      );

      return;
    }
    emit(state.copyWith(datastatus: const StateError()));
  }

  CalendarModel? getCalculation(CalendarModel calendarModel) {
    try {
      final currentDate = DateTime.now();
      if (calendarModel.meladyMonth == currentDate.month &&
          calendarModel.meladyDay == currentDate.day) {
        return calendarModel;
      }
      final monthDays = getMonthDays(currentDate);

      final delta = calendarModel.hijreeDay! - calendarModel.meladyDay!;

      final monthAgo =
          (calendarModel.meladyMonth ?? 0) < currentDate.month ? monthDays : 0;

      final today = monthAgo + currentDate.day + delta;

      final todayCalendar = calendarModel.copyWith();
      todayCalendar.hijreeDay = today;
      todayCalendar.meladyDay = currentDate.day;
      todayCalendar.meladyMonth = currentDate.month;

      return todayCalendar;
    } catch (_) {
      return null;
    }
  }

  int getMonthDays(DateTime currentDate) {
    var result = (currentDate.month == 1
        ? 31
        : DateTime(currentDate.year, currentDate.month - 1, currentDate.day)
            .difference(currentDate)
            .inDays);
    result = result.abs();
    return result;
  }

  Future<void> updateCalendar(CalendarModel calendarModel) async {
    emit(state.copyWith(datastatus: const StateLoading()));

    final data = await FireStoreRemote.updateCalendarApi(calendarModel);

    if (data is DataSuccess) {
      final today = getCalculation(calendarModel);
      emit(state.copyWith(
          datastatus: const StateSucess(),
          calendarModel: calendarModel,
          today: today));
      return;
    }
    emit(state.copyWith(datastatus: const StateError()));
  }
}
