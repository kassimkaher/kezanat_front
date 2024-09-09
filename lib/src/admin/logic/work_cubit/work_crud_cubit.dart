import 'dart:convert';
import 'dart:developer';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kezanat_alsama/model/daily_work/daily_work_model.dart';
import 'package:kezanat_alsama/model/ramadan_dua.dart';
import 'package:kezanat_alsama/src/core/data_source/remote.dart';
import 'package:kezanat_alsama/src/core/entity/data_state.dart';
import 'package:kezanat_alsama/src/core/entity/data_status.dart';
import 'package:kezanat_alsama/src/core/entity/work_entity.dart';
import 'package:kezanat_alsama/src/core/enum/work_timing.dart';
import 'package:kezanat_alsama/utils/utils.dart';

part 'work_crud_cubit.freezed.dart';
part 'work_crud_state.dart';

@Singleton()
class WorkCrudCubit extends Cubit<WorkCrudState> {
  WorkCrudCubit()
      : super(const WorkCrudState.initial(dataStatus: StateIdeal()));
  getMufatehALgynan() async {
    emit(state.copyWith(dataStatus: const StateLoading()));
    try {
      final String response =
          await rootBundle.loadString('assets/docs/dua.json');
      final jsondata = await json.decode(response);
      final mufatehAljynanModel = MufatehAljynanModel.fromJson(jsondata);

      emit(
        state.copyWith(
            dataStatus: const StateIdeal(),
            mufatehAljynanModel: mufatehAljynanModel),
      );
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(dataStatus: const StateError()));
    }
  }

  submitEvent(DailyWorkData dailyWorkData) async {
    // if (dailyWorkData.id != null && dailyWorkData.refrence != null) {
    //   updateWork(dailyWorkData);
    //   return;
    // }
    // addNewWork(dailyWorkData);
  }

  addNewWork(DailyWorkData dailyWorkData) async {
    emit(state.copyWith(dataStatus: const StateLoading()));

    final result = await FireStoreRemote.addWork(dailyWorkData);

    if (result is DataFailed) {
      emit(state.copyWith(dataStatus: const StateError()));
      return;
    }

    // dailyWorkData.refrence = result.data;

    emit(state.copyWith(
        dataStatus: const DataSucessOperation(), dailyWorkData: dailyWorkData));
    emit(state.copyWith(dataStatus: const StateSucess()));
    add(state.dailyWorkData!);
  }

  updateWork(DailyWorkData dailyWorkData) async {
    emit(state.copyWith(dataStatus: StateLoading(data: dailyWorkData.id)));

    final result =
        await FireStoreRemote.updateWork(dailyWorkData: dailyWorkData);

    if (result is DataFailed) {
      emit(state.copyWith(dataStatus: const StateError()));
      return;
    }

    emit(state.copyWith(
        dataStatus: const DataSucessOperation(), dailyWorkData: dailyWorkData));
    emit(state.copyWith(dataStatus: const StateSucess()));
  }

  getWorkData() async {
    emit(state.copyWith(dataStatus: const StateLoading()));

    final data = await FireStoreRemote.getWorkspi();
    if (data is DataSuccess) {
      emit(state.copyWith(
          dataStatus: const StateSucess(),
          worksData: data.data,
          workListModel: data.data?.dailyWorkModel));

      return;
    }
    emit(state.copyWith(dataStatus: const StateError()));
  }

  deletWork(String id) async {
    emit(state.copyWith(dataStatus: StateLoading(data: id)));

    try {
      // await state.worksData!.refrenses
      //     ?.where((element) => element.id == id)
      //     .first
      //     .reference
      //     .delete();

      state.worksData?.dailyWorkModel?.data
          ?.removeWhere((element) => element.id == id);

      emit(state.copyWith(
          dataStatus: const DataSucessOperation(),
          workListModel: state.worksData?.dailyWorkModel));
      emit(state.copyWith(dataStatus: const StateSucess()));
    } catch (e) {
      emit(state.copyWith(dataStatus: const StateError()));
      emit(state.copyWith(dataStatus: const StateSucess()));
    }
  }

  deletRelation(String id) async {
    emit(state.copyWith(dataStatus: StateLoading(data: id)));

    try {
      // await state.worksData!.refrenses
      //     ?.where((element) => element.id == id)
      //     .first
      //     .reference
      //     .delete();
      state.worksData?.dailyWorkModel?.data
          ?.removeWhere((element) => element.id == id);

      emit(state.copyWith(
          dataStatus: const DataSucessOperation(),
          workListModel: state.worksData?.dailyWorkModel));
      emit(state.copyWith(dataStatus: const StateSucess()));
    } catch (e) {
      emit(state.copyWith(dataStatus: const StateError()));
    }
  }

  void add(DailyWorkData dailyWorkData) {
    final index = state.worksData?.dailyWorkModel?.data
            ?.indexWhere((element) => element.id == dailyWorkData.id) ??
        -1;
    if ((state.worksData?.dailyWorkModel?.data?.isEmpty ?? false) ||
        index == -1) {
      state.worksData!.dailyWorkModel!.data!.insert(0, dailyWorkData);
    } else {
      state.worksData?.dailyWorkModel?.data?[index] = dailyWorkData;
    }

    emit(state.copyWith(
        dataStatus: const StateSucess(),
        workListModel: state.worksData?.dailyWorkModel));
    return;
  }

  void filterData(int tab) {
    if (tab == 0) {
      emit(state.copyWith(workListModel: state.worksData?.dailyWorkModel));
      return;
    }

    emit(state.copyWith(
        workListModel: DailyWorkModel(
            data: state.worksData?.dailyWorkModel?.data
                ?.where((element) =>
                    element.workTiming == WorkTiming.values[tab - 1])
                .toList())));
  }
}
