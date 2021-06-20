import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery/constant/theme.dart';
import 'package:food_delivery/models/food_model.dart';
import 'package:food_delivery/widgets/custom_button.dart';

import 'checkout_foods.dart';

class Checkout extends StatefulWidget {
  Checkout(
      {Key key,
      @required this.totalItems,
      @required this.listOfFoodModel,
      @required this.totalAmount})
      : super(key: key);

  final num totalItems;
  final num totalAmount;
  final List<FoodModel> listOfFoodModel;

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 10.0,
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left_outlined,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            "Checkout",
            style: TextStyle(color: CustomTheme.primaryColor),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Total Items: ${widget.totalItems}',
                          style: CustomTheme.title3,
                        ),
                        Container(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: widget.listOfFoodModel.length,
                            itemBuilder: (context, index) {
                              return CheckoutFood(
                                  dishName: widget.listOfFoodModel
                                      .elementAt(index)
                                      .foodName,
                                  foodDescription: widget.listOfFoodModel
                                      .elementAt(index)
                                      .foodIngredients,
                                  foodDeliveryTime: widget.listOfFoodModel
                                      .elementAt(index)
                                      .foodDeliveryTime,
                                  foodPrice: widget.listOfFoodModel
                                      .elementAt(index)
                                      .foodPrice,
                                  isDishVeg: widget.listOfFoodModel
                                      .elementAt(index)
                                      .isVeg);
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.all(18),
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Item Total',
                                      style: CustomTheme.subtitle2),
                                  Text('₹${widget.totalAmount}',
                                      style: CustomTheme.subtitle2)
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Delivery Charge',
                                      style: CustomTheme.subtitle2),
                                  Text('₹30', style: CustomTheme.subtitle2)
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Tax', style: CustomTheme.subtitle2),
                                  Text('₹10', style: CustomTheme.subtitle2)
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Grand Total'.toUpperCase(),
                                      style: CustomTheme.title3),
                                  Text('₹${widget.totalAmount + 40}',
                                      style: CustomTheme.title3)
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 150,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox.expand(
              child: DraggableScrollableSheet(
                initialChildSize: 0.4,
                maxChildSize: 0.5,
                minChildSize: 0.25,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    controller: scrollController,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          boxShadow: [
                            new BoxShadow(
                                color: Colors.grey[350],
                                blurRadius: 1,
                                offset: Offset(0, -2))
                          ]),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 40,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[350],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(children: <Widget>[
                              Icon(
                                Icons.timer_rounded,
                                color: CustomTheme.primaryColor,
                              ),
                              Text(
                                '  Delivery in: ',
                                style: CustomTheme.subtitle2,
                              ),
                              Text(
                                ' 25 mins',
                                style: CustomTheme.subtitle2.override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold),
                              )
                            ]),
                            SizedBox(height: 10),
                            Row(children: <Widget>[
                              Icon(
                                Icons.location_on_outlined,
                                color: CustomTheme.primaryColor,
                              ),
                              Flexible(
                                child: Text(
                                  '  DIPNI  APARTMENT, DTC Colony, Pitam Pura, Delhi, 110034',
                                  style: CustomTheme.subtitle2.override(
                                      fontFamily: 'Poppins', fontSize: 14),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ]),
                            SizedBox(height: 10),
                            Divider(),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text('Amount to Pay:      ',
                                    style: CustomTheme.subtitle2),
                                Text('₹${widget.totalAmount + 40}',
                                    style: CustomTheme.subtitle2.override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                            SizedBox(height: 15),
                            // Container(
                            //   height: 60,
                            //   decoration: BoxDecoration(
                            //     color: CustomTheme.primaryColor,
                            //     borderRadius: BorderRadius.circular(20),
                            //   ),
                            //   child: Center(
                            //       child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       Text(
                            //         'Place Order',
                            //         style: TextStyle(
                            //             fontFamily: 'Poppins',
                            //             fontSize: 20,
                            //             color: Colors.white,
                            //             fontWeight: FontWeight.bold),
                            //       ),
                            //       Icon(
                            //         Icons.keyboard_arrow_right_rounded,
                            //         size: 37,
                            //         color: Colors.white,
                            //       )
                            //     ],
                            //   )),
                            // ),
                            SocialButton(
                                icon: FaIcon(FontAwesomeIcons.chevronRight),
                                text: "Place Order",
                                onPressed: () {},
                                color: CustomTheme.primaryColor),
                            SizedBox(
                              height: 60,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
