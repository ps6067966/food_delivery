import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:food_delivery/models/items.dart';
import 'package:food_delivery/widgets/FlatButton.dart';

int counter = 0;
double width;

class OrderCard extends StatelessWidget {
  final int itemCount;
  final String orderId;
  final DocumentSnapshot data;
  ItemModel model;

  OrderCard({Key key, this.itemCount, this.orderId, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map> foodDetails = List.from(data.data()['foodDetails']);
    model = ItemModel.fromJson(data.data());
    width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                model.dateDay,
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
          Container(
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1,
              ),
            ),
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.all(20.0),
            height: itemCount * 250.0,
            child: ListView.builder(
              itemCount: itemCount,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (c, index) {
                return sourceOrderInfo(model, foodDetails, index, context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget sourceOrderInfo(
    ItemModel model, List<Map> foodDetails, int index, BuildContext context,
    {Color background, removeCartFunction}) {
  return Container(
    padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
    color: Colors.white,
    width: width,
    child: Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                child: Text(
                  foodDetails[index]['foodName'],
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Container(
                width: 20,
                height: 20,
                child: Image(
                  image: AssetImage(foodDetails[index]['isVeg'] == true
                      ? 'assets/images/veg.jpg'
                      : 'assets/images/nonVeg.jpg'),
                  fit: BoxFit.scaleDown,
                  color: null,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 0.0),
                    child: Row(
                      children: [
                        Text(
                          "₹ ",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          foodDetails[index]['foodPrice'].toString(),
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Delivered to:",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            model.address,
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 14.0,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: FButton(
                  title: 'REORDER',
                  width: 1000,
                ),
              ),
              SizedBox(
                width: 25.0,
              ),
              Expanded(
                child: FButton(
                  title: 'Rate Food',
                  width: 1000,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
