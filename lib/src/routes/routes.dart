import 'package:flutter/material.dart';
import 'package:flutter_disenos/src/pages/animaciones_page.dart';
import 'package:flutter_disenos/src/pages/emergency_page.dart';
import 'package:flutter_disenos/src/pages/graficas_circulares_page.dart';
import 'package:flutter_disenos/src/pages/headers_page.dart';
import 'package:flutter_disenos/src/pages/pinterest_page.dart';
import 'package:flutter_disenos/src/pages/slideshow_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final pageRoute = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'Slideshow', const SlideShowScreen()),
  _Route(FontAwesomeIcons.truckMedical, 'Emergencia', const EmergencyPage()),
  _Route(FontAwesomeIcons.heading, 'Encabezados', const HeadersPage()),
  _Route(FontAwesomeIcons.peopleCarryBox, 'Animado', const CuadradoAnimado()),
  _Route(FontAwesomeIcons.slideshare, 'Process bar',
      const GraficasCircularesPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', const PinterestPage()),
];

class _Route {
  final IconData icon;
  final String titulo;
  final Widget page;
  _Route(this.icon, this.titulo, this.page);
}
