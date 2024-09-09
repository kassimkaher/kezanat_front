import 'package:kezanat_alsama/utils/utils.dart';

String arabicNum(String number) {
  String res = '';

  final arabics = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
  for (var element in number.characters) {
    res += arabics[int.parse(element)];
  }

/*   final latins = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']; */
  return res;
}
