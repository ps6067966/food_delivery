import 'package:flutter/material.dart';
import 'package:food_delivery/pages/home.dart';
import 'package:food_delivery/services/auth.dart';
import 'package:food_delivery/services/user.dart';
import 'package:provider/provider.dart';

import 'login.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<CustomUser>(
      stream: auth.user,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          CustomUser user = snapshot.data;
          if (user == null) {
            return LoginScreen.create(context);
          }
          return Provider<CustomUser>.value(
            value: user,
            // child: Provider<Database>(
            //   create: (_) => FirestoreDatabase(uid: user.uid),
            //   child: SurveysPage(),
            // ),
            child: Home(
              user: user,
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
