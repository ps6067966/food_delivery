import 'package:flutter/material.dart';
import 'package:food_delivery/constant/theme.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_pages/login.dart';

class IntroScreen extends StatefulWidget {

  IntroScreen({Key key}) : super(key: key);

  @override
  IntroScreenState createState() => new IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = [];


  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        widgetDescription: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 15),
              child: Text(
                'Explore from variety'
                    '\n of Items',
                textAlign: TextAlign.center,
                style: CustomTheme.title1.override(
                  fontFamily: 'Poppins',
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: Text(
                'Lorem Ipsum is simply dummy text of the printing and '
                    'typesetting industry. Lorem Ipsum has been the '
                    'industry\'s standard dummy text .',
                textAlign: TextAlign.center,
                style: CustomTheme.subtitle2.override(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
        styleDescription: TextStyle(color: Colors.black),
        styleTitle: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        description:
        'Lorem Ipsum is simply dummy text of the printing and typesetting '
            'industry. Lorem Ipsum has been the industry\'s '
            'standard dummy text .',
        pathImage: "assets/images/undraw_healthy_options_sdo3.png",
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      new Slide(
        widgetDescription: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 15),
              child: Text(
                'Track location of\n Delivery',
                textAlign: TextAlign.center,
                style: CustomTheme.title1.override(
                  fontFamily: 'Poppins',
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: Text(
                'Lorem Ipsum is simply dummy text of the printing and '
                    'typesetting industry. Lorem Ipsum has been the '
                    'industry\'s standard dummy text .',
                textAlign: TextAlign.center,
                style: CustomTheme.subtitle2.override(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
        styleDescription: TextStyle(color: Colors.black),
        styleTitle: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        description:
        'Lorem Ipsum is simply dummy text of the printing and typesetting '
            'industry. Lorem Ipsum has been the industry\'s standard '
            'dummy text .',
        pathImage: "assets/images/undraw_My_location_re_r52x.png",
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      new Slide(
        widgetDescription: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 15),
              child: Text(
                'Fast Guaranteed\nDelivery',
                textAlign: TextAlign.center,
                style: CustomTheme.title1.override(
                  fontFamily: 'Poppins',
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: Text(
                'Lorem Ipsum is simply dummy text of the printing and '
                    'typesetting industry. Lorem Ipsum has been the '
                    'industry\'s standard dummy text .',
                textAlign: TextAlign.center,
                style: CustomTheme.subtitle2.override(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
        styleDescription: TextStyle(color: Colors.black),
        styleTitle: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        description:
        'Lorem Ipsum is simply dummy text of the printing and typesetting '
            'industry. Lorem Ipsum has been the industry\'s '
            'standard dummy text .',
        pathImage: "assets/images/undraw_On_the_way_re_swjt.png",
        backgroundColor: Colors.white,
      ),
    );
  }

  void onDonePress() async {
    var prefs = await SharedPreferences.getInstance();
    var boolKey = 'isFirstTime';
    prefs.setBool(boolKey, false);
    await Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
          (r) => false,
    );
  }

  Widget renderNextBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Next",
          style: CustomTheme.subtitle1.override(
              fontFamily: 'Poppins',
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.normal),
        ),
        Icon(
          Icons.chevron_right,
          color: Colors.black,
        )
      ],
    );
  }

  Widget renderDoneBtn() {
    return Text(
      "Login",
      style: CustomTheme.subtitle1.override(
          fontFamily: 'Poppins',
          color: const Color(0xffffb90b),
          fontSize: 20,
          fontWeight: FontWeight.normal),
    );
  }

  Widget renderSkipBtn() {
    return Text(
      "Skip",
      style: CustomTheme.subtitle1.override(
          fontFamily: 'Poppins',
          color: const Color(0xffffb90b),
          fontSize: 20,
          fontWeight: FontWeight.normal),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: new IntroSlider(
        // Skip button
        renderSkipBtn: this.renderSkipBtn(),

        // Next button
        renderNextBtn: this.renderNextBtn(),

        // Done button
        renderDoneBtn: this.renderDoneBtn(),
        // colorDoneBtn: const Color(0xffffb90b),
        borderRadiusDoneBtn: 30,
        // highlightColorDoneBtn: const Color(0xffffb90b),

        // Dot indicator
        colorActiveDot: const Color(0xffffb90b),
        colorDot: Colors.grey,
        sizeDot: 12.0,

        scrollPhysics: BouncingScrollPhysics(),

        slides: this.slides,
        onDonePress: this.onDonePress,
      ),
    );
  }
}