import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_app/main.dart';
import 'package:my_app/widgets/cardlist.dart';

class NavBar extends StatefulWidget {
  NavBar({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  int bottomSelectedIndex = 1;

  PageController pageController = PageController(
    initialPage: 1,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        Records(),
        CardList(),
        MyWallet(),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index, duration: Duration(milliseconds: 1), curve: Curves.ease);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: buildPageView(),
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.indigo[700],
          backgroundColor: Colors.white,
          buttonBackgroundColor: Colors.indigo[700],
          height: 60,
          index: bottomSelectedIndex,//yallak improvement//
          onTap: (index) {
            bottomTapped(index);
            },
          items: <Widget>[
            Icon(Icons.history, size: 30,color: Colors.white,),
            Icon(Icons.shopping_cart_outlined, size: 30, color: Colors.white,),
            Icon(Icons.account_balance_wallet, size: 30,color: Colors.white,),
          ],
        ),
    );
  }
}




