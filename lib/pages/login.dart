import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  static String id = 'HomeScreen';
  LogInScreen({Key key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Align(
        alignment: Alignment(0, 0),
        child: Text("Login"),
      ),
    );
  }
}
