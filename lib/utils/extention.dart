import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:kezanat_alsama/src/core/resources/validation.dart';
import 'package:kezanat_alsama/utils/translate.dart';
import 'package:kezanat_alsama/utils/utils.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

extension KQDatime on DateTime {
  String toDayName(local) {
    try {
      final format2 = DateFormat('E', local);
      final d = toLocal();
      final date = format2.format(d);
      return date;
    } catch (e) {
      return "N";
    }
  }
}

extension RText on String {
  Widget toGradiant(
      {required TextStyle style,
      required List<Color> colors,
      TextAlign? textAlign}) {
    return GradientText(this,
        style: style, textAlign: textAlign ?? TextAlign.start, colors: colors);
  }
}

extension KQ on String {
  String tr() {
    return Translation.lang == Lang.arbic
        ? Translation.arabicTranslate[this] ?? this
        : Translation.englishString[this] ?? this;
  }

  String toDate(local) {
    try {
      final format2 = DateFormat('E d MMM yyyy , h:mm a', local);
      final d = DateTime.parse(this).toLocal();
      final date = format2.format(d);
      return date;
    } catch (e) {
      return this;
    }
  }

  int? toInt() {
    return int.tryParse(this);
  }

  String toPrice() {
    if (length > 2) {
      var value = this;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
      return value;
    }
    return this;
  }

  String clearText() {
    if (replaceAll(" ", "").isNotEmpty) {
      return this;
    }
    return "";
  }

  double? getnum() {
    String? num = replaceAll(RegExp(r'[^0-9]'), '');

    try {
      return num.isEmpty ? null : double.tryParse(num);
    } catch (e) {
      return null;
    }
  }

  String? getTextOnly() =>
      isEmpty ? null : replaceAll(RegExp(r'[^a-zء-ي]'), '');

  double toTimeZone() {
    final isMinus = contains("-");
    final number = double.parse(replaceAll("+", "").replaceAll("-", "+"));
    return number * (isMinus ? -1 : 1);
  }

  String toEnglishNumber() {
    return getEnglishNumber(this);
  }
}

extension Dgree on double {
  double toDgree() {
    return this * (pi / 180);
  }
}

extension KQI on int {
  String toPrice() {
    if (toString().length > 2) {
      var value = toString();
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
      return value;
    }
    return toString();
  }
}

extension KQD on double {
  double finalPrice(double wallerBalance) {
    double finalprice = 0;
    finalprice = wallerBalance - this;
    if (finalprice >= 0) {
      return 0;
    }
    return finalprice * -1;
  }

  String toPrice() {
    final price = toQuantity();

    if (price.length > 2) {
      var value = toInt().toString();
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
      return value;
    }
    return price;
  }

  String toQuantity() {
    final numb = this % 1;
    if (numb > 0) {
      return toString();
    }

    return toInt().toString();
  }
}

kdp({required name, required msg, required c}) {
  final col = {
    "r": "\x1B[31m",
    "gr": "\x1B[32m",
    "y": "\x1B[33m",
    "cy": "\x1B[36m",
    "b": "\x1B[34m",
    "m": "\x1B[35m"
  };
  final e = {
    "r": "🥵",
    "gr": "📗",
    "y": "😨",
    "cy": "🧑🏻‍🎤",
    "b": "👨🏻‍🏭",
    "m": "👩🏻‍🎤"
  };

  log("\x1B[37m ${e[c]} $name: ${col[c]}  $msg");
}

extension FarsiNumberExtension on String {
  String get arabicNumber {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const farsi = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    String text = this;
    for (int i = 0; i < english.length; i++) {
      text = text.replaceAll(english[i], farsi[i]);
    }
    return text;
  }
}

int getSeconds(hour, minute, second) {
  final s = second;
  final s1 = minute * 60;
  final s2 = hour * 60 * 60;
  return s + s1 + s2;
}

String getTimeFormat(
    {required int hour, required int minut, required int seconds}) {
  String hourLeft = hour.toString().length < 2 ? "0$hour" : hour.toString();

  String minuteLeft =
      minut.toString().length < 2 ? "0$minut" : minut.toString();

  String secondsLeft =
      seconds.toString().length < 2 ? "0$seconds" : seconds.toString();

  String result = "$hourLeft:$minuteLeft:$secondsLeft";
  return result.arabicNumber;
}

String getTimeFormatWithoutSecond(
    {required int hour, required int minut, required int seconds}) {
  hour = hour > 12 ? hour - 12 : hour;
  String hourLeft = hour.toString().length < 2 ? "0$hour" : hour.toString();

  String minuteLeft =
      minut.toString().length < 2 ? "0$minut" : minut.toString();

  String result = "$hourLeft:$minuteLeft";
  return result.arabicNumber;
}
