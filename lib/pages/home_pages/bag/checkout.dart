import 'package:flutter/material.dart';
import 'package:food_delivery/constant/theme.dart';

import 'CheckoutFood.dart';

class Checkout extends StatefulWidget {
  Checkout({Key key}) : super(key: key);

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    Map details = {
      'items': [
        {
          'name': 'Italian Pizza',
          'ingredients':
              'dragon toungue, Tomato, cheese, capsicum, jalapeno, olive',
          'time': 28,
          'price': 250,
          'quantity': 1,
          'isVeg': false
        },
        {
          'name': 'eyeball Pasta',
          'ingredients':
              'some dummy ingredients, idk, magic, dragon eye, witch wands',
          'time': 1609,
          'price': 36679,
          'quantity': 1,
          'isVeg': true
        },
        {
          'name': 'dummfood',
          'ingredients':
              'dummy dum ingredients, some furiosity, dumdum, dumpkings, soup',
          'time': 1609,
          'price': 36679,
          'quantity': 1,
          'isVeg': true
        }
      ],
      'delivery time': 30,
      'tax': 10
    };

    print(details['items'][0]);

    return Scaffold(
      backgroundColor: Colors.white,
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
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              bottom: 40,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Total Items: ${details['items'].length}',
                          style: CustomTheme.title3,
                        ),
                        Container(
                          height: height / 4,
                          child: Center(
                            child: ListView.builder(
                              itemCount: details['items'].length,
                              itemBuilder: (context, index) {
                                // return Text(details['items'][index]['name']);
                                // return Food(
                                //   dishName: 'okay',
                                //   foodDescription: 'okay',
                                //   foodDeliveryTime: 28,
                                //   foodPrice: 250,
                                //   isDishVeg: true
                                // );
                                return CheckoutFood(
                                    dishName: details['items'][index]['name'],
                                    foodDescription: details['items'][index]
                                        ['ingredients'],
                                    foodDeliveryTime: details['items'][index]
                                        ['time'],
                                    foodPrice: details['items'][index]['price'],
                                    isDishVeg: details['items'][index]
                                        ['isVeg']);
                              },
                            ),
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
                                  Text('₹250', style: CustomTheme.subtitle2)
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
                                  Text('₹36969', style: CustomTheme.title3)
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.3,
              maxChildSize: 0.5,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.black,
                          blurRadius: 15,
                        )
                      ]),
                  child: ListView(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 5),
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
                            SizedBox(height: 5),
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
                            SizedBox(height: 8),
                            Divider(),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Text('Amount to Pay:      ',style: CustomTheme.subtitle2),
                                Text(
                                  '₹36969',
                                  style: CustomTheme.subtitle2.override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold
                                  )
                                )
                              ],
                            ),
                            SizedBox(height: 14),
                            Container(
                              height: 60,
                              decoration: BoxDecoration(
                                color: CustomTheme.primaryColor,
                                borderRadius: BorderRadius.circular(20),

                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Place Order',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_right_rounded,
                                      size: 37,
                                      color: Colors.white,
                                    )
                                  ],
                                )
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ));
  }
}
