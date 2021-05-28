import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery/constant/theme.dart';
import 'flow_widget.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({Key key, @required this.text, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(22, 0, 22, 15),
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
          child: FFButtonWidget(
            onPressed: onPressed,
            text: text,
            options: FFButtonOptions(
              width: double.infinity,
              height: 60,
              color: Color(0xFFFFB90B),
              textStyle: FlutterFlowTheme.subtitle2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final FaIcon icon;
  final String text;
  final VoidCallback onPressed;
  final Color color;

  const SocialButton(
      {Key key,
      @required this.icon,
      @required this.text,
      @required this.onPressed,
      @required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(22, 0, 22, 20),
      child: FFButtonWidget(
        onPressed: onPressed,
        text: text,
        icon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
          child: icon,
        ),
        options: FFButtonOptions(
          width: double.infinity,
          height: 60,
          color: color,
          textStyle: FlutterFlowTheme.subtitle2.override(
            fontFamily: 'Poppins',
            color: Colors.white,
          ),
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 0,
          ),
          borderRadius: 20,
        ),
      ),
    );
  }
}
