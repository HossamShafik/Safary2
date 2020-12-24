import 'package:cloud_firestore/cloud_firestore.dart';

class Hotel {
  String hotelId,
      hotelName,
      hotelCity,
      hotelCountry,
      hotelOverview,
      categoryName;
  List<String> room_Type;
  var hotelRate;
  var priceOfDay;
  List<String> images;

  Hotel(
      {this.hotelId,
      this.hotelName,
      this.hotelCity,
      this.hotelCountry,
      this.hotelOverview,
      this.categoryName,
      this.hotelRate,
      this.priceOfDay,
      this.room_Type,
      this.images});

  List<Hotel> fromQuery(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Hotel(
       // hotelId: doc.get('hotelId') ?? '',
        hotelCity: doc.get('hotelCity') ?? '',
        hotelCountry: doc.get('hotelCountry') ?? '',
        hotelName: doc.get('hotelName') ?? '',
        hotelRate: doc.get('hotelRate') ?? '',
        hotelOverview: doc.get('hotelOverview') ?? '',
        priceOfDay: doc.get('priceOfDay') ?? '',
        categoryName: doc.get('categoryName') ?? '',
       images: List.from(doc.get('images')) ?? [],
        room_Type:List.from( doc.get('room_Type')) ?? [],
      );
    }).toList();
  }

  Hotel.fromJson(Map<String, dynamic> json)
      :// hotelId = json['hotelId'],
        hotelCity = json['hotelCity'],
        hotelCountry = json['hotelCountry'],
        hotelName = json['hotelName'],
        hotelRate = json['hotelRate'],
        hotelOverview = json['hotelOverview'],
        priceOfDay = json['priceOfDay'],
        categoryName = json['categoryName'],
        images = json['images'],
        room_Type = json['room_Type'];

  Map<String, dynamic> toJson() {
    return {
     // 'hotelId': hotelId,
      'hotelCity': hotelCity,
      'hotelCountry': hotelCountry,
      'hotelName': hotelName,
      'hotelRate': hotelRate,
      'hotelOverview': hotelOverview,
      'priceOfDay': priceOfDay,
      'categoryName': categoryName,
      'images': images,
      'room_Type': room_Type,
    };
  }
}
