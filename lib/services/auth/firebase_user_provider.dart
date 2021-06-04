import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class FirebaseUser {
  FirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

FirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<FirebaseUser> firebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
        .map<FirebaseUser>(
            (user) => currentUser = FirebaseUser(user));
