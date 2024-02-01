import 'package:movie_application/core/exception/base_exception.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/review_entity.dart';
import 'package:movie_application/features/movie_feature2/domain/repository/firebase_repository.dart';

final class AddReviewUsecase {
  final FireBaseRepository repositorys;
  AddReviewUsecase({required this.repositorys});
  Future<void> call(ReviewEntity entity) async {
    try {
      return await repositorys.addReview(entity);
    } catch (e) {
      throw BaseException('Cannot add to watchlist');
    }
  }
}
