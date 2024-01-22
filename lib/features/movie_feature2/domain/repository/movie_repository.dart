import 'package:movie_application/features/movie_feature2/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> getMovies();
}
