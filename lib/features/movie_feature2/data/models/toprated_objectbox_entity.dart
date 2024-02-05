// ignore_for_file: non_constant_identifier_names

import 'package:objectbox/objectbox.dart';



@Entity()
class TopMoviesEntity {
  @Id()
  int id = 0;
  String? title;
  int? movieId;
  String? overview;
  String? backdrop_path;
  String? poster_path;
  DateTime? releaseDate;
  double? voteAverage;
  String? originalTitle;
  String? originalLanguage;
  int? voteCount;

  TopMoviesEntity(
      {this.id=0,
      required this.title,
      required this.movieId,
      required this.backdrop_path,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.poster_path,
      required this.releaseDate,
      required this.voteAverage,
      required this.voteCount});
}
