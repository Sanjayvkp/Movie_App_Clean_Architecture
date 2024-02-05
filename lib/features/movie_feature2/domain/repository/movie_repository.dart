import 'package:movie_application/features/movie_feature2/domain/entities/movie_entity.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/trailer_entity.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> getMovies();
  Future<List<MovieEntity>> getTopRated();
  Future<List<MovieEntity>> getPopular();
  Future<List<MovieEntity>> searchMovies(String text);
  Future<List<TrailerEntity>> getTrailer(String id);
}
