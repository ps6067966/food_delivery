import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/constant/theme.dart';

import 'food_details.dart';

class Food extends StatelessWidget {
  Food(
      {Key key,
      this.foodUrl = 'https://picsum.photos/seed/967/600',
      @required this.dishName,
      @required this.foodDescription,
      @required this.foodDeliveryTime,
      @required this.foodPrice,
      @required this.isDishVeg,
      this.onAddPressed,
      this.onImgPressed})
      : super(key: key);

  final String foodUrl;
  final String dishName;
  final String foodDescription;
  final int foodDeliveryTime;
  final int foodPrice;
  final bool isDishVeg;
  final VoidCallback onAddPressed;
  final VoidCallback onImgPressed;

  _openDetail(context, name, url, foodDescription, foodDeliveryTime, foodPrice,
      isDishVeg) {
    final route = MaterialPageRoute(
      builder: (context) => FoodDetailPage(
        name: name,
        url: url,
        foodDescription: foodDescription,
        foodDeliveryTime: foodDeliveryTime,
        foodPrice: foodPrice,
        isDishVeg: isDishVeg,
      ),
    );
    Navigator.push(context, route);
  }

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Container(
        width: MediaQuery.of(context).size.width / 4,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          shape: BoxShape.rectangle,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            InkWell(
              onTap: () => _openDetail(context, dishName, foodUrl,
                  foodDescription, foodDeliveryTime, foodPrice, isDishVeg),
              child: Hero(
                tag: dishName,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    foodUrl,
                    width: MediaQuery.of(context).size.width / 2.7,
                    height: 160,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
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
                                  fontSize: 14,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
