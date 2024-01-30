import 'package:movie_application/features/movie_feature2/domain/entities/movie_entity.dart';

abstract class FireBaseRepository{
   Future<void> addtoFireStore(MovieEntity entity);
}