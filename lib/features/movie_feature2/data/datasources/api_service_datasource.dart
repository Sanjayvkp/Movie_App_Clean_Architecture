import 'package:movie_application/features/movie_feature2/data/models/firestore_model.dart';
import 'package:movie_application/features/movie_feature2/data/models/movie_model.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/trailer_entity.dart';

abstract class ApiServicesDatasource {
  Future<MovieModel> getMovies();
  Future<MovieModel> getTopRated();
  Future<MovieModel> getPopular();
  Future<MovieModel> searchMovie(String text);
  // Future<List<TrailerEntity>> getTrailer(int movieId);
}
