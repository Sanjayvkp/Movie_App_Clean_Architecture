import 'package:movie_application/features/movie_feature2/data/models/firestore_review_model.dart';

abstract class FireBaseReviewDataSource {
  Future<void> addReview(FireStoreReviewModel model);
}
