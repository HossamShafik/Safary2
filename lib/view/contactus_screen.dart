import 'package:flutter/material.dart';

class ContactUsScreen extends StatefulWidget {
  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  Color primaryColor = Color(0xFF3C116B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: primaryColor,),onPressed: (){
          Navigator.pop(context);
        },),
        centerTitle: true,
        title: Text('Contact Us',style: TextStyle(color: primaryColor,)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}