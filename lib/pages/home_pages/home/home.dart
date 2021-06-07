import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/constant/theme.dart';
import 'package:food_delivery/pages/home_pages/home/category_items.dart';
import 'package:food_delivery/pages/home_pages/home/food_type.dart';
import 'package:food_delivery/pages/home_pages/home/home_heading.dart';
import 'package:food_delivery/services/auth/auth_util.dart';
import 'package:food_delivery/widgets/custom_text_field.dart';

import 'foods.dart';

final CollectionReference dishesRef =
    FirebaseFirestore.instance.collection('Dish');

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
    this.textController,
  }) : super(key: key);

  final TextEditingController textController;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchTextController;
  String name;
  List<dynamic> dishes = [];

  @override
  void initState() {
    getDishes();
    super.initState();
    searchTextController = TextEditingController();
  }

  getDishes() async {
    final QuerySnapshot dishesSnapshot = await dishesRef.get();
    setState(() {
      dishes = dishesSnapshot.docs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              greetingAndNotification(),
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
                        onAddPressed: () {
                        },
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
      ),
    );
  }
  Padding greetingAndNotification() {
    final user = currentUserDisplayName;
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Row(
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
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              size: 35,
            ),
          ),
        ],
      ),
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

  Padding userLocation() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 1, 20, 0),
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
            child: Text(
              'Home \nIndia',
              style: CustomTheme.bodyText1.override(
                fontFamily: 'Poppins',
                fontSize: 16,
              ),
            ),
          )
        ],
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
