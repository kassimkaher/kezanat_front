import 'package:kezanat_alsama/src/core/model/model_abstract.dart';
import 'package:kezanat_alsama/utils/extention.dart';

class CustomBookModel implements ModelParser<CustomBookModel> {
  bool? status;
  String? message;
  List<CustomBookCategory>? data;

  CustomBookModel({this.status, this.message, this.data});

  @override
  CustomBookModel fromJson(Map<dynamic, dynamic> json) {
    final model = CustomBookModel();
    if (json["status"] is bool) {
      model.status = json["status"];
    }
    if (json["message"] is String) {
      model.message = json["message"];
    }
    if (json["data"] is List) {
      model.data = json["data"] == null
          ? null
          : (json["data"] as List)
              .map((e) => CustomBookCategory.fromJson(e))
              .toList();
    }
    return model;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = <String, dynamic>{};
    jsonData["status"] = status;
    jsonData["message"] = message;
    jsonData["data"] = data?.map((e) => e.toJson()).toList();
    return jsonData;
  }
}

class CustomBookCategory {
  late int id;
  late String name;
  dynamic parentId;

  List<CustomBookCategory>? subcategories;
  List<BookContent>? nahjAlBalagha;
  late String type;
  CustomBookCategory({
    required this.id,
    required this.name,
    this.parentId,
    this.subcategories,
    this.nahjAlBalagha,
    required this.type,
  });

  CustomBookCategory.fromJson(Map<dynamic, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    parentId = json["parentId"];
    type = json["type"];
    if (json["subcategories"] is List) {
      subcategories = json["subcategories"] == null
          ? null
          : (json["subcategories"] as List)
              .map((e) => CustomBookCategory.fromJson(e))
              .toList();
    }
    if (json["bookItem"] is List) {
      nahjAlBalagha = json["bookItem"] == null
          ? null
          : (json["bookItem"] as List)
              .map((e) => BookContent.fromJson(e))
              .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["parentId"] = parentId;

    if (subcategories != null) {
      data["subcategories"] = subcategories?.map((e) => e.toJson()).toList();
    }
    if (nahjAlBalagha != null) {
      data["bookItem"] = nahjAlBalagha?.map((e) => e.toJson()).toList();
    }
    data["type"] = type;
    return data;
  }
}

class BookContent {
  int? id;
  int? categoryId;
  String? text;
  String? createAt;
  String? updateAt;
  late bool isTitle;

  BookContent(
      {this.id,
      this.categoryId,
      this.text,
      this.createAt,
      this.updateAt,
      this.isTitle = false});

  BookContent.fromJson(Map<dynamic, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["category_id"] is int) {
      categoryId = json["category_id"];
    }
    if (json["text"] is String) {
      text = json["text"];
    }
    if (json["createAt"] is String) {
      createAt = json["createAt"];
    }
    if (json["updateAt"] is String) {
      updateAt = json["updateAt"];
    }
    try {
      isTitle = json["is_title"];
    } catch (e) {
      kdp(
          name: "NahjAlBalaghaContent froomjson",
          msg: '''
error=> $e
json=> $json
''',
          c: 'r');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["category_id"] = categoryId;
    data["text"] = text;
    data["createAt"] = createAt;
    data["updateAt"] = updateAt;
    data["is_title"] = isTitle;
    return data;
  }
}

const nahjAlbalagahKey = "nahjAlbalagahKey";
const sahefaAlsajadeaKey = "sahefaAlsajadeaKey";
const esoolAlkafeeKey = "esool_alkafee_key";
const adhwaaOnHusseinBook = "adhwaa_on_hussein_revolution_key";
