import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:producto_c_node/domain/models/addUser/addUser.model.dart';
import 'package:producto_c_node/domain/models/addUser/geteway/addUserGeteway.dart';


class AddUserApi extends AddUserGeteway {
  @override
  Future<List<AddUser>> getAddUser() async {
    Uri url = Uri.parse("https://web-production-0405.up.railway.app/api/v1/users");
    final response = await http.get(url);
    if (response.statusCode >= 200 && response.statusCode <= 202) {
      final users = addUserFromJson(response.body);
      final userDetalle = users;
      return userDetalle;
    } else {
      throw "error user";
    }
  }
}
