import 'package:flutter/material.dart';
import 'package:food_delivery/constant/theme.dart';

class EmptyBag extends StatelessWidget {
  EmptyBag({Key key, @required this.onPressed}) : super(key: key);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Image.asset(
                  'assets/images/undraw_barbecue_3x93 1.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Text(
                'Your Food Cart is Empty!',
                style: CustomTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text(
                'Add something in your bag\nto checkout',
                textAlign: TextAlign.center,
                style: CustomTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: OutlinedButton(
                onPressed: onPressed,
                style: ButtonStyle(
                  side: MaterialStateProperty.all(
                      BorderSide(color: CustomTheme.primaryColor)),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                  child: Text(
                    "Explore items",
                    style: TextStyle(
                        color: CustomTheme.primaryColor, fontSize: 16.0),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
