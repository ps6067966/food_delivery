import 'package:flutter/material.dart';
import 'package:food_delivery/constant/theme.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 10.0,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left_outlined,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Notifications",
          style: TextStyle(
            color: CustomTheme.primaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'No Notifications',
          style: CustomTheme.bodyText1.override(
            fontFamily: 'Poppins',
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
