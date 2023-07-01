import 'package:flutter/material.dart';
import 'package:flutter_disenos/src/models/layout_model.dart';
import 'package:flutter_disenos/src/pages/launcher_page.dart';
import 'package:flutter_disenos/src/pages/launcher_page_table.dart';
import 'package:flutter_disenos/src/theme/theme_changer.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeChanger(1)),
          ChangeNotifierProvider(create: (_) => LayoutModel())
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          final screenSize = MediaQuery.of(context).size;
          if (screenSize.width > 500) {
            return const LauncherTabletPage();
          } else {
            return const LauncherScreen();
          }
        },
      ),
    );
  }
}
