import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/pages/auth_pages/login.dart';
import 'package:food_delivery/pages/home_pages/menu/drawer_menus/about_us.dart';
import 'package:food_delivery/pages/home_pages/menu/drawer_menus/help_and_feedback.dart';
import 'package:food_delivery/pages/home_pages/menu/drawer_menus/my_account.dart';
import 'package:food_delivery/pages/home_pages/menu/drawer_menus/offers.dart';
import 'package:food_delivery/pages/home_pages/menu/drawer_menus/past_orders.dart';
import 'package:food_delivery/services/auth/auth_util.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String email = currentUserEmail;
    String name = currentUserDisplayName;
    String photo = currentUserPhoto;
    return Scaffold(
        backgroundColor: Color(0xFF141D3E),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0,10,10,10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0,0.0,10.0,30.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 35,
                            backgroundImage:
                            NetworkImage(photo),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        SizedBox(width: 5.0,),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "$name",
                              style: TextStyle(fontSize: 20.0,color: Colors.white),
                            ),
                            Text(
                              "$email",
                              style: TextStyle(fontSize: 14.0,color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(
                      primary: Colors.white
                  ),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => MyAccount()));
                  },
                  icon: Icon(Icons.account_circle_outlined),
                  label: Text("My Account"),
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(
                      primary: Colors.white
                  ),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => PastOrders()));
                  },
                  icon: Icon(Icons.shopping_bag_outlined),
                  label: Text("Past Orders"),
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(
                      primary: Colors.white
                  ),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Offers()));
                  },
                  icon: Icon(Icons.verified_outlined),
                  label: Text("Offers & Discounts"),
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(
                      primary: Colors.white
                  ),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => AboutUs()));
                  },
                  icon: Icon(Icons.info_outline),
                  label: Text("About Us"),
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(
                      primary: Colors.white
                  ),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => HelpAndFeedBack()));
                  },
                  icon: Icon(Icons.headset_mic_outlined),
                  label: Text("Help & Feedback"),
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(
                    primary: Colors.white
                  ),
                  onPressed: () async {
                    await signOut();
                    await Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                      (r) => false,
                    );
                  },
                  icon: Icon(Icons.logout),
                  label: Text("Log out"),
                ),
              ],
            ),
          ),
        ));
  }
}
