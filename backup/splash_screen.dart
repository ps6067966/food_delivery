/*
import 'package:food_delivery/constant/theme.dart';
import 'package:food_delivery/pages/get_started_1.dart';
import 'package:flutter/material.dart';

class FoodSplashScreen extends StatefulWidget {
  FoodSplashScreen({Key key}) : super(key: key);

  @override
  _FoodSplashScreenState createState() => _FoodSplashScreenState();
}

class _FoodSplashScreenState extends State<FoodSplashScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFFFBA0E),
      body: SafeArea(
        child: Align(
          alignment: Alignment(0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/splashscreen.png',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              Text(
                'AA HAA INN',
                style: TextStyle(
                  color: FlutterFlowTheme.tertiaryColor,
                  fontSize: 28,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: InkWell(
                  onTap: () async {
                    await Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GetStart1Widget(),
                      ),
                          (r) => false,
                    );
                  },
                  child: Text(
                    'FOOD DELIVERY',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.tertiaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
*/