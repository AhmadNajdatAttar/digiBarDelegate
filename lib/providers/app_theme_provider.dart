import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeProvider extends ChangeNotifier {
  bool isDark = false;
  bool get getIsDark => isDark;

  switchTheme() async {
    isDark = !isDark;
    notifyListeners();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('isDark', isDark);
  }
}
