import 'package:movie_application/features/movie_feature2/data/repository/movie_repository_impl.dart';
import 'package:movie_application/features/movie_feature2/domain/repository/movie_repository.dart';
import 'package:movie_application/features/movie_feature2/domain/usecases/movie_usecase.dart';
import 'package:movie_application/features/movie_feature2/domain/usecases/popular_usecase.dart';
import 'package:movie_application/features/movie_feature2/domain/usecases/toprated_usecase.dart';
import 'package:movie_application/features/movie_feature2/presentation/providers/movie_provider_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_provider.g.dart';

@riverpod
class MovieHome extends _$MovieHome {
  @override
  Future<MovieProviderState> build() async {
    final MovieRepository repository = ref.watch(movieRepositoryProvider);
    final result = await Future.wait([
      MovieUsecase(repository: repository)(),
      TopRatedUseCase(repository: repository)(),
      PopularUseCase(repository: repository)(),
    ]);
    return MovieProviderState(
        getMovies: result[0], getTopRated: result[1], getPopular: result[2]);
  }
}
