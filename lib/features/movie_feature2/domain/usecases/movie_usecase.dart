import 'dart:io';
import 'package:movie_application/core/exception/base_exception.dart';
import 'package:movie_application/core/utils/network_utils.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/movie_entity.dart';
import 'package:movie_application/features/movie_feature2/domain/repository/movie_repository.dart';
import 'package:movie_application/features/movie_feature2/domain/repository/objectbox_repository.dart';

final class MovieUsecase {
  final ObjectBoxMovieRepository localrepo;
  final MovieRepository repository;
  MovieUsecase({required this.repository, required this.localrepo});
  Future<List<MovieEntity>> call() async {
    bool result = await NetworkUtils.hasNetwork();
    try {
      if (result) {
        final datafromApi = await repository.getMovies();
        localrepo.clearAllMovies();
        localrepo.addAllmovies(datafromApi);
        return datafromApi;
      } else {
        final datafromlocal = localrepo.getAllmovies();
        return datafromlocal;
      }
    } catch (e) {
      throw BaseException('Error while fetching');
    }
  }
}
