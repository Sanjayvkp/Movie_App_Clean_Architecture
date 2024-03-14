import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_application/core/exception/base_exception.dart';
import 'package:movie_application/core/utils/snackbar_utils.dart';
import 'package:movie_application/features/movie_feature2/data/repository/firebase_repository_impl.dart';
import 'package:movie_application/features/movie_feature2/data/repository/movie_repository_impl.dart';
import 'package:movie_application/features/movie_feature2/data/repository/objectbox_repository_impl.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/movie_entity.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/review_entity.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/trailer_entity.dart';
import 'package:movie_application/features/movie_feature2/domain/usecases/add_review_usecase.dart';
import 'package:movie_application/features/movie_feature2/domain/usecases/delete_review_usecase.dart';
import 'package:movie_application/features/movie_feature2/domain/usecases/firebase_delete_usecase.dart';
import 'package:movie_application/features/movie_feature2/domain/usecases/firebase_get_usecase.dart';
import 'package:movie_application/features/movie_feature2/domain/usecases/firebase_usecase.dart';
import 'package:movie_application/features/movie_feature2/domain/usecases/get_review_usecase.dart';
import 'package:movie_application/features/movie_feature2/domain/usecases/movie_usecase.dart';
import 'package:movie_application/features/movie_feature2/domain/usecases/popular_usecase.dart';
import 'package:movie_application/features/movie_feature2/domain/usecases/search_usecase.dart';
import 'package:movie_application/features/movie_feature2/domain/usecases/toprated_usecase.dart';
import 'package:movie_application/features/movie_feature2/domain/usecases/trailer_usecase.dart';
import 'package:movie_application/features/movie_feature2/presentation/providers/movie_provider_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_provider.g.dart';

@riverpod
class MovieHome extends _$MovieHome {
  late MovieEntity entity;
  final PageController pageController = PageController();
  final TextEditingController reviewController = TextEditingController();
  final TextEditingController searchController = TextEditingController();
  // late MovieRepository repository;

  @override
  Future<MovieProviderState> build() async {
    // repository = ref.watch(movieRepositoryProvider);
    final result = await Future.wait([
      MovieUsecase(
          repository: ref.watch(movieRepositoryProvider),
          localrepo: ref.watch(objectBoxMovieRepositoryProvider))(),
      TopRatedUseCase(
          repository: ref.watch(movieRepositoryProvider),
          localrepo: ref.watch(objectBoxMovieRepositoryProvider))(),
      PopularUseCase(
          repository: ref.watch(movieRepositoryProvider),
          localrepo: ref.watch(objectBoxMovieRepositoryProvider))(),
    ]);
    return MovieProviderState(
      getMovies: result[0],
      getTopRated: result[1],
      getPopular: result[2],
      searchMovies: null,
    );
  }

  Future<void> searchMovies(String text, BuildContext context) async {
    try {
      final repository = ref.watch(movieRepositoryProvider);
      final data = await SearchUsecase(repository: repository)(text);
      state = AsyncValue.data(state.value!.copyWith(searchMovies: data));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> addtoFireStore(MovieEntity entity) {
    final repository = ref.watch(fireBaseRepositoryProvider);
    return FireBaseUseCase(repositorys: repository)(entity);
  }

  Future<void> addReview(ReviewEntity entity, String id) {
    final repository = ref.watch(fireBaseRepositoryProvider);
    return AddReviewUsecase(repositorys: repository)(entity, id);
  }

  Future<void> deleteFromFireBase(String id) {
    final repository = ref.watch(fireBaseRepositoryProvider);
    return FireBaseDeleteUsecase(repositorys: repository)(id);
  }

  Future<void> deleteReview(String id) {
    final repository = ref.watch(fireBaseRepositoryProvider);
    return DeleteReviewUsecase(repositorys: repository)(id);
  }

  Stream<List<MovieEntity>> getallMoviesFromFirestore() {
    final repositorys = ref.watch(fireBaseRepositoryProvider);
    return FireBaseGetUsecase(repositorys: repositorys)();
  }

  Stream<List<ReviewEntity>> getReview(String id) {
    final repository = ref.watch(fireBaseRepositoryProvider);
    return GetReviewUseCase(repositorys: repository)(id);
  }

  Future<List<TrailerEntity>> getTrailer(String id) async {
    final repository = ref.watch(movieRepositoryProvider);
    return TrailerUsecase(repository: repository)(id);
  }
}

final pageProvider = StateProvider((ref) => 0);
