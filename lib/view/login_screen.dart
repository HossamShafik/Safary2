import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:project/Controllers/authentication/auth.dart';
import 'package:project/models/prograss_model_hud.dart';
import 'package:project/view/Forget_Screen.dart';
import 'package:project/view/home_screen.dart';
import 'package:project/view/register.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'animated_drawer_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  bool keepMeLoggedIn = false;
  Color primaryColor = Color(0xFF3C116B);
  bool _obscureText = false;

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

  final Authentication authentication = Authentication();



  @override
  void initState() {
    _checkLoggedIn();
    super.initState();
  }

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
            body: ModalProgressHUD(

              inAsyncCall: Provider.of<prograssHud>(context).isLoading,

              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Transform.translate(
                      offset: Offset(0, 20),
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
                      height: 45,
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
          ),
        ],
      ),
    );
  }

  Widget _background(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.40,
      imageUrl:
          "https://images.pexels.com/photos/3727255/pexels-photo-3727255.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }

  Widget _form(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            " Login ",
            style: TextStyle(
                fontSize: 32, color: primaryColor, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    labelText: "Username",
                    labelStyle: TextStyle(inherit: true, color: Colors.black),
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Color(0xFF3C116B),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: borderE,
                    focusedBorder: borderF,
                    border: borderE
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Email Address is required';
                    } else if (!RegExp(
                            "^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*")
                        .hasMatch(value)) {
                      return 'Enter a valid email address';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: _passwordController,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  obscureText: !_obscureText,
                  decoration: InputDecoration(
                    prefixStyle: TextStyle(
                      color: Color(0xFFEAF5F7),
                    ),
                    labelText: "Password",
                    labelStyle: TextStyle(inherit: true, color: Colors.black),
                    prefixIcon: Icon(
                      Icons.lock_outlined,
                      color: Color(0xFF3C116B),
                    ),
                    suffixIcon: IconButton(
                      color: Color(0xFF3C116B),
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: borderE,
                    focusedBorder: borderF,
                    border: borderE
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Password is required';
                    } else if (value.length < 6) {
                      return 'Password is Weak';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: InkWell(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        " Forget Password ?  ",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgetScreen()));
                    },
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                        activeColor: Color(0xFF3C116B),
                        value: keepMeLoggedIn,
                        onChanged: (value) {
                          setState(() {
                            keepMeLoggedIn = value;
                          });
                        }),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Remember Me",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Builder(
                  builder: (context) => Container(
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
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          letterSpacing: 1.1,
                        ),
                      ),
                      onPressed: () {

                        final model = Provider.of<prograssHud>(context, listen: false);

                        if (_formKey.currentState.validate()) {
                          try {
                            model.changeLoading(true);

                            if (keepMeLoggedIn == true) {
                              keepUserLoggedIn();
                            }

                            authentication
                                .login(_emailController.text.trim(),
                                    _passwordController.text.trim());
                            model.changeLoading(false);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AnimatedDrawer(),
                              ),
                            );
                          } catch (e) {
                            model.changeLoading(false);
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text(e.message.toString()),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      " Create New User ?",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade400,
                          fontWeight: FontWeight.bold),
                    ),
                    FlatButton(
                      minWidth: 0,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()));
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF3C116B),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    " Or Login With ",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                _bottom(context),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _bottom(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          child: Image(
            image: AssetImage("assets/images/google.png"),
            fit: BoxFit.cover,
            width: 35,
            height: 35,
          ),
          onTap: () async {
            setState(() {
              keepMeLoggedIn=true;
            });
            if (keepMeLoggedIn == true) {
              keepUserLoggedIn();
            }

            await authentication.signInWithGoogle().then((_) =>
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => AnimatedDrawer(),),),);
          },
        ),
        SizedBox(
          width: 25,
        ),
        GestureDetector(
          child: Image(
            image: AssetImage("assets/images/facebook.png"),
            fit: BoxFit.cover,
            width: 35,
            height: 35,
          ),
          onTap: () async {
            setState(() {
              keepMeLoggedIn=true;
            });
            if (keepMeLoggedIn == true) {
              keepUserLoggedIn();
            }
            await authentication.handleLogin().then(
                  (_) => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AnimatedDrawer(),
                    ),
                  ),
                );
          },
        ),
      ],
    );
  }

  void keepUserLoggedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("KeepMeLoggedIn", keepMeLoggedIn);
  }

  _checkLoggedIn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    if (pref.containsKey("KeepMeLoggedIn")) {
      bool _logged = (pref.getBool('KeepMeLoggedIn') ?? false);

      if (_logged == null || _logged == false) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen()));
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => AnimatedDrawer(),
          ),
        );
      }
    }
  }



}
