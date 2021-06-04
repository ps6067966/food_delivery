import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatelessWidget {
  const Splash({Key key, @required this.widget}) : super(key: key);
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
      navigateAfterSeconds: widget,
      backgroundColor: const Color(0xffffb90b),
      photoSize: 50,
      image: Image.asset(
        'assets/images/splashscreen.png',
        fit: BoxFit.cover,
      ),
      loaderColor: Colors.white,
      title: Text.rich(
        new TextSpan(
          text: 'AA HAA INN \n',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 32.0,
              letterSpacing: 2,
              color: Colors.white),
          children: <TextSpan>[
            new TextSpan(
              text: 'Food Delivery',
              style: new TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 18.0,
                letterSpacing: 0,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
