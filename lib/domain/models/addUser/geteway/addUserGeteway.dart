import 'package:producto_c_node/domain/models/addUser/addUser.model.dart';

abstract class AddUserGeteway {
  Future<List<AddUser>> getAddUser();
}
