import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/pages/intro_page.dart';
import 'package:food_delivery/pages/home_pages/nav_bar_page.dart';
import 'package:food_delivery/services/auth/firebase_user_provider.dart';
import 'package:food_delivery/widgets/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
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
  Stream<FirebaseUser> userStream;
  FirebaseUser initialUser;

  @override
  void initState() {
    super.initState();
    userStream = firebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        unselectedWidgetColor: Color(0x00FFB90B),
      ),
      debugShowCheckedModeBanner: false,
      home: initialUser == null
          ? Scaffold(
              backgroundColor: const Color(0xffffb90b),
              body: Splash(),
            )
          : widget.isFirstTime
              ? IntroScreen()
              : NavBarPage(isLoggedIn: currentUser.loggedIn,)
    );
  }
}

/// Page 1 main_page
/// Page 2-4 intro_page
/// Page 5&6 login_page and signup page
/// Page 7 nav_bar_page
