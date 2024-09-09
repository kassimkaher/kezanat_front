import 'package:kezanat_alsama/model/slider_model.dart';
import 'package:kezanat_alsama/src/admin/entity/entity.dart';
import 'package:kezanat_alsama/src/core/entity/data_state.dart';

class FirestorePost {
  static Map addPost(DailyPostData dailyPostsModel) {
    return {};
  }

  static Future<DataState<PostEntity>> getPostsApi() async {
    return DataSuccess(PostEntity(null));
  }
}
