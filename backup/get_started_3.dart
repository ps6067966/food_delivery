/*
import 'package:food_delivery/constant/theme.dart';
import 'package:food_delivery/pages/login.dart';
import 'package:flutter/material.dart';

class GetStart3Widget extends StatefulWidget {
  GetStart3Widget({Key key}) : super(key: key);

  @override
  _GetStart3WidgetState createState() => _GetStart3WidgetState();
}

class _GetStart3WidgetState extends State<GetStart3Widget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Align(
          alignment: Alignment(0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Spacer(),
              Image.asset(
                'assets/images/undraw_On_the_way_re_swjt.png',
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.25,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 15),
                child: Text(
                  'Fast Guaranteed\nDelivery',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.title1.override(
                    fontFamily: 'Poppins',
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                child: Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text .',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.subtitle2.override(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Container(
                width: 100,
                height: 30,
                decoration: BoxDecoration(
                  color: Color(0x00EEEEEE),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 30,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Color(0xFFBDBDBD),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Color(0xFFBDBDBD),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFBA0E),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xffffb90b),
                      ),
                      child: Text(
                        "Get Started",
                        style: FlutterFlowTheme.subtitle1.override(
                            fontFamily: 'Poppins',
                            color:  Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      ),
                      onPressed: () async {
                        await Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DashboardWidget(),
                          ),
                              (r) => false,
                        );
                      },
                    ),
                    // FFButtonWidget(
                    //   onPressed: () async {
                    //     await Navigator.pushAndRemoveUntil(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => DashboardWidget(),
                    //       ),
                    //           (r) => false,
                    //     );
                    //   },
                    //   text: 'Get Started',
                    //   options: FFButtonOptions(
                    //     width: 250,
                    //     height: 50,
                    //     color: Color(0xFFFFBA0E),
                    //     textStyle: FlutterFlowTheme.subtitle2.override(
                    //       fontFamily: 'Poppins',
                    //       color: Colors.white,
                    //     ),
                    //     borderSide: BorderSide(
                    //       color: Colors.transparent,
                    //       width: 1,
                    //     ),
                    //     borderRadius: 12,
                    //   ),
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
*/