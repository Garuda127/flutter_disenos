import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_disenos/src/widgets/button_gordo.dart';
import 'package:flutter_disenos/src/widgets/headers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> itemMap = items
        .map((item) => FadeInLeft(
              delay: const Duration(milliseconds: 300),
              child: BotonGordo(
                icon: item.icon,
                text: item.texto,
                color1: item.color1,
                color2: item.color2,
                onPress: () {
                  print('hola');
                },
              ),
            ))
        .toList();
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(
                height: 280,
              ),
              ...itemMap
            ],
          ),
          const _Encabezado()
        ],
      ),
    );
  }
}

class _Encabezado extends StatelessWidget {
  const _Encabezado({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const IconHeader(
            icon: FontAwesomeIcons.plus,
            title: 'haz Solicitado',
            subtitle: 'Asistencia Medica'),
        Positioned(
            top: 30,
            right: 10,
            child: RawMaterialButton(
              constraints: const BoxConstraints(minHeight: 42, minWidth: 42),
              onPressed: () {},
              shape: const CircleBorder(),
              child: const FaIcon(
                FontAwesomeIcons.ellipsisVertical,
                color: Colors.white,
              ),
            ))
      ],
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const IconHeader(
      icon: FontAwesomeIcons.plus,
      subtitle: 'Asistencia Medica',
      title: 'Has solicitado',
    );
  }
}

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

final items = <ItemBoton>[
  ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
      const Color(0xff6989F5), const Color(0xff906EF5)),
  ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2),
      const Color(0xff536CF6)),
  ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
      const Color(0xffF2D572), const Color(0xffE06AA3)),
  ItemBoton(FontAwesomeIcons.biking, 'Awards', const Color(0xff317183),
      const Color(0xff46997D)),
  ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
      const Color(0xff6989F5), const Color(0xff906EF5)),
  ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2),
      const Color(0xff536CF6)),
  ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
      const Color(0xffF2D572), const Color(0xffE06AA3)),
  ItemBoton(FontAwesomeIcons.biking, 'Awards', const Color(0xff317183),
      const Color(0xff46997D)),
  ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
      const Color(0xff6989F5), const Color(0xff906EF5)),
  ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2),
      const Color(0xff536CF6)),
  ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
      const Color(0xffF2D572), const Color(0xffE06AA3)),
  ItemBoton(FontAwesomeIcons.biking, 'Awards', const Color(0xff317183),
      const Color(0xff46997D)),
];
