import 'package:flutter/material.dart';
import 'package:flutter_disenos/src/widgets/slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideShowScreen extends StatelessWidget {
  const SlideShowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: const [
          Expanded(child: MiSlideshow()),
        ],
      ),
    );
  }
}

class MiSlideshow extends StatelessWidget {
  const MiSlideshow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SlideShow(
        bulletPrimario: 20,
        bulletSecundario: 5,
        activeDOT: const Color(0xff536DFE),
        indicatorUP: false,
        slides: [
          SvgPicture.asset('assets/slide-1.svg'),
          SvgPicture.asset('assets/slide-2.svg'),
          SvgPicture.asset('assets/slide-3.svg'),
          SvgPicture.asset('assets/slide-4.svg'),
        ],
      ),
    );
  }
}
