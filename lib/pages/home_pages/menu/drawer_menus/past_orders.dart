import 'package:flutter/material.dart';
import 'package:food_delivery/constant/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/services/auth/auth_util.dart';
import 'package:food_delivery/widgets/ordercard.dart';
import 'package:food_delivery/widgets/loadingWidget.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class PastOrders extends StatelessWidget {
  const PastOrders({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String userUid = currentUserUid;
    return Scaffold(
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
          "Past orders",
          style: TextStyle(
            color: CustomTheme.primaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(userUid)
            .collection("orders")
            .snapshots(),
        builder: (c, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (c, index) {
                    return FutureBuilder<QuerySnapshot>(
                      future: FirebaseFirestore.instance
                          .collection("Dish")
                          .where("dishName",
                              whereIn: snapshot.data.docs[index].get("Dishes"))
                          .get(),
                      builder: (c, snap) {
                        return snap.hasData
                            ? orderCard(
                                itemCount: snap.data.docs.length,
                                data: snap.data.docs,
                                orderId: snapshot.data.docs[index].id,
                              )
                            : Center(
                                child: circularProgress(),
                              );
                      },
                    );
                  },
                )
              : Center(
                  child: circularProgress(),
                );
        },
      ),
    );
  }
}
