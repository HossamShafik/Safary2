import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      width: MediaQuery.of(context).size.width * 0.65,
      padding: EdgeInsets.only(top: 50, bottom: 45, left: 15),
      color: blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child: Container(
                  height: 46,
                  width: 46,
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
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Android 10',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Android10@gmail.com',
                      style: TextStyle(color: Colors.grey[400], fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Favorites',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Notification',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.solidPaperPlane,
                      color: Colors.white,
                      size: 21,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Chat List',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.solidUserCircle,
                      color: Colors.white,
                      size: 22,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Icon(
                      Icons.help,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Contact Us',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.settings,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Settings',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 2,
                height: 20,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Log out',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget head() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [],
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
            title: Text(
              'Home',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
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
            title: Text(
              'My Account',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
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
            title: Text(
              'Settings',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
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
            title: Text(
              'Contact us',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.logout,
              color: Colors.grey[700],
            ),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
