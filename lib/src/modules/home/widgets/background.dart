import 'package:flutter/material.dart';
import 'package:weather_app/src/constants/images.dart';

class BackgroundView extends StatelessWidget {
  const BackgroundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: Image.asset(
              XImages.background,
              fit: BoxFit.cover,
            )),
        Positioned(
            bottom: 130,
            child: Image.asset(
              XImages.house,
              fit: BoxFit.cover,
            )),
      ],
    );
  }
}
