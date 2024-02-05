// import 'package:movie_application/core/exception/base_exception.dart';
// import 'package:movie_application/features/movie_feature2/domain/entities/movie_entity.dart';
// import 'package:movie_application/features/movie_feature2/domain/repository/movie_repository.dart';

// final class PopularUseCase {
//   final MovieRepository repository;
//   PopularUseCase({required this.repository});
//   Future<List<MovieEntity>> call() async {
//     try {
//       return await repository.getPopular();
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

final class PopularUseCase {
  final ObjectBoxMovieRepository localrepo;
  final MovieRepository repository;
  PopularUseCase({required this.repository, required this.localrepo});
  Future<List<MovieEntity>> call() async {
    bool result = await InternetConnection().hasInternetAccess;
    try {
      if (result) {
        final datafromApi = await repository.getPopular();
        localrepo.clearPopularMovies();
        localrepo.addPopularMovies(datafromApi);
        return datafromApi;
      } else {
        final datafromlocal = localrepo.getPopularMovies();
        return datafromlocal;
      }
    } catch (e) {
      throw BaseException('Error while fetching');
    }
  }
}
