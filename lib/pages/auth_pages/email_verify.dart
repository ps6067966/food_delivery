import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/constant/theme.dart';
import 'package:food_delivery/pages/home_pages/nav_bar_page.dart';

class VerifyScreen extends StatefulWidget {
  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final auth = FirebaseAuth.instance;
  User user;
  Timer timer;
  bool isenabled = true;

  @override
  void initState() {
    user = auth.currentUser;
    user.sendEmailVerification();
    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Verification status',
          textAlign: TextAlign.center,
          style: CustomTheme.title2.override(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color(0xFFFAFAFA),
        leading: IconButton(
          splashRadius: 20,
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 17,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
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
                  'An email has been sent to ${user.email} please verify',
                  textAlign: TextAlign.center,
                  style: CustomTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Already have account?
                Text(
                  'Did\'nt receive verification email? ',
                  style: CustomTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Colors.black87,
                  ),
                ),

                // Resend Email verification
                TextButton(
                  onPressed: isenabled
                      ? () {
                          setState(() {
                            isenabled = false;
                          });
                          user.sendEmailVerification();
                          Timer(Duration(seconds: 10), () {
                            setState(() {
                              isenabled = true;
                            });
                          });
                        }
                      : null,
                  child: Text(
                    'Resend',
                    style: CustomTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: isenabled ? Color(0xFFFFB90B) : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            Center(
                child: CircularProgressIndicator(
              color: Color(0xFFFFB90B),
            )),
          ],
        ),
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => NavBarPage(
            initialPage: 'HomePage',
            isLoggedIn: true,
          ),
        ),
        (r) => false,
      );
    }
  }
}
