import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/view/profile_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  Color deepPurple = Colors.deepPurpleAccent;
  Color pink = Colors.pink[600];
  Color blue = Colors.indigo;
  Color black = Colors.black;
  Color grey = Colors.grey[900];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Search',style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w600),),
        backgroundColor: Colors.grey[50],
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: blue),onPressed: (){
          Navigator.pop(context);
        },),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return ProfileScreen();
                  }));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10,top: 6),
              child: CircleAvatar(
                radius: 26,
                backgroundColor: blue,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 23,
                  child: CircleAvatar(
                    backgroundImage:
                    AssetImage('assets/images/pro.jpg'),
                    radius: 21.5,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[50],
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15,top: 30),
          child: Column(
            children: [
              head(),
              SizedBox(height: 10,),
              body(),
            ],
          ),
        ),
      ),
    );
  }
  Widget head(){
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 55,
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search',
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 7),
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.grey[50],
                        child: IconButton(
                          icon: Icon(
                            Icons.tune,
                            color: blue,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey[700],
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.5,
                        color: blue,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget body() {
    return Expanded(
      child: ListView.builder(
        itemCount: 15,
          itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width*0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15),),
                      image: DecorationImage(
                        image: NetworkImage('https://images.pexels.com/photos/189296/pexels-photo-189296.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12,top: 12),
                              child: Text('Horus Hotel',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 9,top: 8),
                              child: Row(
                                children: [
                                  Icon(Icons.location_on_sharp,color: blue,size: 16,),
                                  Text('Cairo',style: TextStyle(),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12,top: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text('Price : ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.grey[900]),),
                                      Text('LE'+'600'+'/Day',style: TextStyle(color: pink.withOpacity(0.8),fontWeight: FontWeight.w500,),)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 12,bottom: 17),
                            child: Row(
                              children: [
                                Icon(Icons.star_rate_rounded,size: 19,color: Colors.orange,),
                                Text('4.5',style: TextStyle(color: Colors.grey[700],fontWeight: FontWeight.w400),),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
          }
      ),
    );
  }
}
