import 'package:flutter/material.dart';
import 'package:food_delivery/constant/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/services/auth/auth_util.dart';
import 'package:food_delivery/widgets/ordercard.dart';
import 'package:food_delivery/widgets/loadingWidget.dart';

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
      body: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("users")
              .doc(userUid)
              .collection("orders")
              .orderBy("timeStamp", descending: true)
              .snapshots(),
          builder: (c, snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (c, index) {
                      return Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: OrderCard(
                          itemCount:
                              snapshot.data.docs[index].get('totalItems'),
                          data: snapshot.data.docs[index],
                          orderId: snapshot.data.docs[index].id,
                        ),
                      );
                    },
                  )
                : Center(
                    child: circularProgress(),
                  );
          },
        ),
      ),
    );
  }
}
