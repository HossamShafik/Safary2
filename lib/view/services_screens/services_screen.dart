import 'package:flutter/material.dart';
import 'package:project/view/profile_screen.dart';
import 'package:project/view/services_screens/cars_service.dart';
import 'package:project/view/services_screens/hotels_service.dart';
import 'package:project/view/services_screens/tours_service.dart';

class ServicesScreen extends StatefulWidget {
  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen>
    with SingleTickerProviderStateMixin {
  Color deepPurple = Colors.deepPurpleAccent;
  Color pink = Colors.pink[600];
  Color blue = Colors.indigo;
  Color black = Colors.black;
  Color grey = Colors.grey[900];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Search',
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.grey[50],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: blue),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProfileScreen();
              }));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10, top: 6),
              child: CircleAvatar(
                radius: 26,
                backgroundColor: blue,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 23,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/pro.jpg'),
                    radius: 21.5,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.10,
            width: MediaQuery.of(context).size.width,
            child: TabBar(
              indicatorPadding:
                  EdgeInsets.symmetric(horizontal: 50, vertical: 12),
              controller: _tabController,
              labelColor: blue,
              indicatorColor: blue,
              labelStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelColor: Colors.grey[600],
              tabs: [
                Text("Hotels"),
                Text("Tours"),
                Text("Cars"),
              ],
            ),
          ),
          Flexible(
            child: TabBarView(
              controller: _tabController,
              children: [
                HotelsService(),
                ToursService(),
                CarsService(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
