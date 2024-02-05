import 'package:movie_application/features/movie_feature2/data/datasources/objectbox_datasource.dart';
import 'package:movie_application/features/movie_feature2/data/datasources/objectbox_datasource_impl.dart';
import 'package:movie_application/features/movie_feature2/data/models/objectbox_entity_model.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/movie_entity.dart';
import 'package:movie_application/features/movie_feature2/domain/repository/objectbox_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'objectbox_repository_impl.g.dart';

class ObjectBoxMovieRepositoryImpl implements ObjectBoxMovieRepository {
  final ObjectBoxDatasource datasource;
  ObjectBoxMovieRepositoryImpl({required this.datasource});
  @override
  void addAllmovies(List<MovieEntity> entity) {
    final moviemodel = [
      for (final movie in entity)
        ObjectBoxMovieEntity(
            title: movie.title,
            movieId: movie.id,
            backdrop_path: movie.backdrop_path,
            originalLanguage: movie.originalLanguage,
            originalTitle: movie.originalLanguage,
            overview: movie.overview,
            poster_path: movie.poster_path,
            releaseDate: movie.releaseDate,
            voteAverage: movie.voteAverage,
            voteCount: movie.voteCount)
    ];
    datasource.addAllMovies(moviemodel);
  }

  @override
  void clearAllMovies() {
    datasource.clearAllMovies();
  }

  @override
  List<MovieEntity> getAllmovies() {
    final models = datasource.getAllMovies();
    return [
      for (final moviemodels in models)
        MovieEntity(
            title: moviemodels.title ?? '',
            id: moviemodels.id,
            overview: moviemodels.overview ?? '',
            backdrop_path: moviemodels.backdrop_path ?? '',
            poster_path: moviemodels.poster_path ?? '',
            releaseDate: moviemodels.releaseDate!,
            voteAverage: moviemodels.voteAverage ?? 0,
            originalTitle: moviemodels.originalTitle ?? '',
            originalLanguage: moviemodels.originalLanguage ?? '',
            voteCount: moviemodels.voteCount!)
    ];
  }
}

@riverpod
ObjectBoxMovieRepository objectBoxMovieRepository(
    ObjectBoxMovieRepositoryRef ref) {
  return ObjectBoxMovieRepositoryImpl(
      datasource: ref.watch(objectBoxDatasourceProvider));
}
