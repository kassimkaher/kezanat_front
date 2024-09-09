// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:ramadan/src/main_app/quran/data/model/oquran_model.dart';
// import 'package:ramadan/utils/extention.dart';

import 'package:collection/collection.dart';
import 'package:kezanat_alsama/model/quran/quran_model.dart';

class QuranJuzuModel {
  late List<JuzuModel> juzu;

  QuranJuzuModel.parse(List<AyahModel> quranAyahs) {
    juzu = [];

    for (var i = 1; i < 31; i++) {
      final juzuAyhat =
          quranAyahs.where((element) => element.juzu == i).toList();

      juzu.add(JuzuModel.parse(juzuAyhat));
    }
  }
}

class JuzuModel {
  late List<JuzuPagesModel> juzuPages;
  late List<AyahModel> juzuAyat;
  late int juzuNumber;
  JuzuModel.parse(List<AyahModel> quranAyahs) {
    juzuPages = [];

    juzuAyat = quranAyahs;
    juzuNumber = quranAyahs.first.juzu;

    final allPages = groupBy(quranAyahs, (item) => item.page).values.toList();

    for (var page in allPages) {
      juzuPages.add(JuzuPagesModel(page, page.first.page));
    }
  }
}

class JuzuPagesModel {
  late int pageNumber;
  late List<AyahModel>? ayahs;
  JuzuPagesModel(this.ayahs, this.pageNumber);
}
