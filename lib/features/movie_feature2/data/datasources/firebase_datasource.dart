import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_application/features/movie_feature2/data/models/firestore_model.dart';

abstract class FireBaseDataSource {
  Future<void> addtoFireStore(FireStoreModel model);
    Future<void> deleteFromFireStore(String id);
  Stream<QuerySnapshot<FireStoreModel>> getFromFireStore();

}
