import 'package:movie_application/features/movie_feature2/data/repository/firebase_repository_impl.dart';
import 'package:movie_application/features/movie_feature2/data/repository/movie_repository_impl.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/movie_entity.dart';
import 'package:movie_application/features/movie_feature2/domain/repository/firebase_repository.dart';
import 'package:movie_application/features/movie_feature2/domain/repository/movie_repository.dart';
import 'package:movie_application/features/movie_feature2/domain/usecases/firebase_usecase.dart';
import 'package:movie_application/features/movie_feature2/domain/usecases/movie_usecase.dart';
import 'package:movie_application/features/movie_feature2/domain/usecases/popular_usecase.dart';
import 'package:movie_application/features/movie_feature2/domain/usecases/toprated_usecase.dart';
import 'package:movie_application/features/movie_feature2/presentation/providers/movie_provider_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_provider.g.dart';

@riverpod
class MovieHome extends _$MovieHome {
  late MovieEntity entity;
  // late MovieRepository repository;

  @override
  Future<MovieProviderState> build() async {
    // repository = ref.watch(movieRepositoryProvider);
    final result = await Future.wait([
      MovieUsecase(repository: ref.watch(movieRepositoryProvider))(),
      TopRatedUseCase(repository: ref.watch(movieRepositoryProvider))(),
      PopularUseCase(repository: ref.watch(movieRepositoryProvider))(),
    ]);
    return MovieProviderState(
      getMovies: result[0],
      getTopRated: result[1],
      getPopular: result[2],
    );
  }

  Future<void> addtoFireStore(MovieEntity entity) {
    final repository = ref.watch(fireBaseRepositoryProvider);
    return FireBaseUseCase(repositorys: repository)(entity);
  }
}
