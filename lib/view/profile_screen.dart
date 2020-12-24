import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Color primaryColor = Color(0xFF3C116B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: primaryColor,),onPressed: (){
          Navigator.pop(context);
        },),
        centerTitle: true,
        title: Text('Profile',style: TextStyle(color: primaryColor,),),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
