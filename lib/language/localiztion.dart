import 'package:dummy_shop/language/ar.dart';
import 'package:dummy_shop/language/en.dart';
import 'package:dummy_shop/language/fr.dart';
import 'package:dummy_shop/utils/my_string.dart';
import 'package:get/route_manager.dart';


class LocalizationApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ene: en,
        ara: ar,
        frf: fr,
      };
}