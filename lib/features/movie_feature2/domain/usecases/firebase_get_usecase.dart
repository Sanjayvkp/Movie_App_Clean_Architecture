import 'package:movie_application/core/exception/base_exception.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/movie_entity.dart';
import 'package:movie_application/features/movie_feature2/domain/repository/firebase_repository.dart';

final class FireBaseGetUsecase {
  final FireBaseRepository repositorys;
  FireBaseGetUsecase({required this.repositorys});
  Stream<List<MovieEntity>> call() {
    try {
      return repositorys.getFromFirestore();
    } catch (e) {
      throw BaseException('Cannot add to watchlist');
    }
  }
}
