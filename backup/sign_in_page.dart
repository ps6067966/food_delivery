// import 'package:food_delivery/constant/theme.dart';
// import 'package:food_delivery/widgets/custom_button.dart';
// import 'package:food_delivery/widgets/custom_check_box.dart';
// import 'package:food_delivery/widgets/custom_text_field.dart';
// import 'package:food_delivery/widgets/flow_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// class SignInPage extends StatefulWidget {
//   SignInPage({Key key}) : super(key: key);
//
//   @override
//   _SignInPageState createState() => _SignInPageState();
// }
//
// class _SignInPageState extends State<SignInPage> {
//   TextEditingController textController1;
//   TextEditingController textController2;
//   bool checkboxListTileValue;
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     textController1 = TextEditingController();
//     textController2 = TextEditingController();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     height: 100,
//                     decoration: BoxDecoration(
//                       color: Color(0xFFFAFAFA),
//                     ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.max,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
//                           child: IconButton(
//                             onPressed: () {
//                               print('IconButton pressed ...');
//                             },
//                             icon: Icon(
//                               Icons.arrow_back_ios,
//                               color: Colors.black,
//                               size: 17,
//                             ),
//                             iconSize: 17,
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.fromLTRB(65, 0, 0, 0),
//                           child: Text(
//                             'Sign in',
//                             textAlign: TextAlign.center,
//                             style: FlutterFlowTheme.title2.override(
//                               fontFamily: 'Poppins',
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   Container(
//                     width: 220,
//                     decoration: BoxDecoration(
//                       color: Color(0xFFFAFAFA),
//                       shape: BoxShape.rectangle,
//                     ),
//                     child: Text(
//                       'Please enter your email or phone number to sign in',
//                       textAlign: TextAlign.center,
//                       style: FlutterFlowTheme.bodyText1.override(
//                         fontFamily: 'Poppins',
//                         fontSize: 13,
//                         color: Colors.black87,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               Column(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   // TextFiled
//                   Column(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(22, 30, 20, 20),
//                         child: CustomTextFormField(
//                           iconData: Icons.person_outlined,
//                           hintText: 'Email or Phone number',
//                           textController: textController1,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(22, 0, 22, 2),
//                         child: CustomTextFormField(
//                           iconData: Icons.lock_outline,
//                           hintText: 'Password',
//                           textController: textController2,
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.fromLTRB(1, 0, 22, 0),
//                         child: Container(
//                           width: double.infinity,
//                           height: 50,
//                           decoration: BoxDecoration(
//                             color: Color(0xFFFAFAFA),
//                           ),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               CustomCheckBoxWithName(
//                                   value: checkboxListTileValue ?? true,
//                                   onChanged: (newValue) {
//                                     setState(() {
//                                       checkboxListTileValue = newValue;
//                                     });
//                                   },
//                                   text: 'Remember me'),
//                               TextButton(
//                                 onPressed: () {},
//                                 child: Text(
//                                   'Forgot Password',
//                                   style: FlutterFlowTheme.bodyText1.override(
//                                     fontFamily: 'Poppins',
//                                     color: Color(0xFFFFB90B),
//                                     fontSize: 12,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       CustomButton(text: 'Sign in', onPressed: () {}),
//                       Row(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'Don\'t have an account? ',
//                             style: FlutterFlowTheme.bodyText1.override(
//                               fontFamily: 'Poppins',
//                               color: Colors.black87,
//                             ),
//                           ),
//                           TextButton(
//                             onPressed: () {},
//                             child: Text(
//                               'Sign up',
//                               style: FlutterFlowTheme.bodyText1.override(
//                                 fontFamily: 'Poppins',
//                                 color: Color(0xFFFFB90B),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//
//                   // or
//                   Padding(
//                     padding: EdgeInsets.fromLTRB(0, 25, 0, 25),
//                     child: Text(
//                       'OR',
//                       textAlign: TextAlign.center,
//                       style: FlutterFlowTheme.bodyText1.override(
//                         fontFamily: 'Poppins',
//                         fontSize: 13,
//                       ),
//                     ),
//                   ),
//
//                   // Social button
//                   Column(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       // facebook button
//                       SocialButton(
//                         icon: FaIcon(FontAwesomeIcons.facebookF),
//                         text: "Connect with Facebook",
//                         onPressed: () {},
//                         color: Colors.blue[800],
//                       ),
//
//                       // google button
//                       SocialButton(
//                         icon: FaIcon(FontAwesomeIcons.google),
//                         text: "Connect with Google    ",
//                         onPressed: () {},
//                         color: Colors.red[800],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
