import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:project/Controllers/authentication/auth.dart';
import 'package:project/Controllers/firestore/DataBase.dart';
import 'package:project/models/prograss_model_hud.dart';
import 'package:project/models/users.dart';
import 'package:project/view/login_screen.dart';
import 'package:path/path.dart' as p ;
import 'package:provider/provider.dart';


class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  final  _scaffoldKey = GlobalKey<ScaffoldState>();
  Color primaryColor =Color(0xFF3C116B);

  final Authentication authentication = Authentication();
  final DataBase dataBase = DataBase();

  bool _obscureText1 =false;
  bool _obscureText2 =false;
  File _image;
  String _url;



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


  TextStyle _labelStyle = TextStyle(color: Colors.black, inherit: true);

  String genderValue;
  String choice;

  void radioButtonChanges(String value) {
    setState(() {
      genderValue = value;
      switch (value) {
        case 'Male':
          choice = value;

          break;
        case 'Female':
          choice = value;
          break;
        default:
          choice = null;
      }
      return choice;
    });
  }

  @override
  void initState() {

    setState(() {
      choice = "Male";
      genderValue="Male";
    });
      authentication.currentUser();

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
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
            key: _scaffoldKey,
            body: ModalProgressHUD(
              inAsyncCall: Provider.of<prograssHud>(context).isLoading,
              child: SafeArea(
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
      height: MediaQuery.of(context).size.height*0.40,
      imageUrl:
          "https://images.pexels.com/photos/3727255/pexels-photo-3727255.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }

  Widget _form(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30,left: 20,right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                " Register ",
                style: TextStyle(
                    fontSize: 32,
                    color: primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          _showPicker(context);
                        },
                        child: Container(
                          width: 70,
                          height: 70,
                          child: CustomPaint(
                            painter: CirclePainter(),
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              backgroundImage: _image!=null?FileImage(_image):null,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: (){
                          _showPicker(context);
                        },
                        icon:Icon(
                          Icons.camera_alt,
                          size: 30,
                          color: _image!=null? Colors.transparent : Color(0xFF3C116B),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text("Upload Photo",style: TextStyle(color: Colors.grey),),
                ],
              ),
            ],
          ),
        ),
        Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 25, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFormField(
                  maxLines: 1,
                  controller: _firstNameController,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    labelText: "First Name",
                    labelStyle: _labelStyle,
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color(0xFF3C116B),
                    ),
                    fillColor: Colors.white,
                    focusedBorder: borderF,
                    enabledBorder: borderE,
                    border: borderE,
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'First Name is required';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  maxLines: 1,
                  controller: _lastNameController,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    labelText: "Last Name",
                    labelStyle: _labelStyle,
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color(0xFF3C116B),
                    ),
                    fillColor: Colors.white,
                    focusedBorder: borderF,
                    enabledBorder: borderE,
                    border: borderE,
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Last Name is required';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _emailController,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    labelText: "Username",
                    labelStyle: _labelStyle,
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Color(0xFF3C116B),
                    ),
                    fillColor: Colors.white,
                    focusedBorder: borderF,
                    enabledBorder: borderE,
                    border: borderE,
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
                  height: 15,
                ),
                TextFormField(
                  controller: _passwordController,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  obscureText: !_obscureText1,
                  decoration: InputDecoration(
                    prefixStyle: TextStyle(
                      color: Color(0xFFEAF5F7),
                    ),
                    labelText: "Password",
                    labelStyle: _labelStyle,
                    prefixIcon: Icon(
                      Icons.lock_outlined,
                      color: Color(0xFF3C116B),
                    ),
                    suffixIcon: IconButton(
                      color: Color(0xFF3C116B),
                      icon: Icon(_obscureText1
                          ? Icons.visibility
                          : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText1 = !_obscureText1;
                        });
                      },
                    ),
                    fillColor: Colors.white,
                    focusedBorder: borderF,
                    enabledBorder: borderE,
                    border: borderE,
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Password is required';
                    } else if(value.length < 6){
                      return 'Password is Weak';
                    }
                    else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _confirmPasswordController,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  obscureText: !_obscureText2,
                  decoration: InputDecoration(
                    prefixStyle: TextStyle(
                      color: Color(0xFFEAF5F7),
                    ),
                    labelText: 'Confirm Password',
                    labelStyle: _labelStyle,
                    prefixIcon: Icon(
                      Icons.lock_outlined,
                      color: Color(0xFF3C116B),
                    ),
                    suffixIcon: IconButton(
                      color: Color(0xFF3C116B),
                      icon: Icon(_obscureText2
                          ? Icons.visibility
                          : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText2 = !_obscureText2;
                        });
                      },
                    ),
                    fillColor: Colors.white,
                    focusedBorder: borderF,
                    enabledBorder: borderE,
                    border: borderE,
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Password is required';
                    } else if (value != _passwordController.text) {
                      return "Password  Not Match ";
                    }else if(value.length < 6){
                      return 'Password is Weak';
                    }
                    else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  maxLength: 11,
                  keyboardType: TextInputType.phone,
                  controller: _phoneController,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    labelText: "Phone",
                    labelStyle: _labelStyle,
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Color(0xFF3C116B),
                    ),
                    fillColor: Colors.white,
                    focusedBorder: borderF,
                    enabledBorder: borderE,
                    border: borderE,
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Phone Number is required';
                    } else if (value.length<11){
                      return 'Phone Number lower than 11';
                    }
                    else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  keyboardType: TextInputType.streetAddress,
                  controller: _addressController,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    labelText: "Address",
                    labelStyle: _labelStyle,
                    prefixIcon: Icon(
                      Icons.location_city,
                      color: Color(0xFF3C116B),
                    ),
                    fillColor: Colors.white,
                    focusedBorder: borderF,
                    enabledBorder: borderE,
                    border: borderE,
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return ' Address is required';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: [
                        Radio(
                          value: 'Male',
                          groupValue: genderValue,
                          onChanged: radioButtonChanges,
                          activeColor: Color(0xFF3C116B),
                        ),
                        Text(
                          "Male ",
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Radio(
                          value: 'Female',
                          groupValue: genderValue,
                          onChanged: radioButtonChanges,
                          activeColor: Color(0xFF3C116B),
                        ),
                        Text(
                          "Female ",
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
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
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            letterSpacing: 1.1,
                          ),
                        ),
                        onPressed: () async {

                          final model = Provider.of<prograssHud>(context, listen: false);

                          if (_formKey.currentState.validate()&&_image != null) {
                            try {
                              model.changeLoading(true);

                              await authTraveler();
                               await _uploadImage(_image);
                               await storeData();

                               model.changeLoading(false);

                            } catch (e) {
                              model.changeLoading(false);
                              _scaffoldKey.currentState.showSnackBar(
                                SnackBar(
                                  content: Text(e.message.toString()),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            }
                            model.changeLoading(false);

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
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
  authTraveler() async{
    await authentication.signUp(_emailController.text.trim(), _passwordController.text.trim());
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),),);
  }


  Future _uploadImage(File image)async{

    FirebaseStorage storage=FirebaseStorage(storageBucket: "gs://safari-726f0.appspot.com");
    final StorageReference storageReference = storage.ref().child(p.basename(image.path));
    final StorageUploadTask uploadTask = storageReference.putFile(image);
    StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
     _url=await taskSnapshot.ref.getDownloadURL();

    return _url;
  }


  storeData() async{

   return await dataBase.addTraveler(
      Travelers(
        id: authentication.currentUser(),
        username: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        address: _addressController.text.trim(),
        phone: _phoneController.text.trim(),
        gender: choice,
        image: _url,
      ),

    );

  }

  Future getImageFromGallery() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery,);

    setState(() {
      if (pickedFile != null){
        _image = File(pickedFile.path);
      }else{
        print('No image selected.');
      }
    });
  }

  Future getImageFromCamera() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera,);

    setState(() {
      if (pickedFile != null){
        _image = File(pickedFile.path);
      }else{
        print('No image selected.');
      }
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child:  Wrap(
                children: <Widget>[
                   ListTile(
                      leading:  Icon(Icons.photo_library,color: primaryColor,),
                      title:  Text('Gallery',style: TextStyle(color: primaryColor),),
                      onTap: () {
                        getImageFromGallery();
                        Navigator.of(context).pop();
                      }),
                   ListTile(
                    leading:  Icon(Icons.photo_camera,color: primaryColor,),
                    title:  Text('Camera',style: TextStyle(color: primaryColor),),
                    onTap: () {
                      getImageFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }





}



class CirclePainter extends CustomPainter {
  final _paint = Paint()
    ..color = Color(0xFF3C116B)
    ..strokeWidth = 1
    // Use [PaintingStyle.fill] if you want the circle to be filled.
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawOval(
      Rect.fromLTWH(0, 0, size.width, size.height),
      _paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }




}
