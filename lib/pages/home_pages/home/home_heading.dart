import 'package:flutter/material.dart';
import 'package:food_delivery/constant/theme.dart';

class HomeHeading extends StatelessWidget {
  const HomeHeading({Key key, @required this.headText}) : super(key: key);
  final String headText;
  @override
  Widget build(BuildContext context) {
    return Text(
      headText,
      style: CustomTheme.bodyText1.override(
        fontFamily: 'Poppins',
        color: CustomTheme.primaryColor,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
