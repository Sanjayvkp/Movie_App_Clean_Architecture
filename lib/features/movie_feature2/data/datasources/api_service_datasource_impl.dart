import 'package:movie_application/core/constants/api_constants/api_utils.dart';

import 'package:movie_application/features/movie_feature2/data/datasources/api_service_datasource.dart';
import 'package:movie_application/features/movie_feature2/data/models/movie_model.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_service_datasource_impl.g.dart';

class ApiServiceDatasourceImpl implements ApiServicesDatasource {
  final Dio dio = Dio();
  static const link = ApiUrls.movieURL;
  static const topRatedlink = ApiUrls.topRatedURL;
  static const popularLink = ApiUrls.popularURL;
  static const token = ApiUrls.token;
  @override
  Future<MovieModel> getMovies() async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    final Response response = await dio.get(link);
    return MovieModel.fromJson(response.data);
  }

  @override
  Future<MovieModel> getTopRated() async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    final Response response = await dio.get(topRatedlink);
    return MovieModel.fromJson(response.data);
  }

  @override
  Future<MovieModel> getPopular() async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    final Response response = await dio.get(popularLink);
    return MovieModel.fromJson(response.data);
  }
}

@riverpod
ApiServicesDatasource apiServicesDatasource(ApiServicesDatasourceRef ref) {
  return ApiServiceDatasourceImpl();
}
