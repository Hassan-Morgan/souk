import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soukapp/app/resources_manager/assets_manager.dart';
import 'package:soukapp/app/resources_manager/color_manager.dart';
import 'package:soukapp/app/resources_manager/strings_manager.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: Painter2(),
      willChange: true,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    AssetsManager.whiteAppIcon,
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                  Text(
                    StringsManager.homePageHead,
                    style: Theme.of(context).textTheme.headline3?.copyWith(
                        fontSize: MediaQuery.of(context).size.width * 0.025),
                  ),
                ],
              ),
            ),
            Image.asset(
              AssetsManager.homeHeadImage,
              width: MediaQuery.of(context).size.width * 0.2,
            ),
          ],
        ),
      ),
    );
  }
}

class Painter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path _path = Path();

    _path.moveTo(0, 0);
    _path.lineTo(0, size.height);
    _path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.7, size.width, size.height);
    _path.lineTo(size.width, size.height);
    _path.lineTo(size.width, 0);

    Paint _paint = Paint()
      ..color = ColorManager.primaryColor
      ..style = PaintingStyle.fill;

    canvas.drawPath(_path, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
