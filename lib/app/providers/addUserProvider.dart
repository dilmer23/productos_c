import 'package:flutter/cupertino.dart';
import 'package:producto_c_node/domain/useCase/addUser/addUserUseCase.dart';

class AddUserProvider extends ChangeNotifier {
  final AddUserUseCase addUserUseCase;
  AddUserProvider({required this.addUserUseCase});
}