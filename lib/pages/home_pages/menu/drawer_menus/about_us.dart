import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/constant/theme.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          "About us",
          style: TextStyle(
            color: CustomTheme.primaryColor,
          ),
        ),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
              child: Container(
          margin: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                    'Aa Haa Inn Restaurant'.toUpperCase(),
                    style: CustomTheme.title2,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: 'https://images.unsplash.com/photo-1552566626-52f8b828add9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: CustomTheme.tertiaryColor,
                    height: 1.3
                  )
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'ADDRESS',
                  style: CustomTheme.title2,
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Shyamji Krishna Varma Marg, Kapil Vihar, Pitampura, Delhi, 110034',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: CustomTheme.tertiaryColor,
                    height: 1.3
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Contact us'.toUpperCase(),
                  style: CustomTheme.title2,
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '(+91)-1234567890\ninfo@mail.com',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: CustomTheme.tertiaryColor,
                    height: 1.7
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width*0.4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.star_outline_rounded,
                            color: Colors.white,
                            size: 28,
                          ),
                          Text(
                            ' Reviews'.toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppin',
                              fontSize: 16
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: CustomTheme.primaryColor,
                        borderRadius: BorderRadius.circular(8)
                      ),
                    ),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width*0.4,
                      child: Center(
                        child: Text(
                          'Photos'.toUpperCase(),
                          style: TextStyle(
                            color: CustomTheme.secondaryColor,
                            // color: Colors.white,
                            fontFamily: 'Poppin',
                            fontSize: 16
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: CustomTheme.primaryColor,
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://images.unsplash.com/photo-1517870662726-c1d98ee36250?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjM2fHxmb29kJTIwcGxhdGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                          ),
                          fit: BoxFit.cover
                        ),
                        borderRadius: BorderRadius.circular(8)
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
