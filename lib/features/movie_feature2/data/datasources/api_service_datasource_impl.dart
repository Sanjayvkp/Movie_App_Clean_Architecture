import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_application/core/constants/api_constants/api_utils.dart';

import 'package:movie_application/features/movie_feature2/data/datasources/api_service_datasource.dart';
import 'package:movie_application/features/movie_feature2/data/models/firestore_model.dart';
import 'package:movie_application/features/movie_feature2/data/models/movie_model.dart';
import 'package:dio/dio.dart';
import 'package:movie_application/features/movie_feature2/data/models/trailer_model.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/trailer_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_service_datasource_impl.g.dart';

class ApiServiceDatasourceImpl implements ApiServicesDatasource {
  final Dio dio = Dio();
  static const link = ApiUrls.movieURL;
  static const topRatedlink = ApiUrls.topRatedURL;
  static const popularLink = ApiUrls.popularURL;
  static const searchLink = ApiUrls.searchUrl;
  static const token = ApiUrls.token;
  static const trailerLink = ApiUrls.trailerLink;
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

  @override
  Future<MovieModel> searchMovie(String text) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response = await dio.get(searchLink, queryParameters: {
      'query': text,
    });
    return MovieModel.fromJson(response.data);
  }

  @override
  Future<TrailerModel> getTrailer(movieId) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    log(movieId);
    // final Response response = await dio.get('$trailerLink/$movieId/videos');
    final Response response = await dio.get('$trailerLink/$movieId/videos');

    log(response.statusCode.toString());
    return TrailerModel.fromJson(response.data);

    //   if (response.statusCode == 200) {
    //     return TrailerModel.fromJson(response.data);
    //   }
    // }
  }
}

@riverpod
ApiServicesDatasource apiServicesDatasource(ApiServicesDatasourceRef ref) {
  return ApiServiceDatasourceImpl();
}
