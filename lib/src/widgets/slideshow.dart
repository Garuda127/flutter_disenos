import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideShow extends StatelessWidget {
  final double? bulletPrimario;
  final double? bulletSecundario;
  final Color? activeDOT;
  final Color? bgDOT;
  final bool? indicatorUP;
  final List<Widget> slides;
  const SlideShow(
      {super.key,
      required this.slides,
      this.indicatorUP = false,
      this.activeDOT = Colors.blue,
      this.bgDOT = Colors.grey,
      this.bulletPrimario = 12,
      this.bulletSecundario = 12});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _SliderModel(),
      child: Center(child: Builder(
        builder: (BuildContext context) {
          Provider.of<_SliderModel>(context)._colorPrimario = activeDOT!;
          Provider.of<_SliderModel>(context)._colorSecundario = bgDOT!;
          Provider.of<_SliderModel>(context)._bulletPrimario = bulletPrimario!;
          Provider.of<_SliderModel>(context)._bulletSecundario =
              bulletSecundario!;
          return _CrearEstructuraSlideshow(
              indicatorUP: indicatorUP, slides: slides);
        },
      )),
    );
  }
}

class _CrearEstructuraSlideshow extends StatelessWidget {
  const _CrearEstructuraSlideshow({
    Key? key,
    required this.indicatorUP,
    required this.slides,
  }) : super(key: key);

  final bool? indicatorUP;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (indicatorUP!) _Dots(slides.length, indicatorUP!),
        Expanded(child: _Slides(slides)),
        if (!indicatorUP!) _Dots(slides.length, indicatorUP!),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final bool indicator;
  final int totalSlides;
  const _Dots(this.totalSlides, this.indicator);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            totalSlides,
            (index) => _Dot(
                  index: index,
                )),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  const _Dot({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ssModel = Provider.of<_SliderModel>(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: (ssModel.currentPage >= index - 0.5 &&
              ssModel.currentPage < index + 0.5)
          ? ssModel._bulletPrimario
          : ssModel._bulletSecundario,
      width: (ssModel.currentPage >= index - 0.5 &&
              ssModel.currentPage < index + 0.5)
          ? ssModel._bulletPrimario
          : ssModel._bulletSecundario,
      decoration: BoxDecoration(
          color: (ssModel.currentPage >= index - 0.5 &&
                  ssModel.currentPage < index + 0.5)
              ? ssModel._colorPrimario
              : ssModel._colorSecundario,
          shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;
  const _Slides(this.slides);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();
  @override
  void initState() {
    pageViewController.addListener(() {
      Provider.of<_SliderModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageViewController,
      children: widget.slides.map((slide) => _Slide(slide)).toList(),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  const _Slide(this.slide);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: slide);
  }
}

class _SliderModel extends ChangeNotifier {
  double _currentPage = 0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.grey;
  double _bulletPrimario = 12;
  double _bulletSecundario = 12;
  double get currentPage => _currentPage;

  double get bulletSecundario => _bulletSecundario;
  set bulletSecundario(double value) {
    _bulletSecundario = value;
  }

  double get bulletPrimario => _bulletPrimario;
  set bulletPrimario(double value) {
    _bulletPrimario = value;
  }

  set currentPage(double value) {
    _currentPage = value;
    notifyListeners();
  }

  get colorPrimario => _colorPrimario;
  set colorPrimario(final value) {
    _colorPrimario = value;
  }

  Color get colorSecundario => _colorSecundario;
  set colorSecundario(Color value) {
    _colorSecundario = value;
  }
}
