import 'package:objectbox/objectbox.dart';

@Entity()
class User {
  @Id()
  int id;
  String name;
  String fullName;
  User(this.name, {this.id = 0, this.fullName = ""});
}
