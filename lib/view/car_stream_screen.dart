
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:project/Controllers/firestore/DataBase.dart';
import 'package:project/models/car.dart';

import 'package:provider/provider.dart';

class CarStream extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Cars>>.value(
      value: DataBase().getCars,
      catchError: (_, err) => throw Exception(err),
      child: CarWidget(),
    );
  }
}

class CarWidget extends StatelessWidget {

  Color primaryColor = Color(0xFF3C116B);
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final carList = Provider.of<List<Cars>>(context);
    if(carList != null){
      print("==============================");
      print(carList.length);
    }else{
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
          carList != null && carList.length > 0 ? carList.length : 0,
          itemBuilder: (context, index) {
            final Cars currentCar = carList[index];
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(currentCar.CarPhotos[0]),
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
                          child: Text(currentCar.CarName,style: TextStyle(color: Colors.white,fontSize: 13),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5,top: 2),
                          child: Row(
                            children: [
                              Icon(Icons.location_on_sharp,color:Colors.redAccent,size: 16,),
                              Text(currentCar.CarCity,style: TextStyle(color: Colors.white,fontSize: 11),),
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


