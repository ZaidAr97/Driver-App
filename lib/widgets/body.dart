import 'package:flutter/material.dart';
import 'package:my_app/widgets/bottom-bar.dart';
import 'package:my_app/widgets/float-button.dart';
import 'package:my_app/widgets/refersh-indicator.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
      // SingleChildScrollView(
      //   child:
    Column(
        children: <Widget>[
        // SizedBox(
        // height: size.height,
        //     child: Stack(
        //         children: <Widget>[
        //     Container(
        //     margin: EdgeInsets.only(top: size.height * 0.3),
        //     padding: EdgeInsets.only(
        //       top: size.height * 0.12,
        //       // left: kDefaultPaddin,
        //       // right: kDefaultPaddin,
        //     ),
        //     // height: 500,
        //     decoration: BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: BorderRadius.only(
        //         topLeft: Radius.circular(24),
        //         topRight: Radius.circular(24),
        //       ),
        //     ),
        //     child: Column(
        //         children: <Widget>[
        //           NavBar(),
                  // SizedBox(height:0 ),
                  // PickUp(),

                ],
            );
    //         ),
    //             ],
    //         ),
    //     )
    //     ],
    //     ),
    // );


  }
}



