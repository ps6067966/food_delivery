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
      body: Container(
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
                child: Image.network(
                  'https://images.unsplash.com/photo-1552566626-52f8b828add9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80',
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
              Row(
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 200,
                    child: Text(
                      'Reviews'
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
