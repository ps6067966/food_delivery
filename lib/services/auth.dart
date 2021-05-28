import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery/services/user.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthBase {
  Stream<CustomUser> get user;
  Future<CustomUser> currentUser();
  Future<CustomUser> signInAnonymously();
  Future<CustomUser> signInWithEmailAndPassword(String email, String password);
  Future<CustomUser> createUserWithEmailAndPassword(
      String name, String email, String password);
  Future<CustomUser> changePassword(String email, String oldPassword, String newPassword);
  Future<CustomUser> signInWithGoogle();
  Future<void> signOut();
}

class Auth implements AuthBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // create user obj based on fire base user
  CustomUser _userFromFirebaseUser(User user) {
    return user != null ? CustomUser(uid: user.uid,displayName: user.displayName) : null;
  }

  @override
  Stream<CustomUser> get user {
    return _firebaseAuth
        .authStateChanges()
        .map((User user) => _userFromFirebaseUser(user));
  }

  @override
  Future<CustomUser> currentUser() async {
    final user = _firebaseAuth.currentUser;
    return _userFromFirebaseUser(user);
  }

  @override
  Future<CustomUser> signInAnonymously() async {
    try {
      final authResult = await _firebaseAuth.signInAnonymously();
      return _userFromFirebaseUser(authResult.user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<CustomUser> signInWithEmailAndPassword(
      String email, String password) async {
    // try {
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebaseUser(authResult.user);
    // }catch (e) {
    //   print(e);
    //   return null;
    // }
  }

  @override
  Future<CustomUser> createUserWithEmailAndPassword(
      String name, String email, String password) async {
    // try {
      final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      authResult.user.updateProfile(displayName: name);
      return _userFromFirebaseUser(authResult.user);
    // } catch (e) {
    //   print(e.toString());
    //   return null;
    // }
  }


  Future<CustomUser> changePassword(String email, String oldPassword, String newPassword) async{

    AuthCredential credential = EmailAuthProvider.credential(email: email, password: oldPassword);
    final currentUser =  _firebaseAuth.currentUser;
    print(currentUser);

    return await currentUser.reauthenticateWithCredential(credential)
        .then((_) async{
      await currentUser.updatePassword(newPassword);
      return _userFromFirebaseUser(currentUser);
    })
        .catchError((error){
      return _userFromFirebaseUser(currentUser);
    });
  }

  @override
  Future<CustomUser> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        final authResult = await _firebaseAuth.signInWithCredential(
          GoogleAuthProvider.credential(
            idToken: googleAuth.idToken,
            accessToken: googleAuth.accessToken,
          ),
        );
        return _userFromFirebaseUser(authResult.user);
      } else {
        // throw PlatformException(
        //   code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
        //   message: 'Missing Google Auth Token',
        // );
        // print(e.toString());
        return null;
      }
    } else {
      // throw PlatformException(
      //   code: 'ERROR_ABORTED_BY_USER',
      //   message: 'Sign in aborted by user',
      // );
      // print(e.toString());
      return null;
    }
  }

  @override
  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}
