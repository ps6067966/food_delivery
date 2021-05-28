import 'package:flutter/material.dart';

class WhiteText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final double fontSize;
  final FontWeight fontWeight;

  const WhiteText(
      {Key key,
      this.text,
      this.fontSize,
      this.fontWeight,
      this.textAlign = TextAlign.left})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          color: Colors.white,
          fontSize: fontSize == null ? 14.0 : fontSize,
          fontWeight: fontWeight == null ? FontWeight.normal : fontWeight),
    );
  }
}

class GreyText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final double fontSize;
  final FontWeight fontWeight;

  const GreyText(
      {Key key,
      this.text,
      this.fontSize,
      this.fontWeight,
      this.textAlign = TextAlign.left})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          color: Colors.grey,
          fontSize: fontSize == null ? 14.0 : fontSize,
          fontWeight: fontWeight == null ? FontWeight.normal : fontWeight),
    );
  }
}

class BlackText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final double lineHeight;
  final double fontSize;
  final FontWeight fontWeight;

  const BlackText(
      {Key key,
      this.text,
      this.lineHeight,
      this.fontSize,
      this.fontWeight,
      this.textAlign = TextAlign.left})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          height: lineHeight,
          color: Colors.black,
          fontSize: fontSize == null ? 14.0 : fontSize,
          fontWeight: fontWeight == null ? FontWeight.normal : fontWeight),
    );
  }
}
