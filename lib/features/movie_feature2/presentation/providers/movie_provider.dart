import 'package:movie_application/features/movie_feature2/data/repository/movie_repository_impl.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/movie_entity.dart';
import 'package:movie_application/features/movie_feature2/domain/repository/movie_repository.dart';
import 'package:movie_application/features/movie_feature2/domain/usecases/movie_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_provider.g.dart';

@riverpod
class MovieHome extends _$MovieHome {
  late final MovieRepository repository;
  @override
  Future<List<MovieEntity>> build() {
    return MovieUsecase(repository: ref.watch(movieRepositoryProvider))();
  }
}
