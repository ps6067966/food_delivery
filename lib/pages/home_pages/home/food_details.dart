import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery/constant/theme.dart';
import 'package:food_delivery/widgets/custom_button.dart';

class FoodDetailPage extends StatefulWidget {
  final String name;
  final String url;
  final String foodDescription;
  final int foodDeliveryTime;
  final int foodPrice;
  final bool isDishVeg;
  final VoidCallback onAddPressed;
  final VoidCallback onImgPressed;
  final bool isLoggedIn;

  FoodDetailPage(
      {this.name,
      this.url =
          "https://images.unsplash.com/photo-1594007654729-407eedc4be65?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=369&q=80",
      this.foodDescription = "foodDescription",
      this.foodDeliveryTime = 0,
      this.foodPrice = 0,
      this.isDishVeg = false,
      this.onAddPressed,
      this.onImgPressed, this.isLoggedIn=false});
  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  int foodPrice = 0;

  @override
  void initState() {
    super.initState();
    foodPrice = widget.foodPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: Hero(
                tag: widget.name,
                child: Image.network(
                  widget.url,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 10, 10),
              child: ClipOval(
                child: Material(
                  color: Colors.orange[100].withOpacity(0.5), // button color
                  child: InkWell(
                    splashColor: Colors.orange, // inkwell color
                    child: SizedBox(
                      width: 35,
                      height: 35,
                      child: Icon(Icons.chevron_left_outlined),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: MediaQuery.of(context).size.height - 270,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    shape: BoxShape.rectangle,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          widget.name,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: CustomTheme.bodyText1.override(
                                            color: Colors.black,
                                            fontFamily: 'Poppins',
                                            fontSize: 21,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10.0),
                                        child: Container(
                                          width: 25,
                                          height: 25,
                                          child: Image(
                                            image: AssetImage(widget.isDishVeg
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
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      '₹ ${widget.foodPrice}',
                                      style: CustomTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                          fontSize: 19,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      'Ingredients',
                                      style: CustomTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text(
                                      widget.foodDescription,
                                      maxLines: 3,
                                      style: CustomTheme.bodyText1.override(
                                          fontFamily: 'Poppins', fontSize: 14),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      'Delivery in',
                                      style: CustomTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 4, 0, 0),
                                    child: Text(
                                      '${widget.foodDeliveryTime} min',
                                      style: CustomTheme.bodyText1.override(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      'Select',
                                      style: CustomTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  Container(
                                    height: 33,
                                    transform: Matrix4.translationValues(
                                        0.0, -20.0, 0.0),
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            Icons.add_box,
                                            color: CustomTheme.primaryColor,
                                            size: 40,
                                          ),
                                          onPressed: () => setState(() =>
                                              foodPrice += widget.foodPrice),
                                        ),
                                        Container(
                                          color: Color(0xFFE8E8E8),
                                          height: 30,
                                          padding:
                                              EdgeInsets.fromLTRB(10, 0, 10, 0),
                                          transform: Matrix4.translationValues(
                                              -6.0, 13.0, 0.0),
                                          child: Center(
                                            child: Text(
                                              "₹  $foodPrice",
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          transform: Matrix4.translationValues(
                                              -20.0, 0.0, 0.0),
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.indeterminate_check_box,
                                              color: CustomTheme.primaryColor,
                                              size: 40,
                                            ),
                                            onPressed: () => setState(() {
                                              if (foodPrice != widget.foodPrice)
                                                foodPrice -= widget.foodPrice;
                                            }),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SocialButton(
                                      icon: FaIcon(Icons.shopping_bag_outlined),
                                      text: "Add to Bag",
                                      onPressed: () {
                                        print(foodPrice);
                                        var user = FirebaseAuth.instance.currentUser;
                                        if (user == null) {
                                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text('You are not Logged in')),
                                          );
                                          return;
                                        }else{
                                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text('Added to Bag')),
                                          );
                                          Navigator.pop(context);
                                        }
                                      },
                                      color: CustomTheme.primaryColor)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
