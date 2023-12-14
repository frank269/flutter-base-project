import '../data.dart';
import 'package:objectbox/objectbox.dart';

class UserRepository {
  UserRepository({required this.store});
  final Store store;

  addUser(User user) {
    store.box<User>().put(user);
  }

  getAllUser() {
    return store.box<User>().getAll();
  }
}
