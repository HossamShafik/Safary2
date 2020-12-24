import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/Controllers/firestore/DataBase.dart';
import 'package:project/models/car.dart';
import 'package:project/models/hotel.dart';
import 'package:project/view/contactus_screen.dart';
import 'package:project/view/profile_screen.dart';
import 'package:project/view/settings_screen.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  Color deepPurple = Colors.deepPurpleAccent;
  Color pink = Colors.pink[600];
  Color blue = Colors.indigo;
  Color black = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width*0.65,
      color: blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          head(),
          Divider(color: Colors.white,height: 30,thickness: 1.5,),
          body(),

        ],
      ),
    );
  }

  Widget head() {
    return Padding(
      padding: const EdgeInsets.only(left: 20,top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            child: Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.transparent,
                image: DecorationImage(
                  image: AssetImage('assets/images/pro.jpg'),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text('Android 10',style: TextStyle(color: Colors.white,fontSize: 22,),),
          ),
          Text('Android10@gmail.com',style: TextStyle(color: Colors.grey[300],fontSize: 12),),
        ],
      ),
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: Icon(
              FontAwesomeIcons.home,
              color: Colors.white,
            ),
            title: Text('Home',style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProfileScreen();
              }));
            },
            leading: Icon(
              FontAwesomeIcons.solidUserCircle,
              color: Colors.white,
            ),
            title: Text('My Account',style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),),
          ),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SettingScreen();
              }));
            },
            leading: Icon(
              FontAwesomeIcons.cog,
              color: Colors.grey[700],
            ),
            title: Text('Settings',style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ContactUsScreen();
              }));
            },
            leading: Icon(
              Icons.help,
              color: Colors.grey[700],
            ),
            title: Text('Contact us',style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.logout,
              color: Colors.grey[700],
            ),
            title: Text('Logout',style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),),
          ),
        ],
      ),
    );
  }

}