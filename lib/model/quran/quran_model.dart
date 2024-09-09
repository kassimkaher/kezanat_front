import 'package:kezanat_alsama/model/quran/quran_juzu_model.dart';
import 'package:kezanat_alsama/utils/extention.dart';

class SuraDetailsModel {
  final int id;
  final int suraNumber;
  final String suraName;
  final int count;

  SuraDetailsModel({
    required this.id,
    required this.suraNumber,
    required this.suraName,
    required this.count,
  });

  factory SuraDetailsModel.fromJson(Map<dynamic, dynamic> json) {
    return SuraDetailsModel(
      id: json['id'],
      suraNumber: json['sura_number'],
      suraName: json['sura_name'],
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sura_number': suraNumber,
      'sura_name': suraName,
      'count': count,
    };
  }
}

class AyahModel {
  final int id;
  final int suraId;
  final String text;
  final int number;
  final int page;
  final Sajda sajda;
  final bool isBook;
  final int juzu;

  final SuraDetailsModel sura;

  AyahModel({
    required this.id,
    required this.suraId,
    required this.text,
    required this.number,
    required this.page,
    required this.sajda,
    required this.isBook,
    required this.juzu,
    required this.sura,
  });

  factory AyahModel.fromJson(Map<dynamic, dynamic> json) {
    try {
      // kdp(
      //     name: "AyahModel",
      //     msg: "juzu${json['juzu']}=page ${json['page']}",
      //     c: 'gr');
      return AyahModel(
        id: json['id'],
        suraId: json['sura_id'],
        text: json['text'],
        number: json['number'],
        page: json['page'],
        sajda: Sajda.values.byName(json['sajda']),
        isBook: json['is_book'],
        juzu: json['juzu'],
        sura: SuraDetailsModel.fromJson(json['sura']),
      );
    } catch (e) {
      kdp(name: "AyahModel", msg: "error $e==$json", c: 'r');
      return AyahModel(
        id: 0,
        suraId: 0,
        text: '',
        number: 0,
        page: 0,
        sajda: Sajda.NONE,
        isBook: false,
        juzu: 0,
        sura: SuraDetailsModel(
          id: 0,
          suraNumber: 0,
          suraName: '',
          count: 0,
        ),
      );
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sura_id': suraId,
      'text': text,
      'number': number,
      'page': page,
      'sajda': sajda.name,
      'is_book': isBook,
      'juzu': juzu,
      'sura': sura.toJson(),
    };
  }
}

class QuranResponse {
  final bool status;
  final String message;
  final List<AyahModel> data;

  QuranResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory QuranResponse.fromJson(Map<dynamic, dynamic> json) {
    return QuranResponse(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => AyahModel.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

class ContinuQuranModel {
  int? page;
  int? ayaNumber;
  String? nameSura;

  int? juzuNumber;

  ContinuQuranModel(
      {this.page, this.ayaNumber, this.nameSura, this.juzuNumber});

  ContinuQuranModel.fromJson(Map<dynamic, dynamic> json) {
    page = json['pageNumber'];
    ayaNumber = json['ayaNumber'];
    nameSura = json['name_sura'];

    juzuNumber = json['juzuNumber'];
  }

  int pageIndex(List<JuzuPagesModel> juzuPages) {
    final indexOfPage =
        juzuPages.indexWhere((element) => element.pageNumber == page);

    return indexOfPage;
  }

  int ayaIndex(List<JuzuPagesModel> juzuPages) {
    final indexOfPage =
        juzuPages.indexWhere((element) => element.pageNumber == page);

    final indexOfAya = juzuPages[indexOfPage]
        .ayahs!
        .indexWhere((element) => element.number == ayaNumber);
    return indexOfAya == -1 ? 0 : indexOfAya;
  }

  double pageNumber(List<JuzuPagesModel> juzuPages) {
    final indexOfPage =
        juzuPages.indexWhere((element) => element.pageNumber == page);

    return indexOfPage / juzuPages.length;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['pageNumber'] = page;
    data['ayaNumber'] = ayaNumber;
    data['name_sura'] = nameSura;

    data['juzuNumber'] = juzuNumber;

    return data;
  }
}

enum Sajda { NONE, OPTIONAL, REQUIRED }
