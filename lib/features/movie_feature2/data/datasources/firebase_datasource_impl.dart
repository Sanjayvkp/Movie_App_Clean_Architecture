import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_application/features/movie_feature2/data/datasources/firebase_datasource.dart';
import 'package:movie_application/features/movie_feature2/data/models/firestore_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_datasource_impl.g.dart';

class FirebaseDataSourceImpl implements FireBaseDataSource {
  final collection = FirebaseFirestore.instance
      .collection('watchlist')
      .withConverter(
          fromFirestore: FireStoreModel.fromFirestore,
          toFirestore: (model, _) => model.toFirestore());
  @override
  Future<void> addtoFireStore(FireStoreModel model) async {
    await collection.doc(model.id.toString()).set(model);
  }

  @override
  Stream<QuerySnapshot<FireStoreModel>> getFromFireStore() {
    final querySnapshot = collection.snapshots();
    return querySnapshot;
  }

  @override
  Future<void> deleteFromFireStore(String id) async {
    await collection.doc(id).delete();
  }
}

@riverpod
FireBaseDataSource fireBaseDataSource(FireBaseDataSourceRef ref) {
  return FirebaseDataSourceImpl();
}
