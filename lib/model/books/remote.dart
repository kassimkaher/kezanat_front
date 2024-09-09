import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:kezanat_alsama/model/books/books_model.dart';
import 'package:kezanat_alsama/src/core/resources/local_db.dart';
import 'package:kezanat_alsama/utils/utils.dart';

@injectable
class BookDataSource {
  Future<BookModel?> getBookDataSource({required String key}) async {
    // final localCache = LocalDB.getLocalBook(
    //     key: key, fromJson: (json) => BookModel().fromJson(json));
    // if (localCache != null) {
    //   return localCache;
    // }

    try {
      final String response =
          await rootBundle.loadString('assets/docs/books/$key.json');
      final bookModel = BookModel().fromJson(json.decode(response));
      LocalDB.saveLocalBook(key: key, value: bookModel);

      return bookModel;
    } catch (e) {
      kdp(name: "book =$key ", msg: "error $e", c: 'r');
    }
    return null;
  }
}
