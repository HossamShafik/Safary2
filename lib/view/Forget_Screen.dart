import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project/Controllers/authentication/auth.dart';
import 'package:project/view/login_screen.dart';

class ForgetScreen extends StatefulWidget {
  @override
  _ForgetScreenState createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final Authentication authentication=Authentication();
  Color primaryColor =Color(0xFF3C116B);

  var _formKey = GlobalKey<FormState>();
  OutlineInputBorder borderE = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.deepPurple[100],
      width: 2,
    ),

    borderRadius: BorderRadius.circular(50),

  );

  OutlineInputBorder borderF = OutlineInputBorder(
    borderSide: BorderSide(
      width: 2,
      color: Color(0xFF3C116B),
    ),

    borderRadius: BorderRadius.circular(50),

  );

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(fontFamily: 'SFDisplay'),
      child: Stack(
        children: [
          _background(context),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform.translate(
                    offset: Offset(0,20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17),
                            ),
                            elevation: 8,
                            child: Image(
                              image: AssetImage("assets/images/icon_app1.png"),
                              fit: BoxFit.cover,
                              width: 80,
                              height: 80,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 35, top: 10),
                          child: Text(
                            "Enjoy With \nSafari",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                      ),
                      child: _form(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _background(BuildContext context) {
    return  CachedNetworkImage(
      fit: BoxFit.cover,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.40,
      imageUrl: "https://images.pexels.com/photos/3727255/pexels-photo-3727255.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }

  Widget _form(BuildContext context) {
    return ListView(
      children: [
        Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text(
              " Forget Password ",
              style: TextStyle(
                  fontSize: 32,
                  color: primaryColor,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )),
        Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _emailController,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    labelText: "Username",
                    labelStyle:  TextStyle(inherit: true,color: Colors.black),
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Color(0xFF3C116B),
                    ),

                    fillColor: Colors.white,
                    border: borderE,
                    focusedBorder: borderF,
                    disabledBorder: borderE,
                    enabledBorder: borderE,
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Email Address is required';
                    } else if(!RegExp("^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*").hasMatch(value)){
                      return 'Enter a valid email address';
                    }
                    else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 40,
                ),


                Container(
                  width: double.infinity,
                  height: 55,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: RaisedButton(
                    color: Color(0xFF3C116B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        letterSpacing: 1.1,
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        try {
                          authentication
                              .forgetPassword(_emailController.text.trim(),)
                              .then((_) => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen())));
                        } catch (e) {
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Invalid Username"),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      " I have An Account !",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade400,
                          fontWeight: FontWeight.bold),
                    ),
                    FlatButton(
                      minWidth: 0,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF3C116B),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,

                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10,),

              ],
            ),
          ),
        ),
      ],
    );
  }

}
