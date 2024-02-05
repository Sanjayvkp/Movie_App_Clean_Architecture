import 'dart:developer';

import 'package:movie_application/features/movie_feature2/data/repository/movie_repository_impl.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/trailer_entity.dart';
import 'package:movie_application/features/movie_feature2/domain/usecases/trailer_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'trailer_provider.g.dart';

@riverpod
Future<List<TrailerEntity>> trailer(TrailerRef ref, String movieId) async {
  log(movieId);
  return await TrailerUsecase(repository: ref.read(movieRepositoryProvider))(
      movieId);
}
