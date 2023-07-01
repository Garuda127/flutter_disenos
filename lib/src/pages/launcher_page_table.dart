import 'package:flutter/material.dart';
import 'package:flutter_disenos/src/models/layout_model.dart';
import 'package:flutter_disenos/src/routes/routes.dart';
import 'package:flutter_disenos/src/theme/theme_changer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherTabletPage extends StatelessWidget {
  const LauncherTabletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final layoutModel = Provider.of<LayoutModel>(context);
    return Scaffold(
        appBar: AppBar(
            title: const Text('LauncherTabletPage'),
            backgroundColor: appTheme.currentTheme.colorScheme.secondary),
        drawer: _MenuPrincipal(),
        body: Row(
          children: [
            SizedBox(
              width: 300,
              height: double.infinity,
              child: _ListaOpciones(),
            ),
            Container(
              width: 0.5,
              height: double.infinity,
              color: (appTheme.darkTheme)
                  ? Colors.grey
                  : appTheme.currentTheme.colorScheme.secondary,
            ),
            Expanded(
              child: layoutModel.currentPage,
            )
          ],
        ));
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(
          pageRoute[i].icon,
          color: appTheme.colorScheme.secondary,
        ),
        title: Text(pageRoute[i].titulo),
        trailing: Icon(
          Icons.chevron_right,
          color: appTheme.colorScheme.secondary,
        ),
        onTap: () {
          final layoutModel = Provider.of<LayoutModel>(context, listen: false);
          layoutModel.currentPage = pageRoute[i].page;
        },
      ),
      itemCount: pageRoute.length,
      separatorBuilder: (context, i) => Divider(
        color: appTheme.primaryColorLight,
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final secondaryColor = appTheme.currentTheme.colorScheme.secondary;
    return Drawer(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: 200,
              child: CircleAvatar(
                  backgroundColor: secondaryColor,
                  child: const Text(
                    'ML',
                    style: TextStyle(fontSize: 50),
                  )),
            ),
          ),
          Expanded(child: _ListaOpciones()),
          ListTile(
            leading: Icon(
              Icons.lightbulb_outline,
              color: secondaryColor,
            ),
            title: const Text('Dark Mode'),
            trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                activeColor: secondaryColor,
                onChanged: (value) => appTheme.darkTheme = value),
          ),
          ListTile(
            leading: Icon(
              Icons.add_to_home_screen,
              color: secondaryColor,
            ),
            title: const Text('Custom Theme'),
            trailing: Switch.adaptive(
                value: appTheme.customTheme,
                activeColor: secondaryColor,
                onChanged: (value) => appTheme.customTheme = value),
          )
        ],
      ),
    );
  }
}
