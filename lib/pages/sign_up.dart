import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/constant/theme.dart';
import 'package:food_delivery/services/auth.dart';
import 'package:food_delivery/widgets/custom_button.dart';
import 'package:food_delivery/widgets/custom_check_box.dart';
import 'package:food_delivery/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'log_in_manager.dart';

class SignUpScreen extends StatefulWidget {
  // const SignUpScreen({
  //   Key key,
  //   @required this.manager,
  //   @required this.isLoading,
  // }) : super(key: key);
  // final LogInManager manager;
  // final bool isLoading;
  //
  // static Widget create(BuildContext context) {
  //   final auth = Provider.of<AuthBase>(context);
  //   return ChangeNotifierProvider<ValueNotifier<bool>>(
  //     create: (_) => ValueNotifier<bool>(false),
  //     child: Consumer<ValueNotifier<bool>>(
  //       builder: (_, isLoading, __) => Provider<LogInManager>(
  //         create: (_) => LogInManager(auth: auth, isLoading: isLoading),
  //         child: Consumer<LogInManager>(
  //           builder: (context, manager, _) => SignUpScreen(
  //             manager: manager,
  //             isLoading: isLoading.value,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;
  bool checkboxListTileValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  AuthBase auth;
  String name, email, password;
  String errorMessage = "An undefined Error happened.";
  bool _passwordVisible;

  bool validateEmail(String value) {
    Pattern pattern = r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  Future<void> submit(BuildContext context) async {
    try {
      auth = Provider.of<AuthBase>(context, listen: false);
      var result = await auth.createUserWithEmailAndPassword(name, email, password);
      // Navigator.pop(context);
      if(result!=null){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home(user: result,),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      switch (e.code) {
        case "invalid-email":
          errorMessage = "Your email address is incorrect";
          break;
        case "email-already-in-use":
          errorMessage =
              "The email address is already in use by another account.";
          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests. Try again later.";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      showDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Sign up failed'),
              content: Text(errorMessage),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text("Cancel"),
                ),
              ],
            );
          });
    }
  }

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
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
          style: FlutterFlowTheme.title2.override(
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
                          style: FlutterFlowTheme.bodyText1.override(
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
                              textController: textController1,
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
                              textController: textController2,
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
                              textController: textController3,
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
                                          FlutterFlowTheme.bodyText1.override(
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
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  submit(context);
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
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.black87,
                                ),
                              ),

                              // Sign up
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text(
                                  'Sign in',
                                  style: FlutterFlowTheme.bodyText1.override(
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
