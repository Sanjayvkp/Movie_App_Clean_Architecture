import 'package:movie_application/features/movie_feature2/data/datasources/firebase_datasource.dart';
import 'package:movie_application/features/movie_feature2/data/datasources/firebase_datasource_impl.dart';
import 'package:movie_application/features/movie_feature2/data/models/firestore_model.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/movie_entity.dart';
import 'package:movie_application/features/movie_feature2/domain/repository/firebase_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_repository_impl.g.dart';

class FireBaseRepostoryImpl implements FireBaseRepository {
  final FireBaseDataSource dataSource;
  FireBaseRepostoryImpl({required this.dataSource});
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
}

@riverpod
FireBaseRepository fireBaseRepository(FireBaseRepositoryRef ref) {
  return FireBaseRepostoryImpl(
      dataSource: ref.watch(fireBaseDataSourceProvider));
}
