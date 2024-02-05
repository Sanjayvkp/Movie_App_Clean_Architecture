import 'package:movie_application/core/exception/base_exception.dart';
import 'package:movie_application/features/movie_feature2/domain/repository/firebase_repository.dart';

final class DeleteReviewUsecase {
  final FireBaseRepository repositorys;
  DeleteReviewUsecase({required this.repositorys});
  Future<void> call(String id) async {
    try {
      return await repositorys.deleteReview(id);
    } catch (e) {
      throw BaseException('Cannot delete');
    }
  }
}
