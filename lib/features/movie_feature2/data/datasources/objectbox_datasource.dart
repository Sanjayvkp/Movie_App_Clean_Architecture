import 'package:movie_application/features/movie_feature2/data/models/objectbox_entity_model.dart';
import 'package:movie_application/features/movie_feature2/data/models/popular_objectbox_entity.dart';
import 'package:movie_application/features/movie_feature2/data/models/toprated_objectbox_entity.dart';

abstract class ObjectBoxDatasource {
  void addAllMovies(List<ObjectBoxMovieEntity> entity);
  void clearAllMovies();
  List<ObjectBoxMovieEntity> getAllMovies();
  void addTopRatedMovies(List<TopMoviesEntity> entity);
  void clearTopRatedMovies();
  List<TopMoviesEntity> getTopRatedMovies();
  void addPopularMovies(List<PopularEntity> entity);
  void clearPopularMovies();
  List<PopularEntity> getPopularMovies();
}
