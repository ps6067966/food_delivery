/*
import 'package:food_delivery/constant/theme.dart';
import 'package:food_delivery/pages/get_started_2.dart';
import 'package:food_delivery/pages/get_started_3.dart';
import 'package:flutter/material.dart';

class GetStart1Widget extends StatefulWidget {
  GetStart1Widget({Key key}) : super(key: key);

  @override
  _GetStart1WidgetState createState() => _GetStart1WidgetState();
}

class _GetStart1WidgetState extends State<GetStart1Widget> {
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
                'assets/images/undraw_healthy_options_sdo3.png',
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.32,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 15),
                child: Text(
                  'Explore from variety of  Items',
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
                        color: Color(0xFFFFBA0E),
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
                        color: Color(0xFFBDBDBD),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(),
                      child: Text(
                        "Skip",
                        style: FlutterFlowTheme.subtitle1.override(
                            fontFamily: 'Poppins',
                            color: const Color(0xffffb90b),
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      ),
                      onPressed: () async {
                        await Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GetStart3Widget(),
                          ),
                          (r) => false,
                        );
                      },
                    ),
                    TextButton.icon(
                      icon: Text(
                        "Next",
                        style: FlutterFlowTheme.subtitle1.override(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      ),
                      label: Icon(
                        Icons.chevron_right,
                        color: Colors.black,
                      ),
                      onPressed: () async {
                        await Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GetStart2Widget(),
                          ),
                          (r) => false,
                        );
                      },
                    ),
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