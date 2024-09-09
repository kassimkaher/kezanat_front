import 'package:kezanat_alsama/src/core/model/model_abstract.dart';

enum BookType { INDEX, BOOK, CONTENT }

class BookModel implements ModelParser<BookModel> {
  bool? status;
  String? message;
  BookItemModle? data;

  BookModel({this.status, this.message, this.data});

  @override
  BookModel fromJson(Map<dynamic, dynamic> json) {
    final model = BookModel();
    if (json["status"] is bool) {
      model.status = json["status"];
    }
    if (json["message"] is String) {
      model.message = json["message"];
    }
    if (json["data"] != null) {
      model.data = BookItemModle.fromJson(json["data"]);
    }
    return model;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json["status"] = status;
    json["message"] = message;
    json["data"] = data!.toJson();
    return json;
  }
}

class BookItemModle {
  int? id;
  dynamic bookItemId;
  String? bookName;
  String? bookContent;
  String? footerContent;
  String? indexName;
  BookType? bookType;
  bool? isTitle;
  int? page;
  int? juzu;
  String? createAt;
  String? updateAt;
  List<BookItemModle>? children;
  List<NoverlerModel>? noverlers;

  BookItemModle(
      {this.id,
      this.bookItemId,
      this.bookName,
      this.bookContent,
      this.footerContent,
      this.indexName,
      this.bookType,
      this.isTitle,
      this.page,
      this.juzu,
      this.createAt,
      this.updateAt,
      this.children,
      this.noverlers});

  BookItemModle.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    bookItemId = json["book_item_id"];
    if (json["book_name"] is String) {
      bookName = json["book_name"];
    }
    bookContent = json["book_content"];
    footerContent = json["book_footer"];
    indexName = json["index_name"];
    if (json["book_type"] is String) {
      bookType = BookType.values.byName(json["book_type"]);
    }
    if (json["is_title"] is bool) {
      isTitle = json["is_title"];
    }
    if (json["page"] is int) {
      page = json["page"];
    }
    if (json["juzu"] is int) {
      juzu = json["juzu"];
    }
    if (json["create_at"] is String) {
      createAt = json["create_at"];
    }
    if (json["update_at"] is String) {
      updateAt = json["update_at"];
    }
    if (json["children"] is List) {
      children = json["children"] == null
          ? null
          : (json["children"] as List)
              .map((e) => BookItemModle.fromJson(e))
              .toList();
    }

    if (json["noverlers"] is List) {
      noverlers = json["noverlers"] == null
          ? null
          : (json["noverlers"] as List)
              .map((e) => NoverlerModel.fromJson(e))
              .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["book_item_id"] = bookItemId;
    data["book_name"] = bookName;
    data["book_content"] = bookContent;
    try {
      data["book_footer"] = footerContent;
    } catch (e) {}
    data["index_name"] = indexName;
    data["book_type"] = bookType?.name;
    data["is_title"] = isTitle;
    data["page"] = page;
    data["juzu"] = juzu;
    data["create_at"] = createAt;
    data["update_at"] = updateAt;
    if (children != null) {
      data["children"] = children?.map((e) => e.toJson()).toList();
    }
    if (noverlers != null) {
      data["noverlers"] = noverlers?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class NoverlerModel {
  int id;
  String name;
  int rate;
  String? birthDay;
  String? deathDay;
  String createAt;
  String updateAt;

  NoverlerModel({
    required this.id,
    required this.name,
    required this.rate,
    this.birthDay,
    this.deathDay,
    required this.createAt,
    required this.updateAt,
  });

  factory NoverlerModel.fromJson(Map<String, dynamic> json) {
    return NoverlerModel(
      id: json['id'],
      name: json['name'],
      rate: json['rate'],
      birthDay: json['birth_day'],
      deathDay: json['death_day'],
      createAt: json['create_at'],
      updateAt: json['update_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'rate': rate,
      'birth_day': birthDay,
      'death_day': deathDay,
      'create_at': createAt,
      'update_at': updateAt,
    };
  }
}
