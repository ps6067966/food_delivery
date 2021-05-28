import 'package:food_delivery/constants/theme.dart';
import 'package:food_delivery/widgets/flutterFlowWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery/widgets/textFieldWidget.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController textController1;
  TextEditingController textController2;
  bool checkboxListTileValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var maxWidth=400.0;
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0x00FFB90B),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                            print('IconButton pressed ...');
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                            size: 17,
                          ),
                          iconSize: 17,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Sign in',
                              style: FlutterFlowTheme.title2.override(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 220,
                decoration: BoxDecoration(
                  color: Color(0xFFFAFAFA),
                  shape: BoxShape.rectangle,
                ),
                child: Text(
                  'Please enter your email to sign in',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                    color: Colors.black87,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(22, 30, 20, 20),
                child: TextFieldWidget(
                  icon: Icons.email_outlined,
                  hintMessage: 'Email',
                  textController: textController1,
                  obscureText: false,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(22, 0, 22, 2),
                child: TextFieldWidget(
                  icon: Icons.lock_outline,
                  hintMessage: 'Password',
                  textController: textController2,
                  obscureText: true,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(1, 0, 22, 0),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: maxWidth=400.0,
                  ),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFFFAFAFA),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(22, 0, 10, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: FlutterFlowTheme.primaryColor,
                                      width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              width: 22,
                              height: 22,
                              child: Checkbox(
                                activeColor: Color(0x00FFB90B),
                                checkColor: Color(0xFFFFB90B),
                                value: checkboxListTileValue ?? true,
                                tristate: false,
                                onChanged: (newValue) {
                                  setState(() {
                                    checkboxListTileValue = newValue;
                                  });
                                },
                              ),
                            ),
                          ),
                          Text(
                            'Remember me',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFFFFB90B),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(22, 0, 22, 5),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: maxWidth,
                  ),
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Sign in',
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
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Colors.black87,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Sign up',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFFFFB90B),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 12, 0, 20),
                child: Text(
                  'OR',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(22, 0, 22, 20),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: maxWidth,
                  ),
                  child: FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Connect with Facebook',
                    icon: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 7, 0),
                      child: FaIcon(
                        FontAwesomeIcons.facebookF,
                      ),
                    ),
                    options: FFButtonOptions(

                      width: double.infinity,
                      height: 60,
                      color: Colors.blue[800],
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
                ),
              ),
              Padding(

                padding: EdgeInsets.fromLTRB(22, 0, 22, 20),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: maxWidth,
                  ),
                  child: FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Connect with Google',
                    icon: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 7, 0),
                      child: FaIcon(
                        FontAwesomeIcons.google,
                      ),
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 60,
                      color: Colors.red[800],
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
