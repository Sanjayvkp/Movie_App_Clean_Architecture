import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'firestore_model.freezed.dart';
part 'firestore_model.g.dart';

@freezed
class FireStoreModel with _$FireStoreModel {
  const FireStoreModel._();
  factory FireStoreModel(
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
      required int voteCount}) = _FireStoreModel;

  factory FireStoreModel.fromJson(Map<String, dynamic> json) =>
      _$FireStoreModelFromJson(json);

  factory FireStoreModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return FireStoreModel.fromJson(data);
  }
  Map<String, dynamic> toFirestore() {
    return toJson();
  }
}
