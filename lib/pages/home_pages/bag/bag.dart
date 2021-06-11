import 'package:flutter/material.dart';

import 'empty_bag.dart';

class BagPage extends StatelessWidget {
  const BagPage({Key key, @required this.onPressed}) : super(key: key);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: 
      EmptyBag( onPressed: onPressed,),
    );
  }
}
