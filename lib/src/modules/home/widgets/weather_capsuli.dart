import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/src/constants/colors.dart';
import 'package:weather_app/src/constants/fonts.dart';
import 'package:weather_app/src/constants/images.dart';

class XWeatherCapsuli extends StatelessWidget {
  const XWeatherCapsuli({Key? key, required this.time, required this.weatherIcon, required this.temperature}) : super(key: key);
  final String time;
  final String weatherIcon;
  final String temperature;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 15.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(),
        child: Container(
          margin: const EdgeInsets.only(bottom: 7),
          height: 150,
          width: 60,
          decoration: BoxDecoration(
              color: XWeatherColor.blueMagentaViolet.withOpacity(0.1),
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    offset: const Offset(2, 2),
                    spreadRadius: 1,
                    blurRadius: 4
                ),
                BoxShadow(
                    color: Colors.white.withOpacity(0.07),
                    spreadRadius: 1,
                    blurRadius: 4
                )
              ]
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 15
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(time, style: const TextStyle(
                  fontFamily: XFont.display,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: XColorLight.white,
                ),),
                Image.asset('${XCloudImages.urlCloudImage}$weatherIcon.png'),
                Text(temperature, style: const TextStyle(
                  fontFamily: XFont.display,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: XColorLight.white,
                ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
