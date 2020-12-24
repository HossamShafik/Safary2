import 'package:cloud_firestore/cloud_firestore.dart';


class Cars{
  String id,CarName,CarOverview,CarCountry,CarCity,CategoryName,CarType;
  var CarRate,PriceOfDay;
  List<String> CarPhotos;

  Cars({
    this.id,
    this.CarName,
    this.CarOverview,
    this.CarCountry,
    this.CarCity,
    this.CategoryName,
    this.CarType,
    this.CarRate,
    this.PriceOfDay,
    this.CarPhotos});

  List<Cars> fromQuery(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Cars(
        CarName: doc.get('CarName') ?? '',
          CarCity: doc.get('CarCity') ?? '',
          CarCountry: doc.get('CarCountry') ?? '',
          CarRate: doc.get('CarRate') ?? '',
          CarOverview: doc.get('CarOverview') ?? '',
          PriceOfDay: doc.get('PriceOfDay') ?? '',
          CategoryName: doc.get('CategoryName') ?? '',
          CarPhotos: List.from(doc.get('CarPhotos')) ?? [],
          CarType:doc.get('CarType') ?? '',
      );
    }).toList();
  }

  Cars.fromJson(Map<String, dynamic> json)
      :
        CarName = json['CarName'],
        CarCity = json['CarCity'],
        CarCountry = json['CarCountry'],
        CarRate = json['CarRate'],
        CarOverview = json['CarOverview'],
        PriceOfDay = json['PriceOfDay'],
        CategoryName = json['CategoryName'],
        CarPhotos = json['CarPhotos'],
        CarType = json['CarType'];

  Map<String, dynamic> toJson() {
    return {

      'CarCity': CarCity,
      'CarCountry': CarCountry,
      'CarName': CarName,
      'CarRate': CarRate,
      'CarOverview': CarOverview,
      'PriceOfDay': PriceOfDay,
      'CategoryName': CategoryName,
      'CarPhotos': CarPhotos,
      'CarType': CarType,
    };
  }
}