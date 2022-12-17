import 'package:flutter/material.dart';
import 'package:flutter_disenos/src/pages/graficas_circulares_page.dart';

// import 'package:disenos/src/pages/headers_page.dart';
// import 'package:disenos/src/pages/animaciones_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Disposed App',
        home: GraficasCircularesPage());
  }
}
