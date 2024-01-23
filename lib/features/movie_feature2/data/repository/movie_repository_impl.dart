import 'package:movie_application/features/movie_feature2/data/datasources/api_service_datasource.dart';
import 'package:movie_application/features/movie_feature2/data/datasources/api_service_datasource_impl.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/movie_entity.dart';
import 'package:movie_application/features/movie_feature2/domain/repository/movie_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_repository_impl.g.dart';

class MovieRepositoryImpl implements MovieRepository {
  final ApiServicesDatasource datasource;
  MovieRepositoryImpl({required this.datasource});
  @override
  Future<List<MovieEntity>> getMovies() async {
    final data = await datasource.getMovies();
    late List<MovieEntity> results;
    results = [
      for (final result in data.results)
        MovieEntity(
          title: result.originalTitle,
          overview: result.overview,
          backdrop_path: result.backdropPath,
          releaseDate: result.releaseDate,
          poster_path: result.posterPath,
          voteAverage: result.voteAverage,
          voteCount: result.voteCount,
          originalLanguage: result.originalLanguage,
        )
    ];
    return results;
  }
}

@riverpod
MovieRepository movieRepository(MovieRepositoryRef ref) {
  return MovieRepositoryImpl(
      datasource: ref.watch(apiServicesDatasourceProvider));
}
