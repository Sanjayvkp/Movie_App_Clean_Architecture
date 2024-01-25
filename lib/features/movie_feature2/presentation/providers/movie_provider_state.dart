import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/movie_entity.dart';

part 'movie_provider_state.freezed.dart';

@freezed
class MovieProviderState with _$MovieProviderState {
  factory MovieProviderState({
    required List<MovieEntity> getMovies,
    required List<MovieEntity> getTopRated,
    required List<MovieEntity> getPopular,
  }) = _MovieProviderState;
}
