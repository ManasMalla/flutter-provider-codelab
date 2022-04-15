import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeProvider extends ChangeNotifier {
  var themeMode = Brightness.dark;
  changeToLightTheme() {
    themeMode = Brightness.light;
    notifyListeners();
  }

  changeToDarkTheme() {
    themeMode = Brightness.dark;
    notifyListeners();
  }
}

class AppTheme {
  static Brightness mode = Brightness.light;
  init(BuildContext context) {
    Provider.of<ThemeProvider>(context, listen: true).addListener(() {
      mode = Provider.of<ThemeProvider>(context, listen: false).themeMode;
    });
  }
}
