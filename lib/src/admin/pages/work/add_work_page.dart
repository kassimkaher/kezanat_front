import 'package:kezanat_alsama/model/daily_work/daily_work_model.dart';
import 'package:kezanat_alsama/model/quran/quran_sura_model.dart';
import 'package:kezanat_alsama/src/admin/logic/work_cubit/work_crud_cubit.dart';
import 'package:kezanat_alsama/src/core/entity/data_status.dart';
import 'package:kezanat_alsama/src/core/entity/works_document_model.dart';
import 'package:kezanat_alsama/src/core/enum/week_day.dart';
import 'package:kezanat_alsama/src/core/enum/work_timing.dart';
import 'package:kezanat_alsama/src/core/enum/work_type.dart';
import 'package:kezanat_alsama/src/core/resources/validation.dart';
import 'package:kezanat_alsama/src/core/widget/custom_drop_down_input.dart';
import 'package:kezanat_alsama/src/core/widget/custom_drop_down_menu_string.dart';
import 'package:kezanat_alsama/src/core/widget/custom_text_input.dart';
import 'package:kezanat_alsama/src/core/widget/jb_button_mix.dart';
import 'package:kezanat_alsama/src/sheet/alert_dialog.dart';
import 'package:kezanat_alsama/utils/utils.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AddWorkPage extends StatefulWidget {
  const AddWorkPage({super.key, this.dailyWorkData});
  final DailyWorkData? dailyWorkData;
  @override
  State<AddWorkPage> createState() => _AddWorkPageState();
}

class _AddWorkPageState extends State<AddWorkPage> {
  late WorkCrudCubit workCrudCubit;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final textController = TextEditingController();
  String? pathController;
  String? quransuraController;
  String? dayController;
  WeekDay? weekDay;

  String? hour;
  String? monthController;
  final urlController = TextEditingController();
  WorkType? typeController;
  WorkTiming? workTiming;
  final formKey = GlobalKey<FormState>();
  final key = GlobalKey();
  WorksDocumentModel? document;
  @override
  void initState() {
    super.initState();
    //document = context.read<DocumentCubit>().state.zyaratData;
    workCrudCubit = context.read<WorkCrudCubit>();

    if (widget.dailyWorkData != null) {
      fillData(widget.dailyWorkData);
    }
  }

  @override
  Widget build(BuildContext context) {
    // final allSura = context.read<QuranDataCubit>().state.quranSuraModel!;

    final textTheme = Theme.of(context).textTheme;
    return BlocConsumer<WorkCrudCubit, WorkCrudState>(
      bloc: workCrudCubit,
      listener: (context, state) {
        if (state.dataStatus == const StateError()) {
          showTMDialog(
            title: "fail".tr(),
            msg: "connection_error_confirm".tr(),
            icon: const Icon(
              LucideIcons.alertTriangle,
              color: Colors.red,
            ),
          );
        }
        if (state.dataStatus == const DataSucessOperation()) {
          showTMDialog(
            title: "Sucess".tr(),
            msg: "Done Add Work".tr(),
            icon: const Icon(
              LucideIcons.checkCheck,
              color: Colors.green,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("add Work"),
          ),
          body: Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text(
                  "تفاصيل العمل ",
                  style: textTheme.titleMedium!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                const Divider(
                  height: 24,
                ),
                // buildWorkDetailsFormView(document, allSura),
                const SizedBox(height: 32),
                Text(
                  "توقيت العمل ",
                  style: textTheme.titleMedium!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                const Divider(
                  height: 24,
                ),
                CustomDropDownInput(
                  array: WorkTiming.values,
                  selectValue: workTiming,
                  hint: "نوع توقيت العمل",
                  onSelect: (s) {
                    workTiming = s as WorkTiming;
                    setState(() {});
                  },
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Visibility(
                      visible: workTiming != null &&
                          [
                            WorkTiming.dayInmonth,
                            WorkTiming.dailyInMonth,
                            WorkTiming.weeklyInMonth,
                            WorkTiming.oneWeekDayInMonth
                          ].contains(workTiming),
                      child: Expanded(
                        child: CustomDropDownMenuString(
                          array: hijreeMonthArray,
                          selectValue: monthController,
                          hint: " الشهر العربي",
                          onSelect: (s) {
                            monthController = s;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Visibility(
                      visible: workTiming != null &&
                          [WorkTiming.dayInmonth, WorkTiming.oneWeekDayInMonth]
                              .contains(workTiming),
                      child: Expanded(
                        child: CustomDropDownMenuString(
                          array: workTiming != null &&
                                  workTiming == WorkTiming.oneWeekDayInMonth
                              ? ["0", "1"]
                              : List<String>.generate(
                                  30, (i) => (i + 1).toString()),
                          selectValue: dayController,
                          hint: " رقم اليوم",
                          onSelect: (s) {
                            dayController = s;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Visibility(
                      visible: workTiming != null &&
                          [
                            WorkTiming.weekly,
                            WorkTiming.weeklyInMonth,
                            WorkTiming.oneWeekDayInMonth
                          ].contains(workTiming),
                      child: Expanded(
                        child: CustomDropDownInput(
                          array: WeekDay.values,
                          selectValue: weekDay,
                          hint: "يوم الاسبوع",
                          onSelect: (s) {
                            weekDay = s as WeekDay;
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Visibility(
                      visible: workTiming != null,
                      child: Expanded(
                        child: CustomDropDownMenuString(
                          isNullable: true,
                          array: arabic24HourNames,
                          selectValue: hour,
                          hint: "ساعة العمل",
                          onSelect: (s) {
                            hour = s;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                CustomTextInput(
                  controller: urlController,
                  label: " URL",
                  rightPadding: 16,
                  leftPadding: 16,
                ),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16),
            child: JBButtonMix(
              isLoading: state.dataStatus == const StateLoading(),
              icon: Icon(widget.dailyWorkData != null &&
                      widget.dailyWorkData?.id != null
                  ? LucideIcons.edit
                  : LucideIcons.plusCircle),
              title: widget.dailyWorkData != null &&
                      widget.dailyWorkData?.id != null
                  ? "تعديل"
                  : "اضافة العمل ",
              onPressed: () {
                setState(() {});

                if (formKey.currentState!.validate()) {
                  workCrudCubit.submitEvent(
                    DailyWorkData(
                      id: widget.dailyWorkData?.id,

                      title: titleController.text,
                      description: descriptionController.text,
                      text: textController.text,
                      path: pathController == null
                          ? ""
                          : document!.dua!
                              .where(
                                  (element) => element.title == pathController)
                              .first
                              .path,
                      type: typeController!,
                      workTiming: workTiming,
                      isRequired: true,
                      // sura: allSura.surasList.indexWhere((element) =>
                      //     element.suraDetailsModel.suraName ==
                      //     quransuraController),
                      month: getMonthNumber(),
                      weekDay: weekDay,
                      hour:
                          hour != null ? arabic24HourNames.indexOf(hour!) : -1,
                      day: dayController?.toInt(),
                    ),
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }

  int getMonthNumber() => monthController == null
      ? -1
      : hijreeMonthArray.indexOf(monthController!) + 1;
  String? getMonthName(int number) =>
      (number < 0 || number > 11) ? null : hijreeMonthArray[number];

  Column buildWorkDetailsFormView(
      WorksDocumentModel? document, QuranSuraModel allSura) {
    return Column(
      children: [
        CustomTextInput(
          isRequired: ValidatorEnum.required,
          controller: titleController,
          label: "العنوان",
          rightPadding: 16,
          leftPadding: 16,
        ),
        const SizedBox(height: 12),
        CustomTextInput(
          controller: descriptionController,
          label: "شرح العمل",
          rightPadding: 16,
          leftPadding: 16,
        ),
        const SizedBox(height: 12),
        CustomDropDownInput(
          array: WorkType.values
              .where((element) => element != WorkType.relationship)
              .toList(),
          selectValue: typeController,
          hint: "نوع العمل",
          onSelect: (s) {
            typeController = s as WorkType;
            setState(() {});
          },
        ),
        const SizedBox(height: 12),
        typeController == WorkType.tasbeeh
            ? CustomTextInput(
                validator: ValidatorEnum.number,
                controller: textController,
                label: " عدد التسبيح",
                rightPadding: 16,
                leftPadding: 16,
              )
            : CustomTextInput(
                controller: textController,
                label: "نص العمل",
                rightPadding: 16,
                leftPadding: 16,
                maxLine: 3,
              ),
        const SizedBox(height: 12),
        (typeController != WorkType.quran && typeController != WorkType.tasbeeh)
            ? CustomDropDownMenuString(
                array: typeController == WorkType.dua
                    ? document!.dua!.map((e) => e.title!).toList()
                    : typeController == WorkType.zyara
                        ? document!.zyaratList!.map((e) => e.title!).toList()
                        : typeController == WorkType.munajat
                            ? document!.munajatList!
                                .map((e) => e.title!)
                                .toList()
                            : [],
                selectValue: pathController,
                isNullable: textController.text.isNotEmpty ||
                    typeController == WorkType.quran,
                hint: " مسار",
                onSelect: (s) {
                  pathController = s;
                  setState(() {});
                },
              )
            : const SizedBox(),
        const SizedBox(height: 12),
        typeController == WorkType.quran
            ? CustomDropDownMenuString(
                isNullable: true,
                array: allSura.surasList
                    .map((e) => e.suraDetailsModel.suraName)
                    .toList(),
                selectValue: quransuraController,
                hint: " القرآن",
                onSelect: (s) {
                  quransuraController = allSura.surasList
                      .where(
                          (element) => element.suraDetailsModel.suraName == s)
                      .first
                      .suraDetailsModel
                      .suraName;
                },
              )
            : const SizedBox(),
      ],
    );
  }

  void fillData(DailyWorkData? dailyWorkData) {
    // final allSura = context.read<QuranSuraCubit>().state.quranModel!;

    titleController.text = dailyWorkData?.title ?? "";
    descriptionController.text = dailyWorkData?.description ?? "";
    textController.text = dailyWorkData?.text ?? "";

    // try {
    //   quransuraController = dailyWorkData!.sura != null
    //       ? allSura.surasList[dailyWorkData.sura!].suraDetailsModel.suraName
    //       : null;
    // } catch (_) {}

    dayController = dailyWorkData?.day.toString();

    weekDay = dailyWorkData?.weekDay;

    hour = dailyWorkData!.hour != null
        ? arabic24HourNames[dailyWorkData.hour!]
        : null;
    monthController = dailyWorkData.month != null
        ? getMonthName(dailyWorkData.month! - 1)
        : null;
    typeController = dailyWorkData.type;
    workTiming = dailyWorkData.workTiming;

    switch (dailyWorkData.type) {
      case WorkType.dua:
        for (var element in document!.dua!) {
          if (element.path == dailyWorkData.path) {
            pathController = element.title;
          }
        }

        break;
      default:
    }
  }
}
