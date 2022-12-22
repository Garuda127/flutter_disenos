import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_disenos/src/pages/emergency_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light().copyWith(
            appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Color(0xff536DFE),
                    systemNavigationBarIconBrightness: Brightness.dark))),
        debugShowCheckedModeBanner: false,
        title: 'Diseños App',
        home: const EmergencyPage());
  }
}
