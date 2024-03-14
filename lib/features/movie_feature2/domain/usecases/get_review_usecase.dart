import 'package:movie_application/core/exception/base_exception.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/review_entity.dart';
import 'package:movie_application/features/movie_feature2/domain/repository/firebase_repository.dart';

final class GetReviewUseCase {
  final FireBaseRepository repositorys;
  GetReviewUseCase({required this.repositorys});
  Stream<List<ReviewEntity>> call(String id) {
    try {
      return repositorys.getReview(id);
    } catch (e) {
      throw BaseException('Cannot add to watchlist');
    }
  }
}
