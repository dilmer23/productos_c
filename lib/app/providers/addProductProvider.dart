import 'package:flutter/material.dart';
import 'package:producto_c_node/domain/useCase/addProduct/addProductUseCase.dart';

class AddProductProvider extends ChangeNotifier {
  final AddProductUseCase addProductUseCase;
  String _name = "";
  String _description = "";
  int _price = 0;
  dynamic _categoryId;
  String get name => _name;
  String get description => _description;
  int get price => _price;
  int get categoryId => _categoryId;

  AddProductProvider({required this.addProductUseCase});

  void setName(String results) {
    _name = results;
    notifyListeners();
  }

  void setDescription(String results) {
    _description = results;
    notifyListeners();
  }

  void setPrice(int results) {
    _price = results;
    notifyListeners();
  }

  void setCategoriId(int results) {
    _categoryId = results;
    notifyListeners();
  }
}
