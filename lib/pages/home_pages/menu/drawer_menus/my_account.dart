import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/constant/theme.dart';
import 'package:food_delivery/pages/home_pages/menu/drawer_menus/contact_details.dart';
import 'package:food_delivery/services/auth/auth_util.dart';
import 'address_details.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key key}) : super(key: key);

  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  String phoneNumber;
  String address;
  @override
  void initState() {
    super.initState();
    DocumentReference ref =
        FirebaseFirestore.instance.collection('users').doc(currentUserUid);
    ref.snapshots().first.then((DocumentSnapshot snapshot) {
      var data = snapshot.data();
      setState(() {
        phoneNumber = data["phoneNum"] ?? "not added";
        address = data["Address"] ?? "not added";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double imgheight = 225;
    final double pfpsize = 150;

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: imgheight + pfpsize / 2,
            width: width,
            child: Stack(
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl:
                      'https://images.unsplash.com/photo-1505935428862-770b6f24f629?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGZvb2QlMjBwbGF0ZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                  width: width,
                  height: imgheight,
                  fit: BoxFit.fill,
                ),
                Positioned(
                    top: 30,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 30,
                        color: Colors.white,
                      ),
                      onPressed: () => {Navigator.pop(context)},
                    )),
                Positioned(
                  bottom: 0,
                  left: width / 2 - 75,
                  child: Container(
                    height: pfpsize,
                    width: pfpsize,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomTheme.primaryColor,
                        image: DecorationImage(
                          image: NetworkImage(
                            currentUserPhoto,
                          ),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(
                          width: 8,
                          color: Colors.white,
                        )),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(currentUserDisplayName,
              style: CustomTheme.title1
                  .override(fontFamily: 'Poppins', fontSize: 20)),
          SizedBox(
            height: 25,
          ),
          Expanded(
            child: Container(
              width: width / 1.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Divider(color: Colors.blueGrey[200]),
                  ListTile(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ContactDetails())),
                    visualDensity: VisualDensity.comfortable,
                    title: Text(
                      'Contact Details',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                    subtitle: Text(
                      currentUserEmail + '\n(+91)$phoneNumber',
                      style: CustomTheme.subtitle2
                          .override(fontFamily: 'Poppins', fontSize: 12),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                  Divider(color: Colors.blueGrey[200]),
                  ListTile(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => AddressDetails())),
                    visualDensity: VisualDensity.comfortable,
                    title: Text(
                      'Address',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                    subtitle: Text(
                      '$address',
                      style: CustomTheme.subtitle2
                          .override(fontFamily: 'Poppins', fontSize: 12),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                  Divider(color: Colors.blueGrey[200]),
                  ListTile(
                    visualDensity: VisualDensity.comfortable,
                    title: Text(
                      'Payments and Refunds',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                  Divider(color: Colors.blueGrey[200]),
                  ListTile(
                    visualDensity: VisualDensity.comfortable,
                    title: Text(
                      'Reviews and Photos',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                  Divider(color: Colors.blueGrey[200]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
