import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/constant/theme.dart';

class BagItems extends StatelessWidget {
  const BagItems(
      {Key key,
      this.foodUrl = 'https://picsum.photos/seed/967/600',
      @required this.dishName,
      @required this.foodDescription,
      @required this.foodDeliveryTime,
      @required this.foodPrice,
      @required this.isDishVeg,
      @required this.onDeletePressed,
      this.quantity = 0})
      : super(key: key);

  final String foodUrl;
  final String dishName;
  final String foodDescription;
  final int foodDeliveryTime;
  final int foodPrice;
  final bool isDishVeg;
  final num quantity;
  final VoidCallback onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          shape: BoxShape.rectangle,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: foodUrl,
                width: MediaQuery.of(context).size.width / 2.5,
                height: 140,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.4,
                      child: Text(
                        foodDescription,
                        // maxLines: 3,
                        style: CustomTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          fontSize: 10,
                        ),
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
                      Container(
                        width: 25,
                        height: 25,
                        child: Center(
                          child: Text(
                            quantity.toInt().toString(),
                            style: TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: CustomTheme.primaryColor),
                      ),
                      IconButton(
                          splashRadius: 20,
                          onPressed: onDeletePressed,
                          icon: Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                          )),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
