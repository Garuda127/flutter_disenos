import 'package:flutter/material.dart';
import 'package:flutter_disenos/src/routes/routes.dart';
import 'package:flutter_disenos/src/theme/theme_changer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherScreen extends StatelessWidget {
  const LauncherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Scaffold(
        appBar: AppBar(
            title: const Text('Flutter'),
            backgroundColor: appTheme.currentTheme.colorScheme.secondary),
        drawer: _MenuPrincipal(),
        body: _ListaOpciones());
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
        onTap: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => pageRoute[i].page)),
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
