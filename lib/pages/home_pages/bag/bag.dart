import 'package:flutter/material.dart';
import 'empty_bag.dart';

class BagPage extends StatelessWidget {
  const BagPage({Key key, @required this.onPressed, this.isLoggedIn = false})
      : super(key: key);
  final VoidCallback onPressed;
  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: EmptyBag(onPressed: onPressed),
    );
  }
}
