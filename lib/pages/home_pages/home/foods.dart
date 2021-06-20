import 'package:cached_network_image/cached_network_image.dart';
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
      this.onImgPressed,
      @required this.foodId})
      : super(key: key);

  final String foodId;
  final String foodUrl;
  final String dishName;
  final String foodDescription;
  final int foodDeliveryTime;
  final int foodPrice;
  final bool isDishVeg;
  final VoidCallback onAddPressed;
  final VoidCallback onImgPressed;

  _openDetail(context, name, url, foodDescription, foodDeliveryTime, foodPrice,
      isDishVeg,foodId) {
    final route = MaterialPageRoute(
      builder: (context) => FoodDetailPage(
        name: name,
        url: url,
        foodDescription: foodDescription,
        foodDeliveryTime: foodDeliveryTime,
        foodPrice: foodPrice,
        isDishVeg: isDishVeg,
        foodId: foodId,
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
        height: 160,
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
                  foodDescription, foodDeliveryTime, foodPrice, isDishVeg,foodId),
              child: Hero(
                tag: foodId,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: foodUrl,
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: 135,
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
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text(
                                dishName,
                                maxLines: 3,
                                overflow: TextOverflow.visible,
                                style: CustomTheme.bodyText1.override(
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              width: 20,
                              height: 20,
                              child: Image(
                                image: AssetImage(isDishVeg
                                    ? 'assets/images/veg.jpg'
                                    : 'assets/images/nonVeg.jpg'),
                                fit: BoxFit.scaleDown,
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
                              fontSize: 10,
                            ),
                          ),
                        ),
                        Spacer(),
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
