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
                Image.network(
                  'https://images.unsplash.com/photo-1505935428862-770b6f24f629?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGZvb2QlMjBwbGF0ZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                  width: width,
                  height: imgheight,
                  fit: BoxFit.fill,
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
            height: 15,
          ),
          Text(
            currentUserDisplayName,
            style: CustomTheme.title1.override(
              fontFamily: 'Poppins',
              fontSize: 20
            )
          ),
        ],
      ),
    );
  }
}
