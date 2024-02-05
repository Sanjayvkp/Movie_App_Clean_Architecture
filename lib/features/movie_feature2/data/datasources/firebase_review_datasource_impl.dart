import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_application/core/exception/base_exception.dart';
import 'package:movie_application/features/movie_feature2/data/datasources/firebase_review_datasourcee.dart';
import 'package:movie_application/features/movie_feature2/data/models/firestore_review_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_review_datasource_impl.g.dart';

class FireBaseReviewDatabaseImpl implements FireBaseReviewDataSource {
  @override
  Future<void> addReview(FireStoreReviewModel model, String id) async {
    final collection = FirebaseFirestore.instance
        .collection('comments')
        .withConverter(
            fromFirestore: FireStoreReviewModel.fromFirestore,
            toFirestore: (model, _) => model.toFirestore());
    // await collection.doc(id).set(model);
    await collection.add(model);
  }

  @override
  Stream<QuerySnapshot<FireStoreReviewModel>> getReview(String id) {
    final collection = FirebaseFirestore.instance
        .collection('comments')
        .withConverter(
            fromFirestore: FireStoreReviewModel.fromFirestore,
            toFirestore: (model, _) => model.toFirestore());
    final querySnapshot = collection.where('id', isEqualTo: id).snapshots();
    return querySnapshot;
  }

  @override
  Future<void> deleteReview(String id) async {
    final collection = FirebaseFirestore.instance
        .collection('comments')
        .withConverter(
            fromFirestore: FireStoreReviewModel.fromFirestore,
            toFirestore: (model, _) => model.toFirestore());
    try {
      await collection.doc(id).delete();
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}

@riverpod
FireBaseReviewDataSource fireBaseReviewDataSource(
    FireBaseReviewDataSourceRef ref) {
  return FireBaseReviewDatabaseImpl();
}
