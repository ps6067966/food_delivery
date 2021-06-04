import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery/constant/theme.dart';
import 'package:food_delivery/pages/auth_pages/sign_up.dart';
import 'package:food_delivery/services/auth/auth_util.dart';
import 'package:food_delivery/widgets/custom_button.dart';
import 'package:food_delivery/widgets/custom_check_box.dart';
import 'package:food_delivery/widgets/custom_text_field.dart';
import '../home_pages/nav_bar_page.dart';
import '../home_pages/home/home.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextController;
  TextEditingController passwordTextController;
  bool checkboxListTileValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  String email, password;
  String errorMessage = "An undefined Error happened.";
  bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
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
          'Sign in',
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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
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
                          // email text field
                          Padding(
                            padding: const EdgeInsets.fromLTRB(22, 30, 20, 20),
                            child: CustomTextFormField(
                              iconData: Icons.person_outlined,
                              hintText: 'Email or Phone number',
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
                              obscureText: !_passwordVisible,
                              onChanged: (value) => password = value,
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

                          // Remember me check box
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomCheckBoxWithName(
                                      value: checkboxListTileValue ?? true,
                                      onChanged: (newValue) {
                                        setState(() {
                                          checkboxListTileValue = newValue;
                                        });
                                      },
                                      text: 'Remember me'),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Forgot Password',
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

                          //Sign in Button
                          CustomButton(
                              text: 'Sign in',
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  // submit(context);
                                  final user = await signInWithEmail(
                                    context,
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

                          // Don't have account? Sign up
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Don't have account text
                              Text(
                                'Don\'t have an account? ',
                                style: CustomTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.black87,
                                ),
                              ),

                              // Sign up button
                              TextButton(
                                onPressed: () async {
                                  await Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignUpScreen(),
                                    ),
                                    (r) => false,
                                  );
                                },
                                child: Text(
                                  'Sign up',
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

                    // or
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 25, 0, 25),
                      child: Text(
                        'OR',
                        textAlign: TextAlign.center,
                        style: CustomTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          fontSize: 13,
                        ),
                      ),
                    ),

                    // Social button
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        // google button
                        SocialButton(
                          icon: FaIcon(FontAwesomeIcons.google),
                          text: "Connect with Google    ",
                          // onPressed: () {},
                          onPressed: () async {
                            final user = await signInWithGoogle(context);
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
                          },
                          color: Color.fromRGBO(219, 68, 55, 1),
                        ),
                      ],
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
