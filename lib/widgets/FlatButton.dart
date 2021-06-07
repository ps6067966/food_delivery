import 'package:flutter/material.dart';
import 'package:food_delivery/constant/theme.dart';

class FButton extends StatelessWidget {
  FButton({this.title, this.onPressed, this.width});
  final String title;
  final double width;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 45.0,
      minWidth: width,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: CustomTheme.primaryColor,
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(0),
        ),
        color: Colors.white,
        child: Text(
          title,
          style: TextStyle(
            color: CustomTheme.primaryColor,
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
