import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/routes.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  late SharedPreferences loginDataPref;

  @override
  void initState() {
    initSharedPref();
    super.initState();
  }

  void initSharedPref() async {
    loginDataPref = await SharedPreferences.getInstance();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://pbs.twimg.com/profile_images/981407217550274561/Ty8FTeK1_400x400.jpg";
    return Drawer(
      // child: Container(
      //   color: Colors.deepPurple,
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple),
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text(loginDataPref.getString('UserName')!),
                accountEmail: Text(loginDataPref.getString('Password')!),
                // currentAccountPicture: Image.network(imageUrl),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              )),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.homeRoute);
            },
            leading: Icon(CupertinoIcons.home, color: Colors.black),
            title: Text("Home",
                textScaleFactor: 1.2, style: TextStyle(color: Colors.black)),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.gridRoute);
            },
            leading: Icon(CupertinoIcons.square_grid_2x2, color: Colors.black),
            title: Text("Grid Example",
                textScaleFactor: 1.2, style: TextStyle(color: Colors.black)),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.homeRoute);
            },
            leading: Icon(CupertinoIcons.square_favorites, color: Colors.black),
            title: Text("List Example",
                textScaleFactor: 1.2, style: TextStyle(color: Colors.black)),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.googleMapRoute);
            },
            leading: Icon(CupertinoIcons.map, color: Colors.black),
            title: Text("Google Map Example",
                textScaleFactor: 1.2, style: TextStyle(color: Colors.black)),
          ),
          ListTile(
            onTap: () {
              loginDataPref.remove('UserName');
              loginDataPref.remove('Password');
              loginDataPref.remove('login');

              Navigator.popAndPushNamed(context, MyRoutes.loginRoute);
            },
            leading: Icon(Icons.logout, color: Colors.black),
            title: Text("LogOut",
                textScaleFactor: 1.2, style: TextStyle(color: Colors.black)),
          )
        ],
      ),
      // ),
    );
  }
}
