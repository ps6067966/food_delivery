import 'package:flutter/material.dart';
import 'package:food_delivery/constant/theme.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({Key key}) : super(key: key);

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
          "My Account",
          style: TextStyle(
            color: CustomTheme.primaryColor,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
