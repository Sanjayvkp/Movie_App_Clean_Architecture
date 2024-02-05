import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_application/features/movie_feature2/data/datasources/firebase_datasource.dart';
import 'package:movie_application/features/movie_feature2/data/datasources/firebase_datasource_impl.dart';
import 'package:movie_application/features/movie_feature2/data/datasources/firebase_review_datasource_impl.dart';
import 'package:movie_application/features/movie_feature2/data/datasources/firebase_review_datasourcee.dart';
import 'package:movie_application/features/movie_feature2/data/models/firestore_model.dart';
import 'package:movie_application/features/movie_feature2/data/models/firestore_review_model.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/movie_entity.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/review_entity.dart';
import 'package:movie_application/features/movie_feature2/domain/repository/firebase_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_repository_impl.g.dart';

class FireBaseRepostoryImpl implements FireBaseRepository {
  final FireBaseDataSource dataSource;
  final FireBaseReviewDataSource reviewdatasource;
  FireBaseRepostoryImpl(
      {required this.dataSource, required this.reviewdatasource});
  @override
  Future<void> addtoFireStore(MovieEntity entity) async {
    final model = FireStoreModel(
        title: entity.title,
        id: entity.id,
        overview: entity.overview,
        backdrop_path: entity.backdrop_path,
        poster_path: entity.poster_path,
        releaseDate: entity.releaseDate,
        voteAverage: entity.voteAverage,
        originalTitle: entity.originalTitle,
        originalLanguage: entity.originalLanguage,
        voteCount: entity.voteCount);
    await dataSource.addtoFireStore(model);
  }

  @override
  Stream<List<MovieEntity>> getFromFirestore() async* {
    final querysnapshot = dataSource.getFromFireStore();
    await for (final doc in querysnapshot) {
      final data = doc.docs;
      yield [
        for (final model in data)
          MovieEntity(
              title: model.data().title,
              id: model.data().id,
              overview: model.data().overview,
              backdrop_path: model.data().backdrop_path,
              poster_path: model.data().poster_path,
              releaseDate: model.data().releaseDate,
              voteAverage: model.data().voteAverage,
              originalTitle: model.data().originalTitle,
              originalLanguage: model.data().originalLanguage,
              voteCount: model.data().voteCount)
      ];
    }
  }

  @override
  Future<void> deleteFromFirestore(String id) async {
    await dataSource.deleteFromFireStore(id);
  }

  @override
  Future<void> addReview(ReviewEntity entity, String id) async {
    final model = FireStoreReviewModel(
      review: entity.review,
      id: entity.id,
    );
    await reviewdatasource.addReview(model, id);
  }

  @override
  Stream<List<ReviewEntity>> getReview(String id) async* {
    final querysnapshot = reviewdatasource.getReview(id);
    await for (var snapshot in querysnapshot) {
      final docs = snapshot.docs;
      yield [
        for (var model in docs)
          ReviewEntity(
              review: model.data().review,
              id: model.data().id,
              movieId: model.data().id)
      ];
    }
  }

  @override
  Future<void> deleteReview(String id) async {
    await reviewdatasource.deleteReview(id);
  }
}

@riverpod
FireBaseRepository fireBaseRepository(FireBaseRepositoryRef ref) {
  return FireBaseRepostoryImpl(
      reviewdatasource: ref.watch(fireBaseReviewDataSourceProvider),
      dataSource: ref.watch(fireBaseDataSourceProvider));
}
