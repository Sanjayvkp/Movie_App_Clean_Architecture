// import 'package:movie_application/core/exception/base_exception.dart';
// import 'package:movie_application/features/movie_feature2/domain/entities/movie_entity.dart';
// import 'package:movie_application/features/movie_feature2/domain/repository/movie_repository.dart';

// final class TopRatedUseCase {
//   final MovieRepository repository;
//   TopRatedUseCase({required this.repository});
//   Future<List<MovieEntity>> call() async {
//     try {
//       return await repository.getTopRated();
//     } catch (e) {
//       throw BaseException('Error while fetching');
//     }
//   }
// }

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:movie_application/core/exception/base_exception.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/movie_entity.dart';
import 'package:movie_application/features/movie_feature2/domain/repository/movie_repository.dart';
import 'package:movie_application/features/movie_feature2/domain/repository/objectbox_repository.dart';

final class TopRatedUseCase {
  final ObjectBoxMovieRepository localrepo;
  final MovieRepository repository;
  TopRatedUseCase({required this.repository, required this.localrepo});
  Future<List<MovieEntity>> call() async {
    bool result = await InternetConnection().hasInternetAccess;
    try {
      if (result) {
        final datafromApi = await repository.getTopRated();
        localrepo.clearTopRatedMovies();
        localrepo.addTopRatedmovies(datafromApi);
        return datafromApi;
      } else {
        final datafromlocal = localrepo.getTopRatedMovies();
        return datafromlocal;
      }
    } catch (e) {
      throw BaseException('Error while fetching');
    }
  }
}
