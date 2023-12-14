import '../../objectbox.g.dart'; // generated by run `flutter pub run build_runner build`
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

class Database {
  late final Store _store;

  Database._create(this._store) {
    if (Admin.isAvailable()) {
      Admin(_store);
    }
  }

  static Future<Database> initialize() async {
    await loadObjectBoxLibraryAndroidCompat();
    final store = await openStore(
        directory: p.join(
            (await getApplicationDocumentsDirectory()).path, "objectbox"));
    return Database._create(store);
  }
}
