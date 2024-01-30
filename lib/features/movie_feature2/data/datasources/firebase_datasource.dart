import 'package:movie_application/features/movie_feature2/data/models/firestore_model.dart';

abstract class FireBaseDataSource {
  Future<void> addtoFireStore(FireStoreModel model);
  Future<void> getFromFireStore(FireStoreModel model);
}
