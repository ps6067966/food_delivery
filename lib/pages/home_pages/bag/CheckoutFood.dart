import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/constant/theme.dart';

class CheckoutFood extends StatelessWidget {
  CheckoutFood(
    {
      Key key,
      @required this.dishName,
      @required this.foodDescription,
      @required this.foodDeliveryTime,
      @required this.foodPrice,
      @required this.isDishVeg,
      this.onAddPressed,
      this.onImgPressed
    }
  ) : super(key: key);

  final String dishName;
  final String foodDescription;
  final int foodDeliveryTime;
  final int foodPrice;
  final bool isDishVeg;
  final VoidCallback onAddPressed;
  final VoidCallback onImgPressed;

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Container(
        width: MediaQuery.of(context).size.width/4,
        height: 170,
        decoration: BoxDecoration(
          border: Border.all(
            color: CustomTheme.secondaryColor
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          shape: BoxShape.rectangle,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10, top: 15),
                  child: Text(
                    dishName,
                    maxLines: 3,
                    overflow: TextOverflow.visible,
                    style: CustomTheme.bodyText1.override(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 10.0, top: 10),
                  child: Container(
                    width: 20,
                    height: 20,
                    child: Image(
                      image: AssetImage(isDishVeg
                          ? 'assets/images/veg.jpg'
                          : 'assets/images/nonVeg.jpg'),
                      fit: BoxFit.scaleDown,
                      color: null,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(
                foodDescription,
                maxLines: 3,
                style: CustomTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  fontSize: 13
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(
                '$foodDeliveryTime min',
                style: CustomTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  fontSize: 13,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    '₹ $foodPrice',
                    style: CustomTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(0),
                  ),
                  onPressed: onAddPressed,
                  icon: Icon(
                    Icons.add_box,
                    color: CustomTheme.primaryColor,
                    size: 33,
                  ),
                  label: Container(
                    height: 25,
                    padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                    decoration: BoxDecoration(
                      color: Color(0xFFE8E8E8),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(4),
                          bottomRight: Radius.circular(4)),
                    ),
                    transform:
                        Matrix4.translationValues(-13.0, 0.0, 0.0),
                    child: Center(
                      child: Text(
                        " Add ",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
