import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;
  ThemeData _currentTheme = ThemeData.light();

  bool get darkTheme => _darkTheme;
  bool get customTheme => _customTheme;
  ThemeData get currentTheme => _currentTheme;

  ThemeChanger(int theme) {
    switch (theme) {
      case 1:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light().copyWith(
            colorScheme: ThemeData.light()
                .colorScheme
                .copyWith(secondary: (Colors.pink)));
        break;
      case 2:
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark().copyWith(
            colorScheme: ThemeData.dark()
                .colorScheme
                .copyWith(secondary: (Colors.pink)));
        break;
      case 3:
        _darkTheme = false;
        _customTheme = true;
        _currentTheme = ThemeData.light();
        break;
      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
    }
  }
  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;
    if (value) {
      _currentTheme = ThemeData.dark();
    } else {
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }

  set customTheme(bool value) {
    _darkTheme = false;
    _customTheme = value;
    if (value) {
      _currentTheme = ThemeData.dark().copyWith(
        colorScheme: ThemeData.dark().colorScheme.copyWith(
              secondary: (const Color.fromARGB(255, 252, 61, 220)),
            ),
        primaryColorLight: Colors.white,
        scaffoldBackgroundColor: const Color(0xFF16202B),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
        ),
      );
    } else {
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }
}
