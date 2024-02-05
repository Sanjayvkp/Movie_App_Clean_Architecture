import 'package:movie_application/features/movie_feature2/data/models/objectbox_entity_model.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/movie_entity.dart';

abstract class ObjectBoxMovieRepository {
  void addAllmovies(List<MovieEntity> entity);
  void clearAllMovies();
  List<MovieEntity> getAllmovies();
}
