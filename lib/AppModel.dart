import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class AppModel extends Model {
final storage = new FlutterSecureStorage();

String name = '';

void setName(String string) async {
  name = string;
  notifyListeners();
}

}