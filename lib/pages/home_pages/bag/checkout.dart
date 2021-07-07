import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery/constant/theme.dart';
import 'package:food_delivery/models/food_model.dart';
import 'package:food_delivery/widgets/custom_button.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:food_delivery/services/auth/auth_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'checkout_foods.dart';
import 'package:food_delivery/pages/home_pages/nav_bar_page.dart';
import 'package:food_delivery/services/auth/firebase_user_provider.dart';
import 'package:food_delivery/pages/home_pages/home/home.dart';
import 'package:geocoder/geocoder.dart';
import 'package:location/location.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  Razorpay razorpay;
  String myAddress;
  String finalDateDay = '';

  @override
  void initState() {
    super.initState();
    getUserLocation();
    getDateDay();
    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerPaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  getDateDay() async {
    /*var date = new DateTime.now().toString();
    var dateParse = DateTime.parse(date);
    String month;
     */
    var date = new DateTime.now();
    String month;
    for (int i = 1; i <= 12; i++) {
      if (date.month == 1)
        month = "Jan";
      else if (date.month == 2)
        month = "Feb";
      else if (date.month == 3)
        month = "Mar";
      else if (date.month == 4)
        month = "Apr";
      else if (date.month == 5)
        month = "May";
      else if (date.month == 6)
        month = "June";
      else if (date.month == 7)
        month = "July";
      else if (date.month == 8)
        month = "Aug";
      else if (date.month == 9)
        month = "Sep";
      else if (date.month == 10)
        month = "Oct";
      else if (date.month == 11)
        month = "Nov";
      else
        month = "Dec";
    }

    var now = new DateTime.now();
    String day;
    for (int i = 1; i <= 7; i++) {
      if (now.weekday == 1)
        day = "Mon";
      else if (now.weekday == 2)
        day = "Tue";
      else if (now.weekday == 3)
        day = "Wed";
      else if (now.weekday == 4)
        day = "Thur";
      else if (now.weekday == 5)
        day = "Fri";
      else if (now.weekday == 6)
        day = "Sat";
      else
        day = "Sun";
    }

    var formattedDate = "${date.day} $month, $day";
    setState(() {
      finalDateDay = formattedDate.toString();
    });
  }

  getUserLocation() async {
    DocumentReference ref =
        FirebaseFirestore.instance.collection('users').doc(currentUserUid);
    ref.snapshots().first.then((DocumentSnapshot snapshot) {
      var data = snapshot.data();
      setState(() {
        myAddress = data["Address"] ?? "not added";
      });
    });
    /*LocationData myLocation;
    String error;
    Location location = new Location();
    try {
      myLocation = await location.getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'please grant permission';
        print(error);
      }
      if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error = 'permission denied- please enable it from app settings';
        print(error);
      }
      myLocation = null;
    }
    final coordinates =
        new Coordinates(myLocation.latitude, myLocation.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    // print(' ${first.locality}, ${first.adminArea},${first.subLocality},'
    //     ' ${first.subAdminArea},${first.addressLine}, ${first.featureName},'
    //     '${first.thoroughfare}, ${first.subThoroughfare}');
    setState(() {
      myAddress = "${first.addressLine},";
    });
    return first;
     */
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  void openCheckOut() {
    var options = {
      'key': 'rzp_test_lwsna0wDsghd4w',
      'amount': (widget.totalAmount + 40) * 100,
      'name': "AA HAA INN",
      'description': "Payment for your food",
      'prefill': {
        'contact': '8130163847',
        'email': currentUserEmail,
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void handlerPaymentSuccess(PaymentSuccessResponse response) async {
    List<Map> foodDetails = [];
    List<Map> fds = [];
    for (int i = 0; i < widget.listOfFoodModel.length; i++) {
      foodDetails.add({
        'foodId': widget.listOfFoodModel[i].foodId,
        'foodName': widget.listOfFoodModel[i].foodName,
        'foodPrice': widget.listOfFoodModel[i].foodPrice,
        'isVeg': widget.listOfFoodModel[i].isVeg,
      });
      fds.add({
        'foodId': widget.listOfFoodModel[i].foodId,
        'foodName': widget.listOfFoodModel[i].foodName,
        'foodPrice': widget.listOfFoodModel[i].foodPrice,
        'isVeg': widget.listOfFoodModel[i].isVeg,
      });
    }

    await FirebaseFirestore.instance
        .collection("admin")
        .doc("orders")
        .collection("details")
        .doc(response.paymentId)
        .set({
      'userId': currentUserUid,
      //'deliveryAddress': ,
      'paymentId': response.paymentId,
      'timeStamp': DateTime.now(),
      'DateDay': "$finalDateDay",
      'price': widget.totalAmount,
      'items': FieldValue.arrayUnion(foodDetails),
      'isDelivered': false,
      'totalItems': widget.totalItems,
      'address': '$myAddress',
    });

    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUserUid)
        .collection("orders")
        .doc(response.paymentId)
        .set({
      'foodDetails': FieldValue.arrayUnion(fds),
      'timeStamp': DateTime.now(),
      'DateDay': "$finalDateDay",
      'price': widget.totalAmount,
      'isDelivered': false,
      'totalItems': widget.totalItems,
      'address': '$myAddress',
    });
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUserUid)
        .collection('myBag')
        .get()
        .then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
    Route route = MaterialPageRoute(
        builder: (c) => NavBarPage(
              isLoggedIn: currentUser.loggedIn,
            ));
    Navigator.pushReplacement(context, route);
  }

  void handlerPaymentError() {
    print("errorrrr");
  }

  void handlerExternalWallet() {
    print("ew");
  }

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
                                onPressed: () {
                                  openCheckOut();
                                },
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
