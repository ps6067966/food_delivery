import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/constant/theme.dart';
import 'package:food_delivery/widgets/custom_button.dart';
import 'package:food_delivery/widgets/custom_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  ResetPasswordScreen({Key key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final auth = FirebaseAuth.instance;
  TextEditingController emailTextController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  // AuthBase auth;
  String email, password;
  String errorMessage = "An undefined Error happened.";

  @override
  void initState() {
    super.initState();
    emailTextController = TextEditingController();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  bool validateEmail(String value) {
    Pattern pattern = r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Reset Password',
          textAlign: TextAlign.center,
          style: CustomTheme.title2.override(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color(0xFFFAFAFA),
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: IconButton(
            splashRadius: 20,
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.chevron_left_outlined,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Top Message
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Container(
                        width: 220,
                        decoration: BoxDecoration(
                          color: Color(0xFFFAFAFA),
                          shape: BoxShape.rectangle,
                        ),
                        child: Text(
                          'Please enter your email to reset password',
                          textAlign: TextAlign.center,
                          style: CustomTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 13,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    )
                  ],
                ),

                // Main Widgets
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // TextFiled
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          // email text field
                          Padding(
                            padding: const EdgeInsets.fromLTRB(22, 30, 20, 20),
                            child: CustomTextFormField(
                              iconData: Icons.person_outlined,
                              hintText: 'Email',
                              textController: emailTextController,
                              onChanged: (value) => email = value,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "Email can't be Empty";
                                }
                                if (!validateEmail(val)) {
                                  return "Invalid Email";
                                }
                                return null;
                              },
                            ),
                          ),

                          //Send Request Button
                          CustomButton(
                              text: 'Send Request',
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  FocusScope.of(context).unfocus();
                                  try {
                                    await FirebaseAuth.instance
                                        .sendPasswordResetEmail(email: email);
                                  } on FirebaseAuthException catch (e) {
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text('Error: ${e.message}')),
                                    );
                                    return null;
                                  }
                                  Navigator.of(context).pop();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text('Email sent to $email')),
                                  );
                                }
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // return SignInPage();
  }
}
