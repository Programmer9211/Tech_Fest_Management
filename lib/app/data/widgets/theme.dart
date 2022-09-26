

import 'package:tech_fest_management/app/data/get_storage/get_storage.dart';

import '../../../const/app_const/app_keys.dart';

abstract class AppTheme {
  static bool isDarkMode = false;

  static void setAppTheme() {
    isDarkMode = Storage.getCurrentTheme == AppKeys.darkTheme;
  }
}
