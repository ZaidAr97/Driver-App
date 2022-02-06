import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_app/widgets/login.dart';
import 'package:my_app/widgets/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:my_app/widgets/bottom-bar.dart';
import 'package:my_app/widgets/nav-drawer.dart';
import 'package:settings_ui/settings_ui.dart';

void main()  => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter login UI',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      // routes: routes,
      home:Splash(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, onNext}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;
  @override

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  @override
  Widget build(BuildContext context) {

    final emailField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),

    );
    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.indigo[700],
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new SecondScreen()),
          );
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 300.0,
        // titleSpacing: 171,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo[700],
        title: Text('Login',
          // textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 45.0,color: Colors.white,
              fontFamily: 'Lobster'
          ),
        ),
      ),
      backgroundColor: Colors.white,
// resizeToAvoidBottomInset: false,
      body: Center(
        child : Container(
          color: Colors.white,
          child: SingleChildScrollView(
          child: Row(
            children:  [
              Expanded(

                child: Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      // SizedBox(height: 200.0,
                      //   child: Image.asset( "assets/logo3.jpg",
                      //     fit: BoxFit.contain,
                      //   ),
                      //
                      //   // child: CircleAvatar(
                      //   //   backgroundImage: AssetImage("assets/logo3.jpg",),
                      //     // radius: 100.0,
                      //   ),
                      // SizedBox(height: 230.0),
                      // SizedBox(height: 40.0,
                      //   child: Text('Login to your Account',
                      //       style: TextStyle(fontWeight: FontWeight.w500,  fontSize: 22.0,
                      //
                      //       )
                      //   ),
                      // ),

                      emailField,
                      SizedBox(height: 25.0),
                      passwordField,
                      SizedBox(height: 7.0),
                      SizedBox(height: 25.0,
                        child: Text('Forget password?',
                            style: TextStyle(fontWeight: FontWeight.w300,  fontSize: 18.0,

                            )
                        ),
                      ),
                      SizedBox(height: 15.0),
                      loginButton,
                      // SizedBox(height: 15.0),
                    ],
                  ),
                ),
              ),
            ]),
      ),
    )
      )
    );
  }
}

class SecondScreen extends StatefulWidget {

  @override
  _SecondScreenState createState() => _SecondScreenState();

}

class _SecondScreenState extends State<SecondScreen> {

     final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
     //
     // SharedPreferences sharedPreferences;
     //
     // @override
     // void initState() {
     //   super.initState();
     //   checkLoginStatus();
     // }
     //
     // checkLoginStatus() async {
     //   sharedPreferences = await SharedPreferences.getInstance();
     //   if(sharedPreferences.getString("token") == null) {
     //     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => MyHomePage()), (Route<dynamic> route) => false);
     //   }
     // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: NavDrawer(),
      //       body:Stack(
      //         children: <Widget>[
      //           NavBar(),
      //           NavDrawer(),
      //
      //
      //
      //         ], ),
      body: NavBar(),


    );
  }
}

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        backgroundColor: Colors.indigo[700],
        title: Text('Settings',
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 20.0,color: Colors.white,
        ),
        ),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
        //     title: 'Section',
        //     titleTextStyle: TextStyle(
        //       fontSize: 20.0,
        //     ),
            tiles: [
              SettingsTile(
                title: 'Language',
                subtitle: 'English',
                leading: Icon(Icons.language),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile(
                title: 'Notifications and Sounds',
                subtitle: '',
                leading: Icon(Icons.notifications_none_outlined),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile(
                title: 'Security',
                subtitle: '',
                leading: Icon(Icons.security_outlined),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile(
                title: 'Privacy',
                subtitle: '',
                leading: Icon(Icons.privacy_tip_outlined),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile(
                title: 'App Version',
                subtitle: '',
                leading: Icon(Icons.apps),
                onPressed: (BuildContext context) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// class Profile extends StatefulWidget {
//   @override
//   _ProfileState createState() => _ProfileState();
// }
//
// class _ProfileState extends State<Profile> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//         bottom: Radius.circular(15),
//     )),
//         backgroundColor: Colors.indigo[700],
//         title: Text('Profile',
//           textAlign: TextAlign.left,
//           style: TextStyle(
//             fontSize: 20.0,color: Colors.white,
//           ),
//         ),
//       ),
//       body: SettingsList(
//         sections: [
//           SettingsSection(
//             //     title: 'Section',
//             //     titleTextStyle: TextStyle(
//             //       fontSize: 20.0,
//             //     ),
//             tiles: [
//               SettingsTile(
//                 title: 'Name',
//                 subtitle: 'Username',
//                 leading: Icon(Icons.drive_file_rename_outline),
//                 onPressed: (BuildContext context) {},
//               ),
//               SettingsTile(
//                 title: 'Profile Pic',
//                 subtitle: 'User Pic',
//                 leading: Icon(Icons.image),
//                 onPressed: (BuildContext context) {},
//               ),
//               SettingsTile(
//                 title: 'Status',
//                 subtitle: 'Online',
//                 leading: Icon(Icons.track_changes),
//                 onPressed: (BuildContext context) {},
//               ),
//               SettingsTile(
//                 title: 'Number',
//                 subtitle: '0945678910',
//                 leading: Icon(Icons.phone_android),
//                 onPressed: (BuildContext context) {},
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            )),
        backgroundColor: Colors.indigo[700],
        title: Text('About',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20.0,color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            )),
        backgroundColor: Colors.indigo[700],
        title: Text('Feedback',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20.0,color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class Records extends StatefulWidget {

  // final Function onNext;
  //
  // Records({this.onNext});

  @override
  _RecordsState createState() => _RecordsState();
}

class _RecordsState extends State<Records> {


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
            // actions:<Widget>[
            //
            //
            //     // => _scaffoldKey.currentState.openEndDrawer(),
            //
            // ],
            centerTitle: true,
            title: Text('History',
              style: TextStyle(fontSize: 22.0),
            ),
          )),

      body: ListView(
        children: [
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
                  title: const Text('Balbk inventory',
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


                    Padding(padding: EdgeInsets.fromLTRB(166, 15, 4, 15),
                      child: Icon(
                        Icons.cloud_done, color: Colors.green, size: 31,),),
                    Padding(padding: EdgeInsets.fromLTRB(0, 21, 0, 15),
                        child: Text('Delivered',
                          style: TextStyle(fontWeight: FontWeight.w500,
                              fontSize: 18),)),

                  ],
                ),
                // Image.asset('assets/car2.jpg'),
              ],
            ),
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


                    Padding(padding: EdgeInsets.fromLTRB(166, 15, 4, 15),
                      child: Icon(
                        Icons.cloud_done, color: Colors.green, size: 31,),),
                    Padding(padding: EdgeInsets.fromLTRB(0, 21, 0, 15),
                        child: Text('Delivered',
                          style: TextStyle(fontWeight: FontWeight.w500,
                              fontSize: 18),)),

                  ],
                ),
                // Image.asset('assets/car2.jpg'),
              ],
            ),
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


                    Padding(padding: EdgeInsets.fromLTRB(166, 15, 4, 15),
                      child: Icon(
                        Icons.cloud_done, color: Colors.green, size: 31,),),
                    Padding(padding: EdgeInsets.fromLTRB(0, 21, 0, 15),
                        child: Text('Delivered',
                          style: TextStyle(fontWeight: FontWeight.w500,
                              fontSize: 18),)),

                  ],
                ),
                // Image.asset('assets/car2.jpg'),
              ],
            ),
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

        ],
      ),
    );
  }
}

class MyWallet extends StatefulWidget {
  @override
  _MyWalletState createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
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
            // actions:<Widget>[
            //
            //
            //     // => _scaffoldKey.currentState.openEndDrawer(),
            //
            // ],
            centerTitle: true,
            title: Text('Earnings',
              style: TextStyle(fontSize: 22.0),
            ),
          )),

      body: ListView(
        children: [
          Container(width: 120,
              child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(0),
                  ),
                  side: BorderSide(
                    color: Colors.indigo,
                    width: 0,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Icon(Icons.date_range_outlined,
                        color: Colors.amber,
                        size: 50,
                      ),
                      title: const Text('Date Of Work ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.fromLTRB(83, 0, 0, 15),
                          child: Text('From:',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 12),
                          child: Text('01 jan 2021 | 00:00 PM'),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.fromLTRB(83, 0, 0, 10),
                          child: Text('To:',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(44, 0, 0, 7),
                          child: Text('31 jan 2021 | 00:00 PM'),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          Divider(
            height: 0,
            indent: 4,
            endIndent: 4,
            thickness: 6,
            color: Colors.amber,
          ),
          SizedBox(height: 20),
          Card(
            clipBehavior: Clip.antiAlias,
            elevation: 10,
            shape: Border(right: BorderSide(color: Colors.amber, width: 5),
                left: BorderSide(color: Colors.amber, width: 5)
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(20, 10, 0, 20),
                        child: Icon(Icons.attach_money_outlined, size: 80,
                          color: Colors.indigo,),),
                      Padding(padding: EdgeInsets.fromLTRB(15, 0, 0, 0),),
                      SizedBox(width: 159, height: 70,
                        child: ListTile(
                            title: const Text('Total Earnings ',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),),

                            subtitle: Text('10 Orders')

                        ),
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child:Icon(Icons.attach_money_rounded,)
                      ),
                      SizedBox(width: 85, height: 75,
                        child: ListTile(
                            title: const Text('10.60 ',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),),

                            // subtitle: Text('250 KM')

                        ),
                      ),
                    ]),
              ],),
          ),
          SizedBox(height: 5,),
          Card(
            clipBehavior: Clip.antiAlias,
            elevation: 10,
            shape: Border(right: BorderSide(color: Colors.amber, width: 5),
                left: BorderSide(color: Colors.amber, width: 5)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(24, 10, 0, 20),
                        child: Icon(Icons.check_circle_rounded, size: 70,
                          color: Colors.indigo,),),
                      Padding(padding: EdgeInsets.fromLTRB(22, 0, 0, 0),),
                      SizedBox(width: 159, height: 70,
                        child: ListTile(
                            title: const Text('Deliverd ',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),),

                            subtitle: Text('9 Orders')

                        ),
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child:Icon(Icons.attach_money_rounded,)
                      ),
                      SizedBox(width: 85, height: 75,
                        child: ListTile(
                            title: const Text('8.60 ',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),),

                            // subtitle: Text('240 KM')

                        ),
                      ),
                    ]),
              ],),
          ),
          SizedBox(height: 5,),
          Card(
            clipBehavior: Clip.antiAlias,
            elevation: 10,
            shape: Border(right: BorderSide(color: Colors.amber, width: 5),
                left: BorderSide(color: Colors.amber, width: 5)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(20, 10, 0, 20),
                        child: Icon(Icons.fast_forward_outlined, size: 80,
                          color: Colors.indigo,),),
                      Padding(padding: EdgeInsets.fromLTRB(15, 0, 0, 0),),
                      SizedBox(width: 159, height: 70,
                        child: ListTile(
                            title: const Text('Processing ',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),),

                            subtitle: Text('1 Orders')

                        ),
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child:Icon(Icons.attach_money_rounded,)
                      ),
                      SizedBox(width: 85, height: 75,
                        child: ListTile(
                            title: const Text('2.60 ',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),),

                            // subtitle: Text('20 KM')

                        ),
                      ),
                    ]),
              ],),
          ),
          SizedBox(height: 25,),
          Divider(
            height: 0,
            indent:30,
            endIndent: 30,
            thickness: 1,
            color: Colors.black,
          ),
          SizedBox(height: 17,),
          Card(
            color: Colors.amber[500],
            clipBehavior: Clip.antiAlias,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(
                color: Colors.indigo,
                width: 0,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 25),
                        child: Icon(Icons.auto_awesome, size: 70,
                          color: Colors.indigo,),),
                      Padding(padding: EdgeInsets.fromLTRB(19, 0, 0, 0),),
                      SizedBox(width: 185, height: 77,
                        child: ListTile(
                            title: const Text('Total Cash Today ',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),),

                            // subtitle: Text('01 jan 2021 | Friday')

                        ),
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child:Icon(Icons.attach_money_rounded,)
                      ),
                      SizedBox(width:95, height: 70,
                        child: ListTile(
                            title: const Text('100',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),),

                            subtitle: Text('9 Orders')

                        ),
                      ),
                    ]),
              ],),
          ),
        ],
      ),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      // loadingText: Text('Welcome',
      //   style: TextStyle(fontSize: 22.0,),
      // ),
      // useLoader: false,
      seconds: 5,
      navigateAfterSeconds: new MyHomePage(),
      title: new Text('Welcome',
        style: TextStyle(
            fontSize: 30.0, fontFamily: 'Lobster', color: Colors.indigo[700]),
      ),
      image: new Image.asset("assets/logo3.jpg"),
      backgroundColor: Colors.white,
      // imageBackground: ,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 110.0,
      onClick: () => print("Ready"),
      // loaderColor: Colors.indigo[700],
    );
  }
}
















