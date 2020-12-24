import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:project/Controllers/firestore/DataBase.dart';
import 'package:project/models/hotel.dart';
import 'package:project/view/home_screen.dart';
import 'package:provider/provider.dart';

class HotelStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Hotel>>.value(
      value: DataBase().getHotels,
      catchError: (_, err) => throw Exception(err),
      child: HotelWidget(),
    );
  }
}

class HotelWidget extends StatelessWidget {
  Color primaryColor = Color(0xFF3C116B);
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final hotelList = Provider.of<List<Hotel>>(context);
    if (hotelList != null) {
      print("==============================");
      print(hotelList.length);
    } else {
      print("null");
    }
    return Container(
      height: 545,
      child: StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          physics: NeverScrollableScrollPhysics(),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          itemCount:
              hotelList != null && hotelList.length > 0 ? hotelList.length : 0,
          itemBuilder: (context, index) {
            final Hotel currentHotel = hotelList[index];
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(currentHotel.images[0]),
                  fit: BoxFit.cover,
                ),
                  borderRadius: BorderRadius.all(Radius.circular(10),),
            ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10),),
                      color: Colors.black.withOpacity(0.4),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8,top: 4),
                          child: Text(currentHotel.hotelName,style: TextStyle(color: Colors.white,fontSize: 13),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5,top: 2),
                          child: Row(
                            children: [
                              Icon(Icons.location_on_sharp,color:Colors.redAccent,size: 16,),
                              Text(currentHotel.hotelCity,style: TextStyle(color: Colors.white,fontSize: 11),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          staggeredTileBuilder: (index){
            return new StaggeredTile.count(1, index.isEven ? 1.8 : 1.2);
          }
      ),
    );
  }
}
