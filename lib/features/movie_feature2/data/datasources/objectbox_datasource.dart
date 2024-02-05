import 'package:movie_application/features/movie_feature2/data/models/objectbox_entity_model.dart';

abstract class ObjectBoxDatasource {
  void addAllMovies(List<ObjectBoxMovieEntity> entity);
  void clearAllMovies();
  List<ObjectBoxMovieEntity> getAllMovies();
}
