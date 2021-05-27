import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/pages/login.dart';
import 'package:food_delivery/pages/intro_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    WidgetsFlutterBinding.ensureInitialized();
    var prefs = await SharedPreferences.getInstance();
    var boolKey = 'isFirstTime';
    var isFirstTime = prefs.getBool(boolKey) ?? true;
    runApp(new MyApp(
      isFirstTime: isFirstTime,
    ));
  });
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;

  const MyApp({Key key, @required this.isFirstTime}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery',
      theme: ThemeData(primarySwatch: Colors.orange),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        seconds: 4,
        navigateAfterSeconds: isFirstTime ? IntroScreen() : LogInScreen(),
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
      ),
    );
  }
}
