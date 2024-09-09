import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kezanat_alsama/model/slider_model.dart';
import 'package:kezanat_alsama/src/admin/data/remote.dart';
import 'package:kezanat_alsama/src/core/entity/data_state.dart';
import 'package:kezanat_alsama/src/core/entity/data_status.dart';

part 'posts_cubit.freezed.dart';
part 'posts_state.dart';

class PostsCRUDCubit extends Cubit<PostsCRUDState> {
  PostsCRUDCubit()
      : super(const PostsCRUDState.initial(datastatus: StateIdeal()));

  getPosts() async {
    emit(state.copyWith(datastatus: const StateLoading()));

    final data = await FirestorePost.getPostsApi();
    if (data is DataSuccess) {
      emit(
        state.copyWith(
          datastatus: const StateSucess(),
          dailyPostsModel: data.data!.dailyPostsModel,
        ),
      );
      return;
    }
    emit(state.copyWith(datastatus: const StateError()));
  }

  addPost(DailyPostData dailyPostData) async {
    emit(state.copyWith(datastatus: const StateLoading()));
    final result = FirestorePost.addPost(dailyPostData);

    if (result is DataFailed) {
      emit(state.copyWith(datastatus: const StateError()));
      return;
    }

    emit(state.copyWith(datastatus: const StateSucess()));
  }

  deletWork(String id) async {
    emit(state.copyWith(datastatus: const StateLoading()));

    try {
      // await state.refrenses
      //     ?.where((element) => element.id == id)
      //     .first
      //     .reference
      //     .delete();
      final posts = state.dailyPostsModel!;

      posts.data!.removeWhere((element) => element.id == id);

      emit(state.copyWith(
          datastatus: const StateSucess(), dailyPostsModel: posts));
    } catch (e) {
      emit(state.copyWith(datastatus: const StateError()));
    }
  }
}
