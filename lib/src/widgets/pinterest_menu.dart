import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final void Function()? onPressed;
  final IconData icon;

  PinterestButton({required this.onPressed, required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final Color activeColor;
  final Color secundaryColor;
  final Color backgroundColor;
  final bool isShow;
  final List<PinterestButton> items;

  const PinterestMenu(
      {super.key,
      this.isShow = true,
      required this.activeColor,
      required this.secundaryColor,
      required this.backgroundColor,
      required this.items});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => _MenuModel(),
        child: AnimatedOpacity(
          opacity: (isShow) ? 1 : 0,
          duration: const Duration(milliseconds: 200),
          child: Builder(builder: (context) {
            Provider.of<_MenuModel>(context)
              ..activeColor = activeColor
              ..secundaryColor = secundaryColor
              ..backgroundColor = backgroundColor;
            return _PinterestMenuBackground(
              child: _MenuItems(menuItems: items),
            );
          }),
        ));
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;
  const _PinterestMenuBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      height: 60,
      decoration: BoxDecoration(
        color: Provider.of<_MenuModel>(context).backgroundColor,
        borderRadius: BorderRadius.circular(100),
        boxShadow: const <BoxShadow>[
          BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5),
        ],
      ),
      child: child,
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  const _MenuItems({required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
          menuItems.length,
          (index) => _PinterestMenuButton(
                index: index,
                item: menuItems[index],
              )),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  const _PinterestMenuButton({required this.index, required this.item});
  @override
  Widget build(BuildContext context) {
    final itemSelect = Provider.of<_MenuModel>(context);
    return GestureDetector(
      behavior:
          HitTestBehavior.translucent, //! requerdo para dispocitivos moviles
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSelect = index;
        item.onPressed!();
      },
      child: SizedBox(
        width: 48,
        height: 48,
        child: Icon(item.icon,
            size: (itemSelect.itemSelect == index) ? 35 : 25,
            color: (itemSelect.itemSelect == index)
                ? itemSelect.activeColor
                : itemSelect.secundaryColor),
      ),
    );
  }
}

class _MenuModel extends ChangeNotifier {
  int _itemSelect = 0;

  int get itemSelect => _itemSelect;
  set itemSelect(int value) {
    _itemSelect = value;
    notifyListeners();
  }

  Color _activeColor = Colors.blue;
  Color _secundaryColor = Colors.blueGrey;
  Color _backgroundColor = Colors.white;
  Color get backgroundColor => _backgroundColor;

  set backgroundColor(Color value) => _backgroundColor = value;

  Color get secundaryColor => _secundaryColor;
  set secundaryColor(Color value) => _secundaryColor = value;
  Color get activeColor => _activeColor;
  set activeColor(Color value) {
    _activeColor = value;
  }
}
