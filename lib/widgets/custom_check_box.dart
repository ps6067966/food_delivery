import 'package:flutter/material.dart';
import 'package:food_delivery/constant/theme.dart';

class CustomCheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomCheckBox(
      {Key key, @required this.value, @required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: FlutterFlowTheme.primaryColor, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      width: 22,
      height: 22,
      child: Checkbox(
        activeColor: Color(0x00FFB90B),
        checkColor: Color(0xFFFFB90B),
        value: value,
        tristate: false,
        onChanged: onChanged,
      ),
    );
  }
}

class CustomCheckBoxWithName extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final String text;

  const CustomCheckBoxWithName(
      {Key key,
      @required this.value,
      @required this.onChanged,
      @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(22, 0, 10, 0),
          child: CustomCheckBox(
            value: value,
            onChanged: onChanged,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.start,
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            fontSize: 12,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
