import 'package:movie_application/core/constants/api_constants/api_utils.dart';
import 'package:movie_application/core/objectbox/movie_objectbox.dart';
import 'package:movie_application/core/objectbox/popular_objectbox.dart';
import 'package:movie_application/core/objectbox/toprated_objectbox.dart';
import 'package:movie_application/features/movie_feature2/data/datasources/objectbox_datasource.dart';
import 'package:movie_application/features/movie_feature2/data/models/objectbox_entity_model.dart';
import 'package:movie_application/features/movie_feature2/data/models/popular_objectbox_entity.dart';
import 'package:movie_application/features/movie_feature2/data/models/toprated_objectbox_entity.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';

part 'objectbox_datasource_impl.g.dart';

class ObjectBoxDatasourceImpl implements ObjectBoxDatasource {
  final movieBox = MovieStoreObjectBox.instance.box;
  final topRatedBox = TopRatedObjectBox.instance.box;
  final popularBox = PopularObjectBox.instance.box;
  @override
  void addAllMovies(List<ObjectBoxMovieEntity> entity) async {
    final dio = Dio(BaseOptions(baseUrl: ApiUrls.linksimage));
    final cacheDirectory =
        '${(await getApplicationDocumentsDirectory()).path}/cahced_images';

    for (final movie in entity) {
      final posterPathLocation = '$cacheDirectory${movie.poster_path}';
      final backdropPathLocation = '$cacheDirectory${movie.backdrop_path}';

      await dio.download(movie.poster_path!, posterPathLocation);
      await dio.download(movie.backdrop_path!, backdropPathLocation);

      movie.poster_path = posterPathLocation;
      movie.backdrop_path = backdropPathLocation;

      movieBox.put(movie);
    }
  }

  @override
  void clearAllMovies() {
    movieBox.removeAll();
  }

  @override
  List<ObjectBoxMovieEntity> getAllMovies() {
    return movieBox.getAll();
  }

  @override
  void addPopularMovies(List<PopularEntity> entity) async {
    final dio = Dio(BaseOptions(baseUrl: ApiUrls.linksimage));
    final cacheDirectory =
        '${(await getApplicationDocumentsDirectory()).path}/cahced_images';

    for (final movie in entity) {
      final posterPathLocation = '$cacheDirectory${movie.poster_path}';
      final backdropPathLocation = '$cacheDirectory${movie.backdrop_path}';

      await dio.download(movie.poster_path!, posterPathLocation);
      await dio.download(movie.backdrop_path!, backdropPathLocation);

      movie.poster_path = posterPathLocation;
      movie.backdrop_path = backdropPathLocation;

      popularBox.put(movie);
    }
  }

  @override
  void addTopRatedMovies(List<TopMoviesEntity> entity) async {
    final dio = Dio(BaseOptions(baseUrl: ApiUrls.linksimage));
    final cacheDirectory =
        '${(await getApplicationDocumentsDirectory()).path}/cahced_images';

    for (final movie in entity) {
      final posterPathLocation = '$cacheDirectory${movie.poster_path}';
      final backdropPathLocation = '$cacheDirectory${movie.backdrop_path}';

      await dio.download(movie.poster_path!, posterPathLocation);
      await dio.download(movie.backdrop_path!, backdropPathLocation);

      movie.poster_path = posterPathLocation;
      movie.backdrop_path = backdropPathLocation;

      topRatedBox.put(movie);
    }
  }

  @override
  void clearPopularMovies() {
    movieBox.removeAll();
  }

  @override
  void clearTopRatedMovies() {
    movieBox.removeAll();
  }

  @override
  List<PopularEntity> getPopularMovies() {
    return popularBox.getAll();
  }

  @override
  List<TopMoviesEntity> getTopRatedMovies() {
    return topRatedBox.getAll();
  }
}

@riverpod
ObjectBoxDatasource objectBoxDatasource(ObjectBoxDatasourceRef ref) {
  return ObjectBoxDatasourceImpl();
}
