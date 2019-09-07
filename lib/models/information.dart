import 'package:cloud_firestore/cloud_firestore.dart';

class Information {
  final String locationName;
  final String locationAddress;
  final String locationDistrict;
  final double locationLat;
  final double locationLng;
  final String dateStart;
  final String dateEnd;

  Information(
      {this.locationName,
      this.locationAddress,
      this.locationDistrict,
      this.locationLat,
      this.locationLng,
      this.dateStart,
      this.dateEnd});

  factory Information.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return Information(
      locationName: data['location_name'],
      locationAddress: data['location_address'],
      locationDistrict: data['location_district'],
      locationLat: data['location_lat'],
      locationLng: data['location_lng'],
    );
  }
}