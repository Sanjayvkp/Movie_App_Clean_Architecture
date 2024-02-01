import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'firestore_review_model.freezed.dart';
part 'firestore_review_model.g.dart';

@freezed
class FireStoreReviewModel with _$FireStoreReviewModel {
  const FireStoreReviewModel._();
  factory FireStoreReviewModel(
      {
        required String review,
      }) = _FireStoreReviewModel;

  factory FireStoreReviewModel.fromJson(Map<String, dynamic> json) =>
      _$FireStoreReviewModelFromJson(json);

  factory FireStoreReviewModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return FireStoreReviewModel.fromJson(data);
  }
  Map<String, dynamic> toFirestore() {
    return toJson();
  }
}
