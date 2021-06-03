import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/services/auth.dart';
import 'package:provider/provider.dart';

import 'log_in_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
    required this.manager,
    required this.isLoading,
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
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _signInAnonymously(BuildContext context) async {
    try {
      await widget.manager.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login"),
            ElevatedButton(
                onPressed: () => _signInAnonymously(context),
                child: Text("Go Anon"))
          ],
        ),
      ),
    );
  }
}
