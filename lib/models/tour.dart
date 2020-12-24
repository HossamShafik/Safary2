import 'package:cloud_firestore/cloud_firestore.dart';

class Tour{
  String PlaceName,TourOverview,TourCountry,TourCity,CategoryName;
  var TourRate;
    var  TourPrice;
  List<String> TourPhotos;


  Tour({
      this.PlaceName,
      this.TourOverview,
      this.TourCountry,
      this.TourCity,
      this.CategoryName,
      this.TourRate,
      this.TourPrice,
      this.TourPhotos});

  List<Tour> fromQuery(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Tour(
        PlaceName: doc.get('PlaceName') ?? '',
        TourCity: doc.get('TourCity') ?? '',
        TourCountry: doc.get('TourCountry') ?? '',
        TourRate: doc.get('TourRate') ?? '',
        TourOverview: doc.get('TourOverview') ?? '',
        TourPrice: doc.get('TourPrice') ?? '',
        CategoryName: doc.get('CategoryName') ?? '',
        TourPhotos: List.from(doc.get('TourPhotos')) ?? [],
      );
    }).toList();
  }

  Tour.fromJson(Map<String, dynamic> json)
      :
        PlaceName = json['PlaceName'],
        TourCity = json['TourCity'],
        TourCountry = json['TourCountry'],
        TourRate = json['TourRate'],
        TourOverview = json['TourOverview'],
        TourPrice = json['TourPrice'],
        CategoryName = json['CategoryName'],
        TourPhotos = json['TourPhotos'];

  Map<String, dynamic> toJson() {
    return {
      'TourCity': TourCity,
      'TourCountry': TourCountry,
      'PlaceName': PlaceName,
      'TourRate': TourRate,
      'TourOverview': TourOverview,
      'TourPrice': TourPrice,
      'CategoryName': CategoryName,
      'TourPhotos': TourPhotos,
    };
  }
}