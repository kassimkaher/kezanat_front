class MufatehAljynanModel {
  List<DuaEntity>? dua;

  MufatehAljynanModel({this.dua});

  MufatehAljynanModel.fromJson(Map<String, dynamic> json) {
    if (json['dua'] != null) {
      dua = <DuaEntity>[];
      json['dua'].forEach((v) {
        dua!.add(DuaEntity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dua != null) {
      data['dua'] = dua!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DuaEntity {
  String? title;
  String? path;
  String? text;
  String? desc;
  String? type;

  DuaEntity({this.title, this.path, this.text, this.desc, this.type});

  DuaEntity.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    path = json['path'];
    text = json['text'];
    desc = json['desc'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['path'] = path;
    data['text'] = text;
    data['desc'] = desc;
    data['type'] = type;
    return data;
  }
}
