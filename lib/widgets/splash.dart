import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({Key key, this.widget}) : super(key: key);
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    // return SplashScreen(
    //   seconds: 4,
    //   navigateAfterSeconds: widget,
    //   backgroundColor: const Color(0xffffb90b),
    //   photoSize: 50,
    //   image: Image.asset(
    //     'assets/images/splashscreen.png',
    //     fit: BoxFit.cover,
    //   ),
    //   loaderColor: Colors.white,
    //   title: Text.rich(
    //     new TextSpan(
    //       text: 'AA HAA INN \n',
    //       style: TextStyle(
    //           fontWeight: FontWeight.normal,
    //           fontSize: 32.0,
    //           letterSpacing: 2,
    //           color: Colors.white),
    //       children: <TextSpan>[
    //         new TextSpan(
    //           text: 'Food Delivery',
    //           style: new TextStyle(
    //             fontWeight: FontWeight.normal,
    //             fontSize: 18.0,
    //             letterSpacing: 0,
    //           ),
    //         ),
    //       ],
    //     ),
    //     textAlign: TextAlign.center,
    //   ),
    // );
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/splashscreen.png',
            fit: BoxFit.cover,
            width: 100,
            height: 100,
          ),
          SizedBox(height: 10,),
          Text.rich(
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
          )
        ],
      ),
    );
  }
}
