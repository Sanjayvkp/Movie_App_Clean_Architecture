import 'package:movie_application/features/movie_feature2/data/models/objectbox_entity_model.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/movie_entity.dart';

abstract class ObjectBoxMovieRepository {
  void addAllmovies(List<MovieEntity> entity);
  void clearAllMovies();
  List<MovieEntity> getAllmovies();
  void addTopRatedmovies(List<MovieEntity> entity);
  void clearTopRatedMovies();
  List<MovieEntity> getTopRatedMovies();
  void addPopularMovies(List<MovieEntity> entity);
  void clearPopularMovies();
  List<MovieEntity> getPopularMovies();
}
