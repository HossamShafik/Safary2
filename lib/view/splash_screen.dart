import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:project/view/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = "splash_screen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    Timer(
      Duration(seconds: 4),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OnBoardingScreen(),
        ),
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Image(
            image: AssetImage("assets/images/air.jpg"),
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
                children: [
                  Transform.translate(
                    offset: Offset(0, 30),
                    child: Center(
                      child: Image.asset(
                        "assets/images/splashlogo1.png",
                        fit: BoxFit.fill,
                        width: 220,
                        height: 120,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 90),
                    child: Divider(
                      color: Colors.white,
                      height: 1.5,
                      thickness: 2,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Hotels . Tours . Cars",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Transform.translate(
                      offset: Offset(0, 180),
                      child: SpinKitRing(
                        color: Colors.white,
                        size: 45,
                        lineWidth: 5,
                      ),
                    ),
                  ),
                ],
              ),

          ),
      ],
    );
  }

}
