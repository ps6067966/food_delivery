import 'package:flutter/foundation.dart';
import 'package:food_delivery/services/auth.dart';
import 'package:food_delivery/services/user.dart';

class LogInManager {
  LogInManager({@required this.auth, @required this.isLoading});
  final AuthBase auth;
  final ValueNotifier<bool> isLoading;

  Future<CustomUser> _signIn(Future<CustomUser> Function() signInMethod) async {
    try {
      isLoading.value = true;
      return await signInMethod();
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }

  Future<CustomUser> signInAnonymously() async => await _signIn(auth.signInAnonymously);
}