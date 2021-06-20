import 'package:flutter/material.dart';
import 'package:food_delivery/constant/theme.dart';
import 'package:food_delivery/widgets/flow_widget.dart';

class FoodType extends StatelessWidget {
  const FoodType({Key key,@required this.foodName}) : super(key: key);
  final String foodName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: FFButtonWidget(
          onPressed: () {},
          text: foodName,
          options: FFButtonOptions(
            // width: MediaQuery.of(context).size.width *0.2,
            height: 30,
            color: Colors.white,
            textStyle: CustomTheme.title2.override(
              fontFamily: 'Poppins',
              color: CustomTheme.primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            elevation: 0,
            borderSide: BorderSide(
              color: Color(0xFFB8B3B3),
              width: 1,
            ),
            borderRadius: 20,
          ),
        ),
      ),
    );
  }
}
