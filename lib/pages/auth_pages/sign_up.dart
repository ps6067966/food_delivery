import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/constant/theme.dart';
import 'package:food_delivery/pages/auth_pages/login.dart';
import 'package:food_delivery/services/auth/auth_util.dart';
import 'package:food_delivery/widgets/custom_button.dart';
import 'package:food_delivery/widgets/custom_check_box.dart';
import 'package:food_delivery/widgets/custom_text_field.dart';
import '../home_pages/nav_bar_page.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameTextController;
  TextEditingController emailTextController;
  TextEditingController passwordTextController;
  bool checkboxListTileValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  String name, email, password;
  String errorMessage = "An undefined Error happened.";
  bool _passwordVisible;

  bool validateEmail(String value) {
    Pattern pattern = r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    nameTextController = TextEditingController();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Create an Account',
          textAlign: TextAlign.center,
          style: CustomTheme.title2.override(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          splashRadius: 20,
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 17,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Color(0xFFFAFAFA),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Top Message
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
                          'Please enter your email or phone number to sign in',
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
                          // Name text field
                          Padding(
                            padding: const EdgeInsets.fromLTRB(22, 30, 20, 0),
                            child: CustomTextFormField(
                              iconData: Icons.person_outline,
                              hintText: 'Name',
                              textController: nameTextController,
                              onChanged: (value) => name = value,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "Name can't be Empty";
                                }
                                return null;
                              },
                            ),
                          ),

                          // Email text field
                          Padding(
                            padding: const EdgeInsets.fromLTRB(22, 20, 20, 20),
                            child: CustomTextFormField(
                              iconData: Icons.email_outlined,
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

                          // Password text field
                          Padding(
                            padding: const EdgeInsets.fromLTRB(22, 0, 22, 2),
                            child: CustomTextFormField(
                              iconData: Icons.lock_outline,
                              hintText: 'Password',
                              textController: passwordTextController,
                              onChanged: (value) => password = value,
                              obscureText: !_passwordVisible,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "Password can't be Empty";
                                }
                                return null;
                              },
                              suffixIcon: IconButton(
                                  splashColor: Colors.white,
                                  highlightColor: Colors.white,
                                  iconSize: 20,
                                  color: Colors.black54,
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                  icon: Icon(
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.black54,
                                  )),
                            ),
                          ),

                          // I agree check box
                          Padding(
                            padding: EdgeInsets.fromLTRB(1, 0, 22, 0),
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0xFFFAFAFA),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomCheckBoxWithName(
                                      value: checkboxListTileValue ?? true,
                                      onChanged: (newValue) {
                                        setState(() {
                                          checkboxListTileValue = newValue;
                                        });
                                      },
                                      text: 'I agree to'),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Terms & Conditions',
                                      style:
                                          CustomTheme.bodyText1.override(
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

                          // Sign up Button
                          CustomButton(
                              text: 'Sign up',
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  // submit(context);
                                  final user = await createAccountWithEmail(
                                    context,
                                    nameTextController.text,
                                    emailTextController.text,
                                    passwordTextController.text,
                                  );
                                  if (user == null) {
                                    return;
                                  }

                                  await Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          NavBarPage(initialPage: 'HomePage'),
                                    ),
                                    (r) => false,
                                  );
                                }
                              }),

                          // Already have account? Sign up
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Already have account?
                              Text(
                                'Already have an account? ',
                                style: CustomTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.black87,
                                ),
                              ),

                              // Sign up
                              TextButton(
                                onPressed: () async =>
                                    await Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                  (r) => false,
                                ),
                                child: Text(
                                  'Sign in',
                                  style: CustomTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFFFFB90B),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
  }
}
