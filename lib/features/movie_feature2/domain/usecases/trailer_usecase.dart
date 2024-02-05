import 'package:dio/dio.dart';
import 'package:movie_application/core/exception/base_exception.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/trailer_entity.dart';
import 'package:movie_application/features/movie_feature2/domain/repository/movie_repository.dart';

final class TrailerUsecase {
  final MovieRepository repository;
  TrailerUsecase({required this.repository});
  Future<List<TrailerEntity>> call(String id) async {
    try {
      final videos = await repository.getTrailer(id);

      final trialers = videos
          .where((video) => video.type.toLowerCase().trim() == 'trailer')
          .toList();
      return trialers;
    } catch (e) {
      throw BaseException(
          'Error while loading \n ${(e is DioException) ? e.type : e}');
    }
  }
}
