import 'package:movie_application/core/exception/base_exception.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/movie_entity.dart';
import 'package:movie_application/features/movie_feature2/domain/repository/firebase_repository.dart';

final class FireBaseUseCase {
  final FireBaseRepository repositorys;
  FireBaseUseCase({required this.repositorys});
  Future<void> call(MovieEntity entity) async {
    try {
      return await repositorys.addtoFireStore(entity);
    } catch (e) {
      throw BaseException('Cannot add to watchlist');
    }
  }
}
