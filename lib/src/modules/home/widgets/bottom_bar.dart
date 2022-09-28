
import 'package:flutter/material.dart';

import 'package:weather_app/src/constants/images.dart';


class XBottomBar extends StatelessWidget {
  const XBottomBar({Key? key, required this.child, }) : super(key: key, );
  final Widget child;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          top: 483,
          child: Image.asset(XImages.bottombar, fit: BoxFit.contain),
        ),
        Positioned.fill(
          top: 500,
          //left: 170,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: 350,
                  child: Column(
                    children: [
                      Container(
                        height: 6,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text("Hourly Forecast", style: TextStyle(color: Colors.grey, fontSize: 16),),
                          Text("Weekly Forecast", style: TextStyle(color: Colors.grey, fontSize: 16),),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              Container(
                height: 2,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[
                          Colors.grey.withOpacity(0.1),
                          Colors.white,
                          Colors.white.withOpacity(0.5),
                          Colors.white.withOpacity(0.3),
                          Colors.grey.withOpacity(0.1),
                        ]
                    )
                ),
              ),
              const SizedBox(height: 20),
              //kapsuli
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    child,
                  ],
                ),
              ),



            ],
          ),
        ),
      ],
    );
  }
}
