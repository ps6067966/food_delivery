import 'package:food_delivery/screens/signin.dart';
import 'package:food_delivery/constants/theme.dart';
import 'package:food_delivery/widgets/flutterFlowWidget.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/textFieldWidget.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;
  bool checkboxListTileValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
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
                              'Create an Account',
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
                  'Please enter your name, email and password to sign up',
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
                  icon: Icons.person_outlined,
                  hintMessage: 'Name',
                  textController: textController1,
                  obscureText: false,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(22, 0, 20, 20),
                child: TextFieldWidget(
                  icon: Icons.mail_outline,
                  hintMessage: 'Email',
                  textController: textController2,
                  obscureText: false,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(22, 0, 20, 15),
                child: TextFieldWidget(
                  icon: Icons.lock_outline,
                  hintMessage: 'Password',
                  textController: textController3,
                  obscureText: true,
                ),
              ),
              Container(
                constraints: BoxConstraints(
                  maxWidth: maxWidth,
                ),
                width: double.infinity,
                height: 30,
                decoration: BoxDecoration(
                  color: Color(0xFFFAFAFA),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
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
                      'I agree to',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: Colors.black87,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Terms & Conditions',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFFFFB90B),
                          fontSize: 12,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(22, 15, 22, 5),
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
                    text: 'Sign up',
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
                    'Already have an account?',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Colors.black87,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInPage()));
                    },
                    child: Text(
                      'Sign in',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFFFFB90B),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
