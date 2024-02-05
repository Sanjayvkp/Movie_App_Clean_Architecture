import 'package:movie_application/features/movie_feature2/data/models/popular_objectbox_entity.dart';
import 'package:movie_application/objectbox.g.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:movie_application/features/movie_feature2/data/models/toprated_objectbox_entity.dart';

class PopularObjectBox {
  static PopularObjectBox? _instance;

  final Store store;
  late final Box<PopularEntity> box;

  PopularObjectBox._create(this.store) {
    box = store.box<PopularEntity>();
  }

  static PopularObjectBox get instance {
    return _instance!;
  }

  static Future<void> createMethod() async {
    if (_instance == null) {
      final docDir = await getApplicationDocumentsDirectory();
      final store = await openStore(directory: join(docDir.path, 'MovieFliqthree'));
      _instance = PopularObjectBox._create(store);
    }
  }
}
