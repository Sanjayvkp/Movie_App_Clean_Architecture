import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_application/features/movie_feature2/data/datasources/firebase_datasource.dart';
import 'package:movie_application/features/movie_feature2/data/models/firestore_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_datasource_impl.g.dart';

class FirebaseDataSourceImpl implements FireBaseDataSource {
  final collection = FirebaseFirestore.instance.collection('watchlist');
  @override
  Future<void> addtoFireStore(FireStoreModel model) async {
    await collection.doc(model.id.toString()).set(model.toFirestore());
  }
  
  @override
  Future<void> getFromFireStore(FireStoreModel model) async{
    
  }
}

@riverpod
FireBaseDataSource fireBaseDataSource(FireBaseDataSourceRef ref) {
  return FirebaseDataSourceImpl();
}
