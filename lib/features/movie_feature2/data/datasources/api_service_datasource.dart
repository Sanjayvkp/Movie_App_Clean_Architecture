import 'package:movie_application/features/movie_feature2/data/models/movie_model.dart';

abstract class ApiServicesDatasource {
  Future<MovieModel> getMovies();
}
