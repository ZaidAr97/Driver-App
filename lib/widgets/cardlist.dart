import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/widgets/details-order.dart';
import 'nav-drawer.dart';



class CardList extends StatefulWidget {


  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: new NavDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0), // here the desired height
        child: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15),
              )),
          leading: IconButton(
            icon: Icon(Icons.menu,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () => _scaffoldKey.currentState.openDrawer(),
          ),
          backgroundColor: Colors.indigo[700],
          elevation: 0,
          centerTitle: true,
          title: Text('Dashboard',
            style: TextStyle(fontSize: 22.0),
          ),
        ),
      ),

      body: ListView(
        children: [
          GestureDetector(
              onTap: () =>
                  Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new Details(),),
                  ),

              child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Icon(Icons.star,
                        color: Colors.amber,
                        size: 35,
                      ),
                      title: const Text('Balbk inventory ',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'May 15 2021 | 15:20 PM',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    Divider(
                      height: 3,
                      indent: 20,
                      endIndent: 20,
                      thickness: 1,
                      color: Colors.black,
                    ),
                    ListTile(
                      leading: Icon(Icons.location_on_outlined,
                        color: Colors.purple,
                        size: 31,
                      ),
                      title: const Text('Pickup ',
                        style: TextStyle(color: Colors.black),
                      ),
                      subtitle: Text(
                        '161, Al Olaya Rd, Damascus, Syria',
                        style: TextStyle(color: Colors.black.withOpacity(0.4)),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.emoji_flags,
                        color: Colors.purple,
                        size: 31,
                      ),
                      title: const Text('Deliver ',
                        style: TextStyle(color: Colors.black),
                      ),
                      subtitle: Text(
                        '161, Al Olaya Rd, Damascus, Syria',
                        style: TextStyle(color: Colors.black.withOpacity(0.4)),
                      ),
                    ),
                    Divider(
                      height: 3,
                      indent: 20,
                      endIndent: 20,
                      thickness: 1,
                      color: Colors.black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.fromLTRB(15, 19, 0, 5),
                          child: Icon(Icons.attach_money, size: 28,
                              color: Colors.purple[700]
                          ),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Text('12.50',
                            style: TextStyle(color: Colors.purple[700],
                                fontSize: 20),
                          ),
                        ),


                        // Padding(padding: EdgeInsets.fromLTRB(166, 15, 4, 15),
                        //   child: Icon(
                        //     Icons.cloud_done, color: Colors.green, size: 31,),),
                        Padding(padding: EdgeInsets.fromLTRB(200, 21, 0, 15),
                            child: Text('Items: 2',
                              style: TextStyle(fontWeight: FontWeight.w500,
                                  fontSize: 18),)),

                      ],
                    ),
                    // Image.asset('assets/car2.jpg'),
                  ],
                ),
              )
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.fromLTRB(19, 5, 0, 20),
                  child: Text('Order No. #10106',
                    style: TextStyle(color: Colors.black38, fontSize: 15),
                  ),
                ),
              ]),
          GestureDetector(
              onTap: () =>
                  Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new Details(),),
                  ),

              child:
              Card(
                clipBehavior: Clip.antiAlias,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  // side: BorderSide(
                  //   color: Colors.indigo,
                  //   width: 3,
                  // ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Icon(Icons.star,
                        color: Colors.amber,
                        size: 35,
                      ),
                      title: const Text('Inventory Name ',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Date & Time',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    Divider(
                      height: 3,
                      indent: 20,
                      endIndent: 20,
                      thickness: 1,
                      color: Colors.black,
                    ),
                    ListTile(
                      leading: Icon(Icons.location_on_outlined,
                        color: Colors.purple,
                        size: 31,
                      ),
                      title: const Text('Pickup ',
                        style: TextStyle(color: Colors.black),
                      ),
                      subtitle: Text(
                        'Address',
                        style: TextStyle(color: Colors.black.withOpacity(0.4)),
                      ),
                    ),
                    // VerticalDivider(
                    //   width: 3,
                    //   indent: 0,
                    //   endIndent: 0,
                    //   thickness:1 ,
                    //   color: Colors.black,
                    // ),
                    ListTile(
                      leading: Icon(Icons.emoji_flags,
                        color: Colors.purple,
                        size: 31,
                      ),
                      title: const Text('Deliver ',
                        style: TextStyle(color: Colors.black),
                      ),
                      subtitle: Text(
                        'Address',
                        style: TextStyle(color: Colors.black.withOpacity(0.4)),
                      ),
                    ),
                    Divider(
                      height: 3,
                      indent: 20,
                      endIndent: 20,
                      thickness: 1,
                      color: Colors.black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.fromLTRB(15, 19, 0, 5),
                          child: Icon(Icons.attach_money, size: 28,
                              color: Colors.purple[700]
                          ),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Text('##.##',
                            style: TextStyle(color: Colors.purple[700],
                                fontSize: 20),
                          ),
                        ),


                        // Padding(padding: EdgeInsets.fromLTRB(166, 15, 4, 15),
                        //   child: Icon(
                        //     Icons.directions_walk_outlined,
                        //     color: Colors.orange, size: 31,),),
                        Padding(padding: EdgeInsets.fromLTRB(200, 21, 0, 15),
                            child: Text('Items: 4',
                              style: TextStyle(fontWeight: FontWeight.w500,
                                  fontSize: 18),)),

                      ],
                    ),
                    // Image.asset('assets/car2.jpg'),
                  ],
                ),
              )
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.fromLTRB(19, 5, 0, 20),
                  child: Text('Order No. #####',
                    style: TextStyle(color: Colors.black38, fontSize: 15),
                  ),
                ),
              ]),
          GestureDetector(
              onTap: () =>
                  Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new Details(),),
                  ),

              child:
              Card(
                clipBehavior: Clip.antiAlias,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Icon(Icons.star,
                        color: Colors.amber,
                        size: 35,
                      ),
                      title: const Text('Inventory Name ',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Date & Time',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    Divider(
                      height: 3,
                      indent: 20,
                      endIndent: 20,
                      thickness: 1,
                      color: Colors.black,
                    ),
                    ListTile(
                      leading: Icon(Icons.location_on_outlined,
                        color: Colors.purple,
                        size: 31,
                      ),
                      title: const Text('Pickup ',
                        style: TextStyle(color: Colors.black),
                      ),
                      subtitle: Text(
                        'Address',
                        style: TextStyle(color: Colors.black.withOpacity(0.4)),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.emoji_flags,
                        color: Colors.purple,
                        size: 31,
                      ),
                      title: const Text('Deliver ',
                        style: TextStyle(color: Colors.black),
                      ),
                      subtitle: Text(
                        'Address',
                        style: TextStyle(color: Colors.black.withOpacity(0.4)),
                      ),
                    ),
                    Divider(
                      height: 3,
                      indent: 20,
                      endIndent: 20,
                      thickness: 1,
                      color: Colors.black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.fromLTRB(15, 19, 0, 5),
                          child: Icon(Icons.attach_money, size: 28,
                              color: Colors.purple[700]
                          ),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Text('##.##',
                            style: TextStyle(color: Colors.purple[700],
                                fontSize: 20),
                          ),
                        ),


                        // Padding(padding: EdgeInsets.fromLTRB(166, 15, 4, 15),
                        //   child: Icon(
                        //     Icons.directions_bike, color: Colors.red,
                        //     size: 31,),),
                        Padding(padding: EdgeInsets.fromLTRB(200, 21, 0, 15),
                            child: Text('Items: 1',
                              style: TextStyle(fontWeight: FontWeight.w500,
                                  fontSize: 18),)),

                      ],
                    ),
                    // Image.asset('assets/car2.jpg'),
                  ],
                ),
              )
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.fromLTRB(19, 5, 0, 20),
                    child: Text('Order No. #####',
                      style: TextStyle(color: Colors.black38, fontSize: 15),
                    )
                )
              ]
          ),
          // Container(width: 10,height: 10,
          //     child: RefreshIndicator(
          //       onRefresh: () {
          //         return Future.delayed(
          //             Duration(seconds: 1),
          //                 () {
          //               ScaffoldMessenger.of(context).showSnackBar(
          //                 SnackBar(
          //                   content: const Text('Page Refreshed'),
          //                   action: SnackBarAction(
          //                     label: 'OK', onPressed: () {},
          //                   ),
          //                 ),
          //               );
          //             });
          //       },
          //       child: SecondScreen(),
          //
          //     )),
        ],
      ),
    );
  }
}