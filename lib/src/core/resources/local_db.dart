import 'package:external_path/external_path.dart';
import 'package:kezanat_alsama/model/daily_work/calendar_model.dart';
import 'package:kezanat_alsama/model/daily_work/daily_work_model.dart';
import 'package:kezanat_alsama/model/quran/quran_model.dart';
import 'package:kezanat_alsama/model/slider_model.dart';
import 'package:kezanat_alsama/src/core/entity/tasbeeh_model.dart';
import 'package:kezanat_alsama/src/core/model/model_abstract.dart';
import 'package:kezanat_alsama/utils/utils.dart';
import 'package:path_provider/path_provider.dart';

class LocalDB {
  static Box? db;

  LocalDB() {
    //kdp(name: "chek lcal db", msg: "ini", c: 'y');
    inite();
  }
  static Future<bool> inite() async {
    db = await Hive.openBox('kezana_alsama_local_data');
    // kdp(name: "chek lcal db", msg: "done", c: 'gr');

    return true;
  }

  static clearData() {
    if (db != null) {
      db!.clear();
    }
  }

  static ContinuQuranModel? getContinu() {
    if (db == null) {
      return null;
    }
    final data = db?.get("continu_quran");
    if (data == null) {
      return null;
    }
    return ContinuQuranModel.fromJson(data);
  }

  static setContinu(ContinuQuranModel value) {
    if (db == null) {
      return;
    }

    db!.put("continu_quran", value.toJson());
  }

  static DailyPostsModel? getPosts() {
    if (db == null) {
      return null;
    }
    final data = db?.get("post_data_storage");

    return DailyPostsModel.fromJson(data);
  }

  static setPosts(DailyPostsModel value) {
    if (db == null) {
      return;
    }

    db!.put("post_data_storage", value.toJson());
  }

  static DailyWorkModel? getDailyWorkFromLocal() {
    if (db == null) {
      return null;
    }
    final data = db?.get("daily_work_data_storage");

    return DailyWorkModel.fromJson(data);
  }

  static setDailyWorkFromLocal(DailyWorkModel value) {
    if (db == null) {
      return;
    }

    db!.put("daily_work_data_storage", value.toJson());
  }

  static CalendarModel? getCalendar() {
    if (db == null) {
      return null;
    }
    final data = db?.get("calendar_data_storage");

    return CalendarModel.fromJson(data);
  }

  static setCalendar(CalendarModel value) {
    if (db == null) {
      return;
    }

    db!.put("calendar_data_storage", value.toJson());
  }

  static int? getIsSetNotification() {
    if (db == null) {
      //kdp(name: "notification chek is set", msg: "null", c: 'r');
      return null;
    }
    final data = db?.get("getIsSetNotificationNew");

    return data;
  }

  static setIsSetNotification(int value) {
    if (db == null) {
      return;
    }

    db!.put("getIsSetNotificationNew", value);
  }

  static TasbeehLocalModel? getTasbeehCache() {
    if (db == null) {
      return null;
    }
    final data = db?.get("tasbeeh_data_storage") as Map<dynamic, dynamic>?;

    return data == null ? null : TasbeehLocalModel.fromJson(data);
  }

  static setTasbeehCache(TasbeehLocalModel value) {
    if (db == null) {
      return;
    }

    db!.put("tasbeeh_data_storage", value.toJson());
  }

  static QuranResponse? getLocalQuranData({required String key}) {
    final data = db?.get(key);

    if (data == null) {
      return null;
    }

    return QuranResponse.fromJson(data);
  }

  static saveLocalQuranJuzu(QuranResponse value, {required String key}) {
    try {
      db?.put(key, value.toJson());
    } catch (e) {
      kdp(name: "saveLocalQuranJuzu", msg: "error $e", c: 'r');
    }
  }

  static T? getLocalBook<T extends ModelParser<T>>({
    required String key,
    required T Function(Map<dynamic, dynamic>) fromJson,
  }) {
    final data = db?.get(key);

    if (data == null) {
      return null;
    }

    return fromJson(data);
  }

  static saveLocalBook<T extends ModelParser<T>>({
    required T value,
    required String key,
  }) {
    db?.put(key, value.toJson());
  }

  static saveComeNotefication(String value) {
    db?.put("local_notification", value);
  }

  static Future<bool> getBackup() async {
    File backubFile = File(await getExternalPathBacubHive());

    Directory appDocDir = await getApplicationDocumentsDirectory();

    // Define the path to the Hive data directory within the documents directory
    String hiveDataDirectoryPath =
        '${appDocDir.path}/kezana_alsama_local_data.hive';
    final hiveFile = File(hiveDataDirectoryPath);

    if (hiveFile.existsSync()) {
      kdp(name: "getDataBaseFile", msg: "hiveFile exsist", c: "gr");
      return true;
    }
    if (await backubFile.exists()) {
      await hiveFile.writeAsBytes(await backubFile.readAsBytes());

      kdp(name: "getDataBaseFile", msg: "backubFile exsist", c: "gr");
      return true;
    }
    kdp(name: "getDataBaseFile", msg: "any file not exsist", c: "r");
    return false;
  }

  static Future<String> getExternalPathBacubHive() async {
    final direc = Directory(
        "${await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOCUMENTS)}/kezanat_alsama");
    // final direc = await Directory.systemTemp.createTemp('kezanat_alsama');
    // if (direc.existsSync()) {
    //   return '${direc.path}/_kezanat_alsamabackup.hive';
    // }
    // await direc.create(recursive: true);

    return direc.path;
  }

  static void saveBookReading({int? key, required int page}) {
    if (db == null) {
      return;
    }

    db!.put("book_reading_$key", page);
  }

  static int getrBookReading({int? key}) {
    if (db == null) {
      return 0;
    }
    final data = db?.get("book_reading_$key");

    return data ?? 0;
  }
}
