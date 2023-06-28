import 'package:flutter/material.dart';
import 'package:flutter_disenos/src/routes/routes.dart';
import 'package:flutter_disenos/src/theme/theme_changer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherScreen extends StatelessWidget {
  const LauncherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter'),
        ),
        drawer: _MenuPrincipal(),
        body: _ListaOpciones());
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(
          pageRoute[i].icon,
          color: Colors.blue,
        ),
        title: Text(pageRoute[i].titulo),
        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.blue,
        ),
        onTap: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => pageRoute[i].page)),
        },
      ),
      itemCount: pageRoute.length,
      separatorBuilder: (context, i) => const Divider(
        color: Colors.blue,
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Drawer(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: 200,
              child: const CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(
                    'ML',
                    style: TextStyle(fontSize: 50),
                  )),
            ),
          ),
          Expanded(child: _ListaOpciones()),
          ListTile(
            leading: const Icon(
              Icons.lightbulb_outline,
              color: Colors.blue,
            ),
            title: const Text('Dark Mode'),
            trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                activeColor: Colors.blue,
                onChanged: (value) => appTheme.darkTheme = value),
          ),
          ListTile(
            leading: const Icon(
              Icons.add_to_home_screen,
              color: Colors.blue,
            ),
            title: const Text('Custom Theme'),
            trailing: Switch.adaptive(
                value: appTheme.customTheme,
                activeColor: Colors.blue,
                onChanged: (value) => appTheme.customTheme = value),
          )
        ],
      ),
    );
  }
}
