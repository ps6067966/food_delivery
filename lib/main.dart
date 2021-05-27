import 'package:flutter/material.dart';
import 'package:food_delivery/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        unselectedWidgetColor: Color(0x00FFB90B),
      ),
      home: SignupPage(),
    );
  }
}
