import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/constant/theme.dart';
import 'package:food_delivery/services/auth/auth_util.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double imgheight = 225;
    final double pfpsize = 150;

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: imgheight + pfpsize/2,
            width: width,
            child: Stack(
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: 'https://images.unsplash.com/photo-1505935428862-770b6f24f629?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGZvb2QlMjBwbGF0ZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
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
                  )
                ),
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
          Text(
            currentUserDisplayName,
            style: CustomTheme.title1.override(
              fontFamily: 'Poppins',
              fontSize: 20
            )
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            width: width/1.2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Divider(color: Colors.blueGrey[200]),
                ListTile(
                  visualDensity: VisualDensity.comfortable,
                  title: Text(
                    'Contact Details',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 20
                    ),
                  ),
                  subtitle: Text(
                    currentUserEmail + '\n(+91)1234567890',
                    style: CustomTheme.subtitle2.override(
                      fontFamily: 'Poppins',
                      fontSize: 12
                    ),
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
                    'Address',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 20
                    ),
                  ),
                  subtitle: Text(
                    'DIPNI DEPARTMENT, DTC Colony, Pitam Pura, Delhi, 110034',
                    style: CustomTheme.subtitle2.override(
                      fontFamily: 'Poppins',
                      fontSize: 12
                    ),
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
                      fontSize: 20
                    ),
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
                      fontSize: 20
                    ),
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
          )
        ],
      ),
    );
  }
}
