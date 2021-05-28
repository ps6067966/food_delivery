import 'package:flutter/material.dart';
import 'package:food_delivery/pages/login.dart';
import 'package:food_delivery/services/auth.dart';
import 'package:food_delivery/services/user.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final CustomUser user;

  const Home({Key key, this.user}) : super(key: key);

  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm"),
          content: const Text("Are you sure you want to log out?"),
          actions: <Widget>[
            TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text(
                  "Log out",
                  style: TextStyle(color: Colors.redAccent),
                )),
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
    if (didRequestSignOut == true) {
      // Navigator.pop(context);
      _signOut(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Home",
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                "User Signed in :  ${user != null ? user.uid != null : "false"}",
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                "User id : ${user != null ? user.uid : ""}",
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                "User name : ${user != null ? user.displayName : ""}",
                style: TextStyle(fontSize: 20.0),
              ),
              user != null
                  ? user.uid == null
                      ? ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        LoginScreen.create(context)));
                          },
                          child: Text("Sign in"))
                      : ElevatedButton(
                          onPressed: () => _confirmSignOut(context),
                          child: Text("Log Out"))
                  : ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    LoginScreen.create(context)));
                      },
                      child: Text("Sign in"))
            ],
          ),
        ),
      ),
    );
  }
}
