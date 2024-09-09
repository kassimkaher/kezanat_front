import 'package:kezanat_alsama/model/quran/quran_model.dart';
import 'package:kezanat_alsama/utils/extention.dart';

class QuranSuraModel {
  late List<SuraModel> surasList;

  QuranSuraModel.parse(List<AyahModel> quranAyahs) {
    surasList = [];

    for (var i = 1; i < 115; i++) {
      try {
        //  final suraAyat = groupBy(quranAyahs, (item) => item.page).values.toList();

        final suraAyat =
            quranAyahs.where((element) => element.sura.id == i).toList();
        surasList.add(
            SuraModel(suraDetailsModel: suraAyat.first.sura, ayahs: suraAyat));
      } catch (e) {
        kdp(
            name: "QuranSuraModel ",
            msg: '''
surah number $i
error $e

''',
            c: 'r');
      }
    }
  }
}

class SuraModel {
  SuraDetailsModel suraDetailsModel;
  List<AyahModel> ayahs;

  SuraModel({required this.suraDetailsModel, required this.ayahs});
}
