import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electronic/1carousel/model/carosel.dart';


class SlideServices {

  ///delete
  Future<void> deletePlace(String placeId) async {
    final docRef = FirebaseFirestore.instance.collection('tasker').doc(placeId);
    await docRef.delete();
  }

  ///read
  Stream<List<SlideModel>> fetchPlaces() {
    return FirebaseFirestore.instance.collection('tasker').snapshots().map(
            (snapshot) => snapshot.docs
            .map((doc) => SlideModel.fromMap(doc.data(), doc.id))
            .toList());
  }

}
