import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/models/car.dart';
import 'package:project/models/hotel.dart';
import 'package:project/models/tour.dart';
import 'package:project/models/users.dart';

class DataBase {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
 final CollectionReference hotelCollection= FirebaseFirestore.instance.collection("Hotels");
 final CollectionReference carCollection= FirebaseFirestore.instance.collection("Cars");
 final CollectionReference tourCollection= FirebaseFirestore.instance.collection("Tours");

  Future<void> addTraveler(Travelers travelers) async {
    return await firestore.collection("Travelers").doc(travelers.id).set({
      "traveler_id": travelers.id,
      "firstName": travelers.firstName,
      "lastName": travelers.lastName,
      "address": travelers.address,
      "phone": travelers.phone,
      "gender": travelers.gender,
      "username": travelers.username,
      "password": travelers.password,
      "image": travelers.image,
    });
  }


  // stream for hotels
  Stream<List<Hotel>> get getHotels {
  return hotelCollection.limit(4).snapshots().map(Hotel().fromQuery);
  }

  Future<void> addNewHotel(Hotel hotel)async{
    await hotelCollection.doc().set(hotel.toJson());
  }


  // stream for cars
  Stream<List<Cars>> get getCars {
    return carCollection.limit(4).snapshots().map(Cars().fromQuery);
  }

  Future<void> addNewCar(Cars car)async{
    await carCollection.doc().set(car.toJson());
  }


  // stream for tours
  Stream<List<Tour>> get getTours {
    return tourCollection.limit(4).snapshots().map(Tour().fromQuery);
  }

  Future<void> addNewTour(Tour tour)async{
    await tourCollection.doc().set(tour.toJson());
  }

}
