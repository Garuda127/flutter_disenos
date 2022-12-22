import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGordo extends StatelessWidget {
  final void Function()? onPress;
  final IconData icon;
  final String text;
  final Color? color1;
  final Color? color2;

  const BotonGordo(
      {super.key,
      this.onPress,
      required this.icon,
      required this.text,
      this.color1 = const Color(0xff6989f5),
      this.color2 = const Color(0xff906ef5)});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: color1!.withOpacity(0.5),
      onTap: onPress,
      child: Stack(
        children: [
          _BotonGordoBackground(
            icon: icon,
            color1: color1!,
            color2: color2!,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 140,
                width: 40,
              ),
              FaIcon(
                icon,
                color: Colors.white,
                size: 40,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              const FaIcon(
                FontAwesomeIcons.chevronRight,
                color: Colors.white,
              ),
              const SizedBox(width: 40)
            ],
          )
        ],
      ),
    );
  }
}

class _BotonGordoBackground extends StatelessWidget {
  final IconData icon;
  final Color color1, color2;
  const _BotonGordoBackground({
    Key? key,
    required this.color1,
    required this.color2,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(colors: <Color>[color1, color2]),
        color: Colors.pink[200],
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(4, 6),
              blurRadius: 10)
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(children: [
          Positioned(
            right: -20,
            top: -20,
            child: FaIcon(
              icon,
              size: 150,
              color: Colors.white.withOpacity(0.2),
            ),
          )
        ]),
      ),
    );
  }
}
