import 'package:flutter/material.dart';
import 'package:flutter_disenos/src/widgets/pinterest_menu.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _MenuModel(),
      child: Scaffold(
        body: Stack(children: [
          const PinterestGrid(),
          _PinterestMenuLocation(),
        ]),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sizewidth = MediaQuery.of(context).size.width;
    final mostrar = Provider.of<_MenuModel>(context);
    return Positioned(
        bottom: 30,
        child: SizedBox(
          width: sizewidth,
          child: Align(
              child: PinterestMenu(
            items: [
              PinterestButton(
                  onPressed: () {
                    print('pie_chart');
                  },
                  icon: Icons.pie_chart),
              PinterestButton(
                  onPressed: () {
                    print('Search');
                  },
                  icon: Icons.search),
              PinterestButton(
                  onPressed: () {
                    print('Notifications');
                  },
                  icon: Icons.notifications),
              PinterestButton(
                  onPressed: () {
                    print('User');
                  },
                  icon: Icons.supervised_user_circle)
            ],
            isShow: mostrar.mostar,
            activeColor: Colors.red,
            secundaryColor: Colors.green,
            backgroundColor: Colors.black,
          )),
        ));
  }
}

class PinterestGrid extends StatefulWidget {
  const PinterestGrid({super.key});

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  ScrollController controller = ScrollController();
  double scrollAnterior = 0;
  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset > scrollAnterior && controller.offset > 150) {
        Provider.of<_MenuModel>(context, listen: false).mostar = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).mostar = true;
      }
      scrollAnterior = controller.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      controller: controller,
      itemCount: 15,
      crossAxisCount: 2,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          height: (index % 5 + 1) * 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(15),
              color: Colors.green),
          child: Center(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text('$index'),
            ),
          ),
        );
      },
    );
  }
}

class _MenuModel extends ChangeNotifier {
  bool _mostar = true;

  bool get mostar => _mostar;
  set mostar(bool value) {
    _mostar = value;
    notifyListeners();
  }
}
