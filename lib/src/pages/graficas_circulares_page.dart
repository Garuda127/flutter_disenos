import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_disenos/src/widgets/radial_progress.dart';

class GraficasCircularesPage extends StatefulWidget {
  const GraficasCircularesPage({super.key});

  @override
  State<GraficasCircularesPage> createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          backgroundColor: Colors.blue,
          elevation: 0,
          leading: const Icon(Icons.radar),
          title: const Text('RadialGrafics'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              porcentaje += 10;
              if (porcentaje > 100) porcentaje = 0;
            });
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.refresh),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(porcentaje: 45, color: Colors.pink),
                CustomRadialProgress(
                  porcentaje: 90,
                  color: Colors.purple,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const CustomRadialProgress(
                  porcentaje: 11,
                  color: Colors.red,
                ),
                CustomRadialProgress(
                  porcentaje: porcentaje,
                  color: Colors.green,
                )
              ],
            )
          ],
        ));
  }
}

class CustomRadialProgress extends StatelessWidget {
  const CustomRadialProgress({
    Key? key,
    required this.porcentaje,
    required this.color,
  }) : super(key: key);

  final double porcentaje;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: RadialProgress(porcentaje: porcentaje, colorPrimario: color),
    );
  }
}
