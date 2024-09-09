import 'package:kezanat_alsama/src/admin/logic/calendar_cubit/calendar_cubit.dart';
import 'package:kezanat_alsama/src/admin/pages/calendar/add_calendar_page.dart';
import 'package:kezanat_alsama/src/core/entity/data_status.dart';
import 'package:kezanat_alsama/src/core/widget/jb_button_mix.dart';
import 'package:kezanat_alsama/utils/utils.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CalendarAdminView extends StatefulWidget {
  const CalendarAdminView({super.key});

  @override
  State<CalendarAdminView> createState() => _CalendarAdminViewState();
}

class _CalendarAdminViewState extends State<CalendarAdminView> {
  late CalendarCubit calendarCubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calendarCubit = CalendarCubit();
    calendarCubit.getCalendarEvent();
  }

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("التقويم"),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24.0),
        child: JBButtonMix(
          padding: const EdgeInsets.symmetric(vertical: 4),
          icon: const Icon(LucideIcons.calendar),
          title: "تعديل",
          onPressed: () => showAdaptiveDialog(
              context: context, builder: (c) => const UpdateCalendarForm()),
        ),
      ),
      body: BlocConsumer<CalendarCubit, CalendarState>(
          bloc: calendarCubit,
          listener: (context, state) {
            // if (state.datastatus == const DataError()) {
            //   showDialog(context: context, builder: (c) => Text("error add"));
            // }
          },
          builder: (context, state) => switch (state.datastatus) {
                StateLoading() || StateIdeal() => const Padding(
                    padding: EdgeInsets.all(16),
                    child: CircularProgressIndicator(),
                  ),
                const StateSucess() => ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: jbGary2),
                        ),
                        child: ListTile(
                          title: Text(state.calendarModel?.hijreYear ?? ""),
                          subtitle: const Text("السنة الهجرية"),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: jbGary2),
                        ),
                        child: ListTile(
                          horizontalTitleGap: 5,
                          leading: Chip(
                            label: Text(
                                state.calendarModel?.hijreeMonth.toString() ??
                                    ""),
                          ),
                          title: Text(
                              state.calendarModel?.hijreeMonthName.toString() ??
                                  ""),
                          subtitle: const Text("الشهر الهجرية"),
                          trailing: Column(children: [
                            const Text("يوم"),
                            Text(
                                state.calendarModel?.hijreeDay.toString() ?? "")
                          ]),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: jbGary2),
                        ),
                        child: ListTile(
                          horizontalTitleGap: 5,
                          leading: Chip(
                            label: Text(
                                state.calendarModel?.meladyMonth.toString() ??
                                    ""),
                          ),
                          title: Text(arabicMonthNames[
                              (state.calendarModel?.meladyMonth ?? 1) - 1]),
                          subtitle: const Text("الشهر الميلادي"),
                          trailing: Column(children: [
                            const Text("يوم"),
                            Text(
                                state.calendarModel?.meladyDay.toString() ?? "")
                          ]),
                        ),
                      ),
                    ],
                  ),
                _ => const Text("error")
              }),
    );
  }
}
