import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery/constant/theme.dart';
import 'package:food_delivery/pages/sign_up.dart';
import 'package:food_delivery/services/auth.dart';
import 'package:food_delivery/widgets/custom_button.dart';
import 'package:food_delivery/widgets/custom_check_box.dart';
import 'package:food_delivery/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'log_in_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key key,
    @required this.manager,
    @required this.isLoading,
  }) : super(key: key);
  final LogInManager manager;
  final bool isLoading;

  static Widget create(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    return ChangeNotifierProvider<ValueNotifier<bool>>(
      create: (_) => ValueNotifier<bool>(false),
      child: Consumer<ValueNotifier<bool>>(
        builder: (_, isLoading, __) => Provider<LogInManager>(
          create: (_) => LogInManager(auth: auth, isLoading: isLoading),
          child: Consumer<LogInManager>(
            builder: (context, manager, _) => LoginScreen(
              manager: manager,
              isLoading: isLoading.value,
            ),
          ),
        ),
      ),
    );
  }

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController textController1;
  TextEditingController textController2;
  bool checkboxListTileValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  AuthBase auth;
  String email, password;
  String errorMessage = "An undefined Error happened.";
  bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  bool validateEmail(String value) {
    Pattern pattern = r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  Future<void> submit(BuildContext context) async {
    try {
      auth = Provider.of<AuthBase>(context, listen: false);
      var result = await auth.signInWithEmailAndPassword(email, password);
      print(result);
      if(result!=null){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home(user: result,),
          ),
        );
      }else{
        // showDialog(
        //     barrierDismissible: true,
        //     context: context,
        //     builder: (context) {
        //       return AlertDialog(
        //         title: Text('Sign in failed'),
        //         content: Text(errorMessage),
        //         actions: <Widget>[
        //           TextButton(
        //             onPressed: () => Navigator.of(context).pop(false),
        //             child: const Text("Cancel"),
        //           ),
        //         ],
        //       );
        //     });
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      switch (e.code) {
        case "invalid-email":
          errorMessage = "Your email address is incorrect";
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
              title: Text('Sign in failed'),
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

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInWithGoogle();
      // await widget.manager.signInWithGoogle();
    } on FirebaseAuthException catch (e) {
      if (e.code != 'ERROR_ABORTED_BY_USER') {
        showDialog(
            barrierDismissible: true,
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Sign in failed'),
                content: Text(e.toString()),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Sign in',
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.title2.override(
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Home())
              );
            },
            icon: Icon(
              Icons.chevron_left_outlined,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
        //     child: IconButton(
        //       splashRadius: 20,
        //       onPressed: () {
        //         Navigator.push(context,
        //             MaterialPageRoute(builder: (context) => Home())
        //         );
        //       },
        //       icon: Icon(
        //         Icons.close_outlined,
        //         color: Colors.black,
        //         size: 20,
        //       ),
        //     ),
        //   ),
        // ],
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

                          // email text field
                          Padding(
                            padding: const EdgeInsets.fromLTRB(22, 30, 20, 20),
                            child: CustomTextFormField(
                              iconData: Icons.person_outlined,
                              hintText: 'Email or Phone number',
                              textController: textController1,
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
                              textController: textController2,
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

                          //Sign in Button
                          CustomButton(
                              text: 'Sign in',
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  submit(context);
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
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.black87,
                                ),
                              ),

                              // Sign up button
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      PageRouteBuilder(transitionsBuilder:
                                          (context, animation, anotherAnimation,
                                              child) {
                                        return SlideTransition(
                                          position: Tween<Offset>(
                                            begin: const Offset(1, 0),
                                            end: Offset.zero,
                                          ).animate(animation),
                                          child: child,
                                        );
                                      }, pageBuilder: (BuildContext context,
                                          Animation<double> animation,
                                          Animation<double>
                                              secondaryAnimation) {
                                        return SignUpScreen();
                                      }));
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
                        ],
                      ),
                    ),

                    // or
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 25, 0, 25),
                      child: Text(
                        'OR',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.bodyText1.override(
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

                        // facebook button
                        SocialButton(
                          icon: FaIcon(FontAwesomeIcons.facebookF),
                          text: "Connect with Facebook",
                          onPressed: () {},
                          color: Colors.blue[800],
                        ),

                        // google button
                        SocialButton(
                          icon: FaIcon(FontAwesomeIcons.google),
                          text: "Connect with Google    ",
                          // onPressed: () {},
                          onPressed: () => _signInWithGoogle(context),
                          color: Colors.red[800],
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
