import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/constant/flutterflowwidget.dart';
import 'package:food_delivery/constant/theme.dart';

CollectionReference dishesRef = FirebaseFirestore.instance.collection('Dish');

class Homescreen extends StatefulWidget {
  const Homescreen({
    Key? key,
    required this.textController,
  }) : super(key: key);

  final TextEditingController? textController;

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    getDishes();
    super.initState();
  }

  getDishes() {
    dishesRef.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc.data());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              greetingAndNotification(),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text(
                  'Find your desired dish',
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Color(0xFF9E9E9E),
                    fontSize: 25,
                  ),
                ),
              ),
              searchDish(),
              userLocation(),
              categoryofBreakfastAndDrink(context),
              categoryofSnackandMeal(context),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Text(
                  'Category',
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
          fastFood(),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              'Our Restaurant',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          restuarantDetailCard(),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              'Explore',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          exploreFood(context)
        ],
      ),
    );
  }

  Padding greetingAndNotification() {
    //final user = FirebaseAuth.instance.currentUser!;
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(1, 1, 0, 0),
            child: Text(
              'Hello name',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.primaryColor,
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
              child: IconButton(
                onPressed: () {
                  print('IconButton pressed ...');
                },
                icon: Icon(
                  Icons.notifications_none,
                  color: Colors.black,
                  size: 40,
                ),
                iconSize: 40,
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding searchDish() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: TextFormField(
        controller: widget.textController,
        obscureText: false,
        decoration: InputDecoration(
          hintText: 'Search for a dish name',
          hintStyle: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            color: Color(0xFF9E9E9E),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 5,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 5,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          contentPadding: EdgeInsets.fromLTRB(1, 0, 0, 0),
        ),
        style: FlutterFlowTheme.bodyText1.override(
          fontFamily: 'Poppins',
          color: Color(0xFF9E9E9E),
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }

  exploreFood(context) {
    bool isDishVeg = true;
    return ListView.builder(
      itemBuilder:(context,items) => Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 150,
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
            borderRadius: BorderRadius.circular(20),
            shape: BoxShape.rectangle,
          ),
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: Color(0xFFF5F5F5),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    'https://picsum.photos/seed/967/600',
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: 140,
                    fit: BoxFit.fill,
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
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    '[Dish Name]',
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                // SizedBox(width: x,),
                                isDishVeg
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10.0),
                                        child: Container(
                                          width: 20,
                                          height: 20,
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/Veg.jpg'),
                                            fit: BoxFit.scaleDown,
                                            color: null,
                                          ),
                                        ),
                                      )
                                    : Text('NonVeg'),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: Text(
                                '[Food Description]',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: Text(
                                '[Food Delivery Time] min',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    '₹[FoodPrice]',
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        bottomLeft: Radius.circular(5)),
                                    child: Container(
                                        color: Colors.grey,
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 25,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFFB90B),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 4.0, top: 2),
                                              height: 25,
                                              width: 35,
                                              color: Colors.grey,
                                              child: Text('Add'),
                                            )
                                          ],
                                        )),
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
        ),
      ),
    );
  }

  SingleChildScrollView restuarantDetailCard() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 1, 0),
            child: Container(
              width: 340,
              height: 130,
              decoration: BoxDecoration(
                color: Color(0xFFEEEEEE),
              ),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Color(0xFFFFB90B),
                elevation: 10,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 1, 0),
            child: Container(
              width: 340,
              height: 130,
              decoration: BoxDecoration(
                color: Color(0xFFEEEEEE),
              ),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Color(0xFFFFB90B),
                elevation: 10,
              ),
            ),
          )
        ],
      ),
    );
  }

  GridView fastFood() {
    return GridView(
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2.1 / 2.5,
      ),
      primary: false,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 80,
                height: 80,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  'https://picsum.photos/seed/264/600',
                  fit: BoxFit.scaleDown,
                ),
              ),
              Text(
                'Pizza',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  color: Color(0xCB000000),
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 80,
                height: 80,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  'https://picsum.photos/seed/264/600',
                  fit: BoxFit.scaleDown,
                ),
              ),
              Text(
                'Burger',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  color: Color(0xCB000000),
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 80,
                height: 80,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  'https://picsum.photos/seed/264/600',
                  fit: BoxFit.scaleDown,
                ),
              ),
              Text(
                'Pizza',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  color: Color(0xCB000000),
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 80,
                height: 80,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  'https://picsum.photos/seed/264/600',
                  fit: BoxFit.scaleDown,
                ),
              ),
              Text(
                'Pizza',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  color: Color(0xCB000000),
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 80,
                height: 80,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  'https://picsum.photos/seed/264/600',
                  fit: BoxFit.scaleDown,
                ),
              ),
              Text(
                'Pizza',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  color: Color(0xCB000000),
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 80,
                height: 80,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  'https://picsum.photos/seed/264/600',
                  fit: BoxFit.scaleDown,
                ),
              ),
              Text(
                'Pizza',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  color: Color(0xCB000000),
                  fontSize: 20,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Padding categoryofSnackandMeal(context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FFButtonWidget(
            onPressed: () {
              print('Button pressed ...');
            },
            text: 'Snack',
            options: FFButtonOptions(
              width: MediaQuery.of(context).size.width / 2.4,
              height: 60,
              color: Colors.white,
              textStyle: FlutterFlowTheme.title2.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              elevation: 4,
              borderSide: BorderSide(
                color: Color(0xFFB8B3B3),
                width: 1,
              ),
              borderRadius: 20,
            ),
          ),
          FFButtonWidget(
            onPressed: () {
              print('Button pressed ...');
            },
            text: 'Meal',
            options: FFButtonOptions(
              width: MediaQuery.of(context).size.width / 2.4,
              height: 60,
              color: Colors.white,
              textStyle: FlutterFlowTheme.title2.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              elevation: 4,
              borderSide: BorderSide(
                color: Color(0xFFB8B3B3),
                width: 1,
              ),
              borderRadius: 20,
            ),
          )
        ],
      ),
    );
  }

  Padding userLocation() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 1, 10, 0),
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
              'Home \n[Location]',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Poppins',
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding categoryofBreakfastAndDrink(context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FFButtonWidget(
            onPressed: () {
              print('Button pressed ...');
            },
            text: 'Breakfast',
            options: FFButtonOptions(
              width: MediaQuery.of(context).size.width / 2.4,
              height: 60,
              color: Colors.white,
              textStyle: FlutterFlowTheme.title2.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              elevation: 4,
              borderSide: BorderSide(
                color: Color(0xFFB8B3B3),
                width: 1,
              ),
              borderRadius: 20,
            ),
          ),
          FFButtonWidget(
            onPressed: () {
              print('Button pressed ...');
            },
            text: 'Drink',
            options: FFButtonOptions(
              width: MediaQuery.of(context).size.width / 2.4,
              height: 60,
              color: Colors.white,
              textStyle: FlutterFlowTheme.title2.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              elevation: 4,
              borderSide: BorderSide(
                color: Color(0xFFB8B3B3),
                width: 1,
              ),
              borderRadius: 20,
            ),
          )
        ],
      ),
    );
  }
}
