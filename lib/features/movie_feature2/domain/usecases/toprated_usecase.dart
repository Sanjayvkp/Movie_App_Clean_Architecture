import 'package:movie_application/core/exception/base_exception.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/movie_entity.dart';
import 'package:movie_application/features/movie_feature2/domain/repository/movie_repository.dart';

final class TopRatedUseCase {
  final MovieRepository repository;
  TopRatedUseCase({required this.repository});
  Future<List<MovieEntity>> call() async {
    try {
      return await repository.getTopRated();
    } catch (e) {
      throw BaseException('Error while fetching');
    }
  }
}
