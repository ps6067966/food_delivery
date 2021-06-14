import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/constant/theme.dart';
import 'package:food_delivery/pages/home_pages/home/category_items.dart';
import 'package:food_delivery/pages/home_pages/home/food_type.dart';
import 'package:food_delivery/pages/home_pages/home/home_heading.dart';
import 'package:food_delivery/pages/home_pages/home/notifications.dart';
import 'package:food_delivery/services/auth/auth_util.dart';
import 'package:food_delivery/widgets/custom_text_field.dart';
import 'package:geocoder/geocoder.dart';
import 'package:location/location.dart';

import 'foods.dart';

final CollectionReference dishesRef =
    FirebaseFirestore.instance.collection('Dish');

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
    this.textController, this.isLoggedIn=false,
  }) : super(key: key);

  final TextEditingController textController;
  final bool isLoggedIn;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchTextController;
  String name;
  List<dynamic> dishes = [];
  ScrollController _scrollViewController;
  bool _showAppbar = true;
  bool isScrollingDown = false;
  String myAddress="";

  @override
  void initState() {
    getDishes();
    super.initState();
    getUserLocation();
    searchTextController = TextEditingController();
    _scrollViewController = new ScrollController();
    _scrollViewController.addListener(() {
      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          setState(() {});
        }
      }

      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          setState(() {});
        }
      }
    });
  }

  getDishes() async {
    final QuerySnapshot dishesSnapshot = await dishesRef.get();
    setState(() {
      dishes = dishesSnapshot.docs;
    });
  }

  getUserLocation() async {
    LocationData myLocation;
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
    print(' ${first.locality}, ${first.adminArea},${first.subLocality},'
        ' ${first.subAdminArea},${first.addressLine}, ${first.featureName},'
        '${first.thoroughfare}, ${first.subThoroughfare}');
    setState(() {
      myAddress="${first.addressLine},";
    });
    return first;
  }

  @override
  void dispose() {
    // _scrollViewController.dispose();
    _scrollViewController.removeListener(() {});
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size(MediaQuery.of(context).size.width, _showAppbar ? 56.0 : 0.0),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: greetingAndNotification(),
            elevation: 0.0,
            actions: [
              IconButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Notifications())),
                icon: Icon(
                  Icons.notifications_outlined,
                  size: 30,
                  color: CustomTheme.tertiaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: _scrollViewController,
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(
                'Find your desired dish',
                style: CustomTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  color: Color(0xFF9E9E9E),
                  fontSize: 25,
                ),
              ),
            ),
            searchDish(),
            userLocation(),
            foodTypes(context),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: HomeHeading(headText: "Category"),
            ),
            fastFood(),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 10, 0),
              child: HomeHeading(headText: "Our Restaurant"),
            ),
            restaurantsDetailCard(),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 10, 0),
              child: HomeHeading(headText: "Explore"),
            ),
            StreamBuilder(
              stream: dishesRef.snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                } else {
                  final children = snapshot.data.docs.map<Widget>((doc) {
                    return Food(
                      foodUrl: doc['dishPhotoUrl'],
                      dishName: doc['dishName'],
                      foodDescription: doc['dishIngredients'],
                      foodDeliveryTime: doc['deliveryTime'],
                      foodPrice: doc['dishPrice'],
                      isDishVeg: doc['isVeg'],
                      onAddPressed: () {},
                    );
                  }).toList();
                  return ListBody(
                    children: children,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget greetingAndNotification() {
    final user = currentUserDisplayName;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Padding(
            padding: EdgeInsets.fromLTRB(1, 1, 0, 0),
            child: Text(
              'Hello $user',
              style: CustomTheme.bodyText1.override(
                fontFamily: 'Poppins',
                color: CustomTheme.primaryColor,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Padding searchDish() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: CustomTextFormField(
        iconData: Icons.search_outlined,
        iconColor: CustomTheme.primaryColor,
        hintText: 'Name',
        textController: searchTextController,
        onChanged: (value) => name = value,
        validator: (val) => val.isEmpty ? "Name can't be Empty" : null,
      ),
    );
  }

  Widget userLocation() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 1, 20, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Icon(
                Icons.location_on_outlined,
                color: Colors.black,
                size: 30,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 1, 0, 0),
              child: Text.rich(
                new TextSpan(
                  text: 'Home \n',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      letterSpacing: 0,
                  ),
                  children: <TextSpan>[
                    new TextSpan(
                      text: '$myAddress',
                      style: new TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12.0,
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.start,
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding foodTypes(context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FoodType(foodName: "Snack"),
              FoodType(foodName: "Meal"),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FoodType(foodName: "Breakfast"),
              FoodType(foodName: "Drink"),
            ],
          )
        ],
      ),
    );
  }

  fastFood() {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 2.1 / 2.5,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        CategoryItem(
            url:
                'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=414&q=80',
            itemName: "Pizza"),
        CategoryItem(
            url:
                'https://images.unsplash.com/photo-1571091718767-18b5b1457add?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=752&q=80',
            itemName: "Burger"),
        CategoryItem(
            url:
                'https://images.unsplash.com/photo-1528735602780-2552fd46c7af?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=753&q=80',
            itemName: "Sandwich"),
        CategoryItem(
            url:
                'https://images.unsplash.com/photo-1601390395693-364c0e22031a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=889&q=80',
            itemName: "Bevarege"),
        CategoryItem(
            url:
                'https://images.unsplash.com/photo-1600470944938-b301e41001c8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=334&q=80',
            itemName: "Chinese"),
        CategoryItem(
            url:
                'https://images.unsplash.com/photo-1601409751311-cbecfe223af4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
            itemName: "Dessert"),
      ],
    );
  }

  SingleChildScrollView restaurantsDetailCard() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: 130,
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Color(0xFFFFB90B),
                elevation: 4,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: 130,
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Color(0xFFFFB90B),
                elevation: 4,
              ),
            ),
          )
        ],
      ),
    );
  }
}
