import 'package:flutter/material.dart';
import 'package:flutter_disenos/src/pages/slideshow_page.dart';

class LayoutModel with ChangeNotifier {
  Widget _currentPage = const SlideShowScreen();

  set currentPage(Widget page) {
    _currentPage = page;
    notifyListeners();
  }

  Widget get currentPage => _currentPage;
}
