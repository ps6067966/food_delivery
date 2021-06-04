import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:food_delivery/constant/theme.dart';
import 'package:food_delivery/pages/home_pages/bag/bag.dart';
import 'package:food_delivery/pages/home_pages/menu/menu.dart';

import 'home/home.dart';

class NavBarPage extends StatefulWidget {
  NavBarPage({Key key, this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'HomePage';
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<InnerDrawerState> _innerDrawerKey =
      GlobalKey<InnerDrawerState>();
  bool isMenuDrawerOpen = false;
  int tabNumber = 0;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    void change() => setState(() => _currentPage = 'HomePage');
    final tabs = {
      'HomePage': HomePage(),
      'BagPage': BagPage(onPressed: () => change(),),
      'MenuPage': tabNumber == 0 ? HomePage() : BagPage(onPressed: () => change(),),
    };

    return InnerDrawer(
      key: _innerDrawerKey,
      onTapClose: true,
      swipe: false,
      colorTransitionChild: Color(0xFF141D3E),
      colorTransitionScaffold: Colors.transparent,

      //When setting the vertical offset, be sure to use only top or bottom
      offset: IDOffset.only(bottom: 0.0, right: 0.5, left: 0.0),
      scale: IDOffset.horizontal(0.9), // set the offset in both directions
      proportionalChildArea: true, // default true
      borderRadius: 50, // default 0
      leftAnimationType: InnerDrawerAnimation.static,
      rightAnimationType: InnerDrawerAnimation.quadratic,
      backgroundDecoration: BoxDecoration(color: Color(0xFF141D3E)),

      //when a pointer that is in contact with the screen and moves to the right or left
      onDragUpdate: (double val, InnerDrawerDirection direction) {
        // return values between 1 and 0
        // print(val);
        // check if the swipe is to the right or to the left
        // print(direction==InnerDrawerDirection.start);
      },
      innerDrawerCallback: (a) => {
        setState(() {
          if (!a) {
            if (tabNumber == 1) {
              _currentPage = tabs.keys.toList()[1];
            } else {
              _currentPage = tabs.keys.toList()[0];
            }
          }
        })
      }, // return  true (open) or false (close)
      leftChild: Container(), // required if rightChild is not set
      rightChild: MenuPage(),
      scaffold: Scaffold(
        key: scaffoldKey,
        body: tabs[_currentPage],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 26,
              ),
              activeIcon: Icon(
                Icons.home,
                size: 26,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag_outlined,
                size: 26,
              ),
              activeIcon: Icon(
                Icons.shopping_bag,
                size: 26,
              ),
              label: 'Bag',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.menu_outlined,
                size: 26,
              ),
              activeIcon: Icon(
                Icons.menu,
                size: 26,
              ),
              label: 'Menu',
            )
          ],
          backgroundColor: Colors.white,
          elevation: 10,
          currentIndex: tabs.keys.toList().indexOf(_currentPage),
          selectedItemColor: CustomTheme.primaryColor,
          unselectedItemColor: CustomTheme.tertiaryColor,
          onTap: (i) => setState(() {
            if (i == 1 || i == 0) {
              tabNumber = i;
              print(tabNumber);
            }
            if (i == 2) {
              _innerDrawerKey.currentState
                  .toggle(direction: InnerDrawerDirection.end);
              return _currentPage = tabs.keys.toList()[i];
            }
            return _currentPage = tabs.keys.toList()[i];
          }),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
