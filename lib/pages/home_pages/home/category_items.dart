import 'package:flutter/material.dart';
import 'package:food_delivery/constant/theme.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key key, @required this.url, @required this.itemName})
      : super(key: key);

  final String url;
  final String itemName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 80,
            height: 80,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.network(
              url,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            itemName,
            style: CustomTheme.bodyText1.override(
              fontFamily: 'Poppins',
              color: Color(0xCB000000),
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }
}
