import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/pages/landing_page.dart';
import 'package:food_delivery/pages/intro_page.dart';
import 'package:food_delivery/services/auth.dart';
import 'package:provider/provider.dart';
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
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    runApp(new MyApp(
      isFirstTime: isFirstTime,
    ));
  });
}

class MyApp extends StatefulWidget {
  final bool isFirstTime;

  const MyApp({Key key, @required this.isFirstTime}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() => _initialized = true);
    } catch (e) {
      setState(() => _error = true);
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if (_error) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: Text(" Cant initialize the firebase"),
          ),
        ),
      );
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    return Provider<AuthBase>(
      create: (context) => Auth(),
      child: MaterialApp(
        title: 'Food Delivery',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          unselectedWidgetColor: Color(0x00FFB90B),
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(
          seconds: 4,
          navigateAfterSeconds:
              widget.isFirstTime ? IntroScreen() : LandingPage(),
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
      ),
    );
  }
}
