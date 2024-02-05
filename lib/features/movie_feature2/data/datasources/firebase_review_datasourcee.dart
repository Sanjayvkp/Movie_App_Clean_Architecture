import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_application/features/movie_feature2/data/models/firestore_review_model.dart';

abstract class FireBaseReviewDataSource {
  Future<void> addReview(FireStoreReviewModel model, String id);

  Stream<QuerySnapshot<FireStoreReviewModel>> getReview(String id);

  Future<void> deleteReview(String id);
}
