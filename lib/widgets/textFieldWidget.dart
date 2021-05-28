import 'package:flutter/material.dart';
import 'package:food_delivery/constants/theme.dart';

class TextFieldWidget extends StatelessWidget {
  final hintMessage;
  final textController;
  final icon;
  final obscureText;

  const TextFieldWidget(
      {Key key,
      @required this.hintMessage,
      @required this.textController,
      @required this.icon,
      @required this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 400,
      ),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: Color(0xFFEEEEEE),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              icon,
              color: Colors.black54,
              size: 24,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: TextFormField(
                  cursorColor: FlutterFlowTheme.primaryColor,
                  controller: textController,
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    hintText: hintMessage,
                    hintStyle: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
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
