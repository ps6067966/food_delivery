import 'package:flutter/material.dart';
import 'package:food_delivery/constant/theme.dart';

class Checkout extends StatefulWidget {
  Checkout({Key key}) : super(key: key);

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 10.0,
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left_outlined,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Checkout",
            style: TextStyle(
              color: CustomTheme.primaryColor,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: OutlinedButton(
              onPressed: () {},
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                    BorderSide(color: CustomTheme.primaryColor)),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                child: Text(
                  "Implement it here for now",
                  style: TextStyle(
                      color: CustomTheme.primaryColor, fontSize: 16.0
                    ),
                ),
              ),
            ),
          )
        ),
      ),
    );
  }
}