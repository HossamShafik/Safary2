import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/Controllers/firestore/DataBase.dart';
import 'package:project/view/hotel_stream_screen.dart';
import 'package:project/view/profile_screen.dart';
import 'package:project/view/search_screen.dart';
import 'package:project/view/tour_stream_screen.dart';
import 'car_stream_screen.dart';
import 'chatList_screen.dart';
import 'favorites_screen.dart';
import 'notifications_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  List<Map> categories = [
    {'name': 'Hotels', 'icon': FontAwesomeIcons.hotel},
    {'name': 'Tours', 'icon': FontAwesomeIcons.snowboarding},
    {'name': 'Cars', 'icon': Icons.directions_car_outlined}
  ];

  Color deepPurple = Colors.deepPurpleAccent;
  Color pink = Colors.pink[600];
  Color blue = Colors.indigo;
  Color black = Colors.black;
  Color grey = Colors.grey[900];

  Color textColor = Colors.grey[900];
  Color iconColor = Colors.deepPurpleAccent;
  Color backgroundColor = Colors.white;

  int _page = 0;

  //check page is diplay
  int checkIndex = 1;
  String name = 'Android';

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  final DataBase _store = DataBase();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedContainer(
          height: MediaQuery.of(context).size.height,
          transform: Matrix4.translationValues(xOffset, yOffset, 0)
            ..scale(scaleFactor),
          duration: Duration(milliseconds: 250),
          decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(isDrawerOpen ? 20 : 0.0)),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        isDrawerOpen
                            ? IconButton(
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  size: 35,
                                  color: blue,
                                ),
                                onPressed: () {
                                  setState(() {
                                    xOffset = 0;
                                    yOffset = 0;
                                    scaleFactor = 1;
                                    isDrawerOpen = false;
                                  });
                                },
                              )
                            : IconButton(
                                icon: Icon(
                                  Icons.menu,
                                  size: 25,
                                  color: blue,
                                ),
                                onPressed: () {
                                  setState(() {
                                    xOffset = 230;
                                    yOffset = 120;
                                    scaleFactor = 0.7;
                                    isDrawerOpen = true;
                                  });
                                }),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ProfileScreen();
                            }));
                          },
                          child: CircleAvatar(
                            radius: 27,
                            backgroundColor: blue,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 25,
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/pro.jpg'),
                                radius: 23,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                      right: 12,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Head(),
                        Body(),
                        swipeScreen(checkIndex),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }

  Widget Head() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, $name' + '!',
                style: TextStyle(
                  letterSpacing: 1.1,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.grey[900],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Find Your Service',
                style: TextStyle(
                  fontSize: 25,
                  letterSpacing: 1.1,
                  fontWeight: FontWeight.w500,
                  color: pink,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget Body() {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return SearchScreen();
              }));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text('Search',style: TextStyle(color: Colors.grey[500],),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 7),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey[50],
                      child: Icon(Icons.search,color: blue,),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Text(
              'Categories',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
          ),
          Container(
            height: 110,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 15, right: 28),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        checkIndex = index + 1;
                      });
                    },
                    child: Container(
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: backgroundColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            categories[index]['icon'],
                            color: iconColor,
                            size: index==0?30:35,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              categories[index]['name'],
                              style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Most Popular',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'See All',
                    style: TextStyle(color: deepPurple),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget swipeScreen(int index) {
    if (index == 1) {
      return HotelStream();
    } else if (index == 2) {
      return TourStream();
    } else if (index == 3) {
      return CarStream();
    }
  }
}
