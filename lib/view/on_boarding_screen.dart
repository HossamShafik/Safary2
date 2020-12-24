import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:project/view/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String id = "onBoarding_screen";

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  //(0xFF7B51D3)

  _checkSeen() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    if (pref.containsKey("seen")) {
      bool _seen = (pref.getBool('seen') ?? false);

      if (_seen == null || _seen == false) {
        Navigator.of(context).pushReplacementNamed(OnBoardingScreen.id);
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    }
  }

  @override
  void initState() {
    _checkSeen();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          PageView(
            physics: ClampingScrollPhysics(),
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              Stack(
                children: [
                  Image(
                    image: AssetImage(
                      'assets/images/walk1.gif',
                    ),
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
                  Center(
                    child: Transform.translate(
                      offset: Offset(0,-100),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Text("Discover The World",style: TextStyle(color: Colors.white,fontSize: 34,fontWeight: FontWeight.bold),),
                          SizedBox(
                            height: 10,
                          ),
                          Text("With the best Places",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Image(
                    image: AssetImage(
                      'assets/images/walk2.gif',
                    ),
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
                  Center(
                    child: Transform.translate(
                      offset: Offset(0,-100),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Text("Fly With Safari Cars",style: TextStyle(color: Colors.white,fontSize: 34,fontWeight: FontWeight.bold),),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Drive With Beautiful Cars",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Image(
                    image: AssetImage(
                      'assets/images/walk3.gif',
                    ),
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
                  Center(
                    child: Transform.translate(
                      offset: Offset(0,-100),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Text("Travel In Comfort Hotels",style: TextStyle(color: Colors.white,fontSize: 32,fontWeight: FontWeight.bold),),
                          SizedBox(
                            height: 10,
                          ),
                          Text("With the best Offers From Safari",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Transform.translate(
            offset: Offset(0, 40),
            child: Container(
              alignment: Alignment.topRight,
              child: FlatButton(
                onPressed: () {
                  updateSeen();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return LoginScreen();
                  }));
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0, 180),
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(),
              ),
            ),
          ),
          _currentPage != _numPages - 1
              ? Align(
                  alignment: Alignment.bottomRight,
                  child: FlatButton(
                    onPressed: () {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    child: Transform.translate(
                      offset: Offset(0,-10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Next',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 32.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Text(''),


          _currentPage == _numPages - 1
              ? Transform.translate(
            offset: Offset(0,-70),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 300,
                height: 50,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  color: Colors.white,
                  child: Text(
                    'Start',
                    style: TextStyle(
                      color: Color(0xFF5B16D0),
                      fontSize: 30,
                      letterSpacing: 1,
                    ),
                  ),
                  splashColor: Color(0xFF5B16D0),
                  onPressed: () {
                    updateSeen();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return LoginScreen();
                        }));
                  },
                ),
              ),
            ),
          )
              : Text(''),


        ],
      ),
    );
  }

  void updateSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("seen", true);
  }
}
