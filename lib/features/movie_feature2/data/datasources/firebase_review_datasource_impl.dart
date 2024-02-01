import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_application/features/movie_feature2/data/datasources/firebase_review_datasourcee.dart';
import 'package:movie_application/features/movie_feature2/data/models/firestore_review_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_review_datasource_impl.g.dart';

class FireBaseReviewDatabaseImpl implements FireBaseReviewDataSource {
  final collection = FirebaseFirestore.instance
      .collection('comments')
      .withConverter(
          fromFirestore: FireStoreReviewModel.fromFirestore,
          toFirestore: (model, _) => model.toFirestore());
  @override
  Future<void> addReview(FireStoreReviewModel model) async {
    await collection.doc().set(model);
  }
}

@riverpod
FireBaseReviewDataSource fireBaseReviewDataSource(
    FireBaseReviewDataSourceRef ref) {
  return FireBaseReviewDatabaseImpl();
}
