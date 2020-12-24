import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  Color primaryColor = Color(0xFF3C116B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: primaryColor,),onPressed: (){
          Navigator.pop(context);
        },),
        centerTitle: true,
        title: Text('Settings',style: TextStyle(color: primaryColor,)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}