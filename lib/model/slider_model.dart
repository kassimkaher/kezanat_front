class DailyPostsModel {
  List<DailyPostData>? data;
  DateTime? dateTime;
  DailyPostsModel({this.data, this.dateTime});
  DailyPostsModel.fromJson(dynamic json) {
    try {
      dateTime = DateTime.tryParse(json['dateTime'].toString());
    } catch (_) {}
    data = [];
    try {
      json['data'].forEach((e) => data!.add(DailyPostData.fromJson(e)));
    } catch (_) {}
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    List<Map<dynamic, dynamic>> datajson = [];
    data?.forEach((e) => datajson.add(e.toJson()));
    json['dateTime'] = dateTime;
    json['data'] = datajson;

    return json;
  }
}

class DailyPostData {
  String? id;
  String? author;
  String? title;
  String? description;
  String? image;
  int? date;

  DailyPostData(
      {this.author,
      this.title,
      this.description,
      this.image,
      this.date,
      this.id});

  DailyPostData.fromJson(dynamic json) {
    id = json['id'];
    author = json['author'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['date'] = date;
    data['id'] = id;
    return data;
  }
}
