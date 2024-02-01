import 'package:movie_application/core/exception/base_exception.dart';
import 'package:movie_application/features/movie_feature2/domain/repository/firebase_repository.dart';

final class FireBaseDeleteUsecase {
  final FireBaseRepository repositorys;
  FireBaseDeleteUsecase({required this.repositorys});
  Future<void> call(String id) {
    try {
      return repositorys.deleteFromFirestore(id);
    } catch (e) {
      throw BaseException('Cannot add to watchlist');
    }
  }
}
