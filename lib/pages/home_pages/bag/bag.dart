import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/constant/theme.dart';
import 'package:food_delivery/models/food_model.dart';
import 'package:food_delivery/pages/home_pages/bag/bag_items.dart';
import 'package:food_delivery/pages/home_pages/bag/checkout.dart';
import 'package:food_delivery/services/backend/api_path.dart';
import 'package:food_delivery/widgets/custom_button.dart';
import 'package:shimmer/shimmer.dart';
import 'empty_bag.dart';

class BagPage extends StatefulWidget {
  const BagPage({Key key, @required this.onPressed, this.isLoggedIn = false})
      : super(key: key);

  final VoidCallback onPressed;
  final bool isLoggedIn;

  @override
  _BagPageState createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {
  List<FoodModel> listOfFoodModel;

  @override
  void initState() {
    super.initState();
    listOfFoodModel = [];
  }

  Future<void> onDelete(BuildContext context, String path) async {
    final didRequestSignOut = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm"),
          content: const Text("Are you sure you want to delete this from bag"),
          actions: <Widget>[
            TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text(
                  "Delete",
                  style: TextStyle(color: Colors.redAccent),
                )),
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
    if (didRequestSignOut == true) {
      final reference = FirebaseFirestore.instance.doc(path);
      // print('delete: $path');
      await reference.delete();
      setState(() {});
    }
  }

  Future<void> onQuantityChanged(
      BuildContext context, String path, num quantity) async {
    final didRequestSignOut = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MyDialog(
          quantity: quantity,path: path,
        );
      },
    );
    if (didRequestSignOut == true) {
      setState(() {});
    }
  }

  Widget orderView(BuildContext context, int totalItems, int totalPrice) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 8, 8),
          child: Text(
            "Total items : $totalItems",
            style: CustomTheme.bodyText1.override(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 10, 8, 16),
          child: Text(
            "Total Amount : ??? $totalPrice",
            style: CustomTheme.bodyText1.override(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        CustomButton(
            text: "Order Now",
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Checkout(
                            totalItems: totalItems,
                            listOfFoodModel: listOfFoodModel,
                            totalAmount: totalPrice,
                          )));
            }),
      ],
    );
  }

  Widget listOfBagItems(
      BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot, User user) {
    int totalPrice = 0;
    listOfFoodModel.clear();
    return ListView.builder(
        itemCount: snapshot.data.docs.length,
        itemBuilder: (context, index) {
          DocumentReference ref =
              snapshot.data.docs.elementAt(index).data()['dishRef'];
          String myBagItemId = snapshot.data.docs.elementAt(index).id;
          return StreamBuilder(
              stream: FirebaseFirestore.instance.doc(ref?.path).snapshots(),
              builder:
                  (BuildContext context, AsyncSnapshot<DocumentSnapshot> snap) {
                if (snap.hasError) return Center(child: Text("No data"));
                if (snap.hasData) {
                  final children = snap.data.data();
                  var f = FoodModel.fromJson(children);
                  //print(children);
                  listOfFoodModel.add(f);
                  num dishPrice = f.foodPrice;
                  num quantity =
                      snapshot.data.docs.elementAt(index).data()['quantity'] ??
                          0;
                  totalPrice =
                      totalPrice + (dishPrice.toInt() * quantity.toInt());
                  return Column(
                    children: [
                      BagItems(
                        foodUrl: f.foodUrl,
                        dishName: f.foodName,
                        foodDescription: f.foodIngredients,
                        foodDeliveryTime: f.foodDeliveryTime,
                        foodPrice: f.foodPrice,
                        isDishVeg: f.isVeg,
                        onQuantityChanged: () => onQuantityChanged(
                            context,
                            APIPath.myBagItemId(user.uid, myBagItemId),
                            snapshot.data.docs
                                    .elementAt(index)
                                    .data()['quantity'] ??
                                0),
                        onDeletePressed: () => onDelete(context,
                            APIPath.myBagItemId(user.uid, myBagItemId)),
                        quantity: snapshot.data.docs
                                .elementAt(index)
                                .data()['quantity'] ??
                            0,
                      ),
                      if (index == snapshot.data.docs.length - 1)
                        orderView(
                            context, snapshot.data.docs.length, totalPrice)
                    ],
                  );
                }
                return Center(
                  child: Shimmer.fromColors(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 180,
                      child: Card(),
                    ),
                    baseColor: Colors.grey[200],
                    highlightColor: Colors.grey[350],
                  ),
                );
              });
        });
  }

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: Colors.white,
      body: user?.uid != null
          ? StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection(APIPath.myBag(user.uid))
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) return Text('Something went wrong');
                if (snapshot.connectionState == ConnectionState.waiting)
                  return Text("Loading");
                if (snapshot.data.docs.length == 0)
                  return EmptyBag(onPressed: widget.onPressed);
                if (snapshot.hasData) {
                  return Center(
                    child: Scaffold(
                      appBar: AppBar(
                        automaticallyImplyLeading: false,
                        backgroundColor: Colors.white,
                        elevation: 10.0,
                        title: Text(
                          "My Bag",
                          style: TextStyle(color: CustomTheme.primaryColor),
                        ),
                        centerTitle: true,
                      ),
                      backgroundColor: Colors.white,
                      body: Container(
                        child: listOfBagItems(context, snapshot, user),
                      ),
                    ),
                  );
                }
                return EmptyBag(onPressed: widget.onPressed);
              })
          : EmptyBag(onPressed: widget.onPressed),
    );
  }
}

class MyDialog extends StatefulWidget {
  const MyDialog({Key key, this.quantity = 0, this.path}) : super(key: key);

  final num quantity;
  final String path;

  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  num q;

  @override
  void initState() {
    super.initState();
    q = widget.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Change Quantity"),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            icon: Icon(
              Icons.add_box,
              color: CustomTheme.primaryColor,
              size: 30,
            ),
            onPressed: () {
              // q=quantity;
              setState(() {
                q += 1;
              });
            },
          ),
          Container(
            width: 60,
            height: 60,
            child: Center(
              child: Text(
                "${q.toInt()}",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: CustomTheme.primaryColor),
          ),
          IconButton(
            icon: Icon(
              Icons.indeterminate_check_box,
              color: CustomTheme.primaryColor,
              size: 30,
            ),
            onPressed: () {
              setState(() {
                if (q != 1) q -= 1;
              });
            },
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              FirebaseFirestore.instance
                  .doc(widget.path)
                  .get()
                  .then((DocumentSnapshot snapshot) async {
                Map<String, dynamic> data = {"quantity": q};
                snapshot.reference.update(data);
              });
              Navigator.of(context).pop(true);
            },
            child: const Text(
              "Change",
              style: TextStyle(color: Colors.redAccent),
            )),
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text("Cancel"),
        ),
      ],
    );
  }
}
