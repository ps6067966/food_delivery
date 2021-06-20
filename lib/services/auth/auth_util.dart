import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/services/backend/firestore_services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'firebase_user_provider.dart';

/// Tries to sign in or create an account using Firebase Auth.
/// Returns the User object if sign in was successful.
Future<User> signInOrCreateAccount(
    BuildContext context, Future<UserCredential> Function() signInFunc) async {
  try {
    final userCredential = await signInFunc();
    await maybeCreateUser(userCredential.user);
    return userCredential.user;
  } on FirebaseAuthException catch (e) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: ${e.message}')),
    );
    return null;
  }
}

Future signOut() => FirebaseAuth.instance.signOut();

Future resetPassword({String email, BuildContext context}) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  } on FirebaseAuthException catch (e) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: ${e.message}')),
    );
    return null;
  }
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Password reset email sent!')),
  );
}

Future<User> signInWithEmail(
    BuildContext context, String email, String password) async {
  final signInFunc = () => FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email.trim(), password: password);
  return signInOrCreateAccount(context, signInFunc);
}

Future<User> createAccountWithEmail(
    BuildContext context,String name, String email, String password) async {
  final createAccountFunc = () => FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email.trim(), password: password)
    ..then((value) => value.user.updateDisplayName(name));
  return signInOrCreateAccount(context, createAccountFunc);
}

final _googleSignIn = GoogleSignIn();

Future<User> signInWithGoogle(BuildContext context) async {
  final signInFunc = () async {
    await signOutWithGoogle().catchError((_) => null);
    final auth = await (await _googleSignIn.signIn())?.authentication;
    if (auth == null) {
      return null;
    }
    final credential = GoogleAuthProvider.credential(
        idToken: auth.idToken, accessToken: auth.accessToken);
    return FirebaseAuth.instance.signInWithCredential(credential);
  };
  return signInOrCreateAccount(context, signInFunc);
}

Future signOutWithGoogle() => _googleSignIn.signOut();

String get currentUserEmail => currentUser?.user?.email ?? '';

String get currentUserUid => currentUser?.user?.uid ?? '';

String get currentUserDisplayName => currentUser?.user?.displayName ?? '';

String get currentUserPhoto =>
    currentUser?.user?.photoURL ?? 'https://i.stack.imgur.com/34AD2.jpg';
