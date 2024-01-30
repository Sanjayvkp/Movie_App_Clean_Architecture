import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_entity.freezed.dart';

@freezed
class MovieEntity with _$MovieEntity {
  factory MovieEntity(
      {required String title,
       required int id,
      required String overview,
      // ignore: non_constant_identifier_names
      required String backdrop_path,
      // ignore: non_constant_identifier_names
      required String poster_path,
      required DateTime releaseDate,
      required double voteAverage,
      required String originalTitle,
      required String originalLanguage,
      required int voteCount}) = _MovieEntity;
}
