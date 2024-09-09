import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electronic/2home_list_class/model/listview.dart';

class LaptopClass{
  Stream<List<ListModel>> fetchLaptops() {
    return FirebaseFirestore.instance.collection('laptops').snapshots().map(
            (snapshot) => snapshot.docs
            .map((doc) => ListModel.fromMap(doc.data(), doc.id))
            .toList());
  }
}