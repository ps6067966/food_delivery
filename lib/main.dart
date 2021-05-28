import 'package:flutter/material.dart';
<<<<<<< HEAD

import 'screens/home/home.dart';

void main() {
  runApp(FoodDeliveryApp());
}

class FoodDeliveryApp extends StatelessWidget {
=======
import 'package:food_delivery/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
>>>>>>> signup_signin_ui
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
<<<<<<< HEAD
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(title: 'Flutter Demo Home Page'),
    );
  }
}


=======
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        unselectedWidgetColor: Color(0x00FFB90B),
      ),
      home: SignupPage(),
    );
  }
}
>>>>>>> signup_signin_ui
