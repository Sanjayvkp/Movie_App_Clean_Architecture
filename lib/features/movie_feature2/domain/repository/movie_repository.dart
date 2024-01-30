import 'package:movie_application/features/movie_feature2/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> getMovies();
  Future<List<MovieEntity>> getTopRated();
  Future<List<MovieEntity>> getPopular();
  // Future<List<TrailerEntity>> getMovieTrailers(int movieId);
}
