import 'package:flutter/material.dart';
import 'package:flutter_disenos/src/theme/theme_changer.dart';
import 'package:flutter_disenos/src/widgets/slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideShowScreen extends StatelessWidget {
  const SlideShowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = [
      const Expanded(child: MiSlideshow()),
      const Expanded(child: MiSlideshow()),
    ];

    bool isLarge = false;
    if (MediaQuery.of(context).size.height > 500) {
      isLarge = true;
    } else {
      isLarge = false;
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
              color: Theme.of(context).iconTheme.color!.withOpacity(.8)),
        ),
        body: isLarge
            ? Column(
                children: children,
              )
            : Row(
                children: children,
              ));
  }
}

class MiSlideshow extends StatelessWidget {
  const MiSlideshow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    final secondaryColor = themeChanger.currentTheme.colorScheme.secondary;
    return SafeArea(
      child: SlideShow(
        bulletPrimario: 20,
        bulletSecundario: 5,
        activeDOT: (themeChanger.darkTheme)
            ? secondaryColor
            : const Color.fromARGB(255, 254, 83, 134),
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
