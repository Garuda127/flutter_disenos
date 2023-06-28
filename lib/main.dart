import 'package:flutter/material.dart';
import 'package:flutter_disenos/src/pages/launcher.page.dart';
import 'package:flutter_disenos/src/theme/theme_changer.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
    create: (_) => ThemeChanger(1), child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: const LauncherScreen(),
    );
  }
}
