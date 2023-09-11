import 'package:producto_c_node/domain/models/addUser/addUser.model.dart';
import 'package:producto_c_node/domain/models/addUser/geteway/addUserGeteway.dart';

class AddUserUseCase {
  final AddUserGeteway _addUserGeteway;
  // //contrcutor donde pida la entreda de
  AddUserUseCase(this._addUserGeteway);
  Future<List<AddUser>> getAddUser() {
    return _addUserGeteway.getAddUser();
  }
}
