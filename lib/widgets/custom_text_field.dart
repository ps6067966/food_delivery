import 'package:flutter/material.dart';
import 'package:food_delivery/constant/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final IconData iconData;
  final String hintText;
  final TextEditingController textController;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onChanged;
  final bool obscureText;
  final Widget suffixIcon;

  const CustomTextFormField(
      {Key key,
      @required this.iconData,
      @required this.hintText,
      @required this.textController,
      this.validator,
      this.onChanged,
      this.obscureText=false,
      this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: Color(0xFFEEEEEE),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(15, 0, 0, 4),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              iconData,
              color: Colors.black54,
              size: 24,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 20, 0),
                child: TextFormField(
                  cursorColor: FlutterFlowTheme.primaryColor,
                  controller: textController,
                  obscureText: obscureText,
                  validator: validator,
                  onChanged: onChanged,
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                    suffixIcon: suffixIcon,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
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
