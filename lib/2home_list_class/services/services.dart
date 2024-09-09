import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electronic/1carousel/model/carosel.dart';
import 'package:electronic/2home_list_class/model/listview.dart';
import 'package:electronic/adress_model/model.dart';


class ListServices {

  ///delete
  Future<void> deletePlace(String placeId) async {
    final docRef = FirebaseFirestore.instance.collection('listview').doc(
        placeId);
    await docRef.delete();
  }

  ///read
  Stream<List<ListModel>> fetchGadgets() {
    return FirebaseFirestore.instance.collection('listview').snapshots().map(
            (snapshot) =>
            snapshot.docs
                .map((doc) => ListModel.fromMap(doc.data(), doc.id))
                .toList());
  }


  ////FOR ADDRESS (SERVICES)

  /// add address
  Future<void> addPlaces(AdressModel place) async {
    final docRef = FirebaseFirestore.instance.collection('address').doc();
    place.id = docRef.id;
    await docRef.set(place.toMap());
  }

  ///fetch address
  Stream<List<AdressModel>> fetchPlaces() {
    return FirebaseFirestore.instance.collection('address').snapshots().map(
            (snapshot) =>
            snapshot.docs
                .map((doc) => AdressModel.fromMap(doc.data(), doc.id))
                .toList());
  }
  ///update address
  Future<void> updatePlaces(AdressModel place) async {
    final docRef =
    FirebaseFirestore.instance.collection('addesss').doc(place.id);
    await docRef.update(place.toMap());
  }

  Future<void> deletePlaces(String placeId) async {
    final docRef = FirebaseFirestore.instance.collection('address').doc(
        placeId);
    await docRef.delete();
  }
}