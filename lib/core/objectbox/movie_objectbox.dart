import 'package:movie_application/features/movie_feature2/data/models/objectbox_entity_model.dart';
import 'package:movie_application/objectbox.g.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class MovieStoreObjectBox {
  static MovieStoreObjectBox? _instance;

  final Store store;
  late final Box<ObjectBoxMovieEntity> box;

  MovieStoreObjectBox._create(this.store) {
    box = store.box<ObjectBoxMovieEntity>();
  }

  static MovieStoreObjectBox get instance {
    return _instance!;
  }

  static Future<void> createMethod() async {
    if (_instance == null) {
      final docDir = await getApplicationDocumentsDirectory();
      final store = await openStore(directory: join(docDir.path, 'MovieFliq'));
      _instance = MovieStoreObjectBox._create(store);
    }
  }
}
