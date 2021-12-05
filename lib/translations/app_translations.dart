import 'package:e_space_mobile/translations/kaa.dart';
import 'package:e_space_mobile/translations/ru.dart';
import 'package:e_space_mobile/translations/uz.dart';

abstract class AppTranslations {
  static Map<String, Map<String, String>> translations = {
    'kaa': kaa,
    'ru': ru,
    'uz': uz,
  };
}
