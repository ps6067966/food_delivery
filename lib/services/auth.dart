import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery/services/user.dart';

abstract class AuthBase {
  Stream<CustomUser?> get user;
  Future<CustomUser?> currentUser();
  Future<CustomUser?> signInAnonymously();
  Future<CustomUser?> signInWithEmailAndPassword(String email, String password);
  Future<CustomUser?> createUserWithEmailAndPassword(
    String email,
    String password,
  );
  Future<CustomUser?> changePassword(
    String email,
    String oldPassword,
    String newPassword,
  );
  Future<void> signOut();
}

class Auth implements AuthBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // create user obj based on fire base user
  CustomUser? _userFromFirebaseUser(User? user) {
    return user != null ? CustomUser(uid: user.uid) : null;
  }

  @override
  Stream<CustomUser?> get user {
    return _firebaseAuth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user));
  }

  @override
  Future<CustomUser?> currentUser() async {
    final user = _firebaseAuth.currentUser;
    return _userFromFirebaseUser(user);
  }

  @override
  Future<CustomUser?> signInAnonymously() async {
    try {
      final authResult = await _firebaseAuth.signInAnonymously();
      return _userFromFirebaseUser(authResult.user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<CustomUser?> signInWithEmailAndPassword(
      String email, String password) async {
    // try {
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebaseUser(authResult.user);
    // } catch (e) {
    //   print(e);
    //   return null;
    // }
  }

  @override
  Future<CustomUser?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return _userFromFirebaseUser(authResult.user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<CustomUser?> changePassword(
      String email, String oldPassword, String newPassword) async {
    AuthCredential credential =
        EmailAuthProvider.credential(email: email, password: oldPassword);
    final currentUser = _firebaseAuth.currentUser!;
    print(currentUser);

    return await currentUser
        .reauthenticateWithCredential(credential)
        .then((_) async {
      await currentUser.updatePassword(newPassword);
      return _userFromFirebaseUser(currentUser);
    }).catchError((error) {
      return _userFromFirebaseUser(currentUser);
    });
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
