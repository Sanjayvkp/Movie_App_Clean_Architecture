import 'package:movie_application/features/movie_feature2/domain/entities/movie_entity.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/review_entity.dart';

abstract class FireBaseRepository {
  Future<void> addtoFireStore(MovieEntity entity);
  Future<void> addReview(ReviewEntity entity);
  Future<void> deleteFromFirestore(String id);
  Stream<List<MovieEntity>> getFromFirestore();
}
