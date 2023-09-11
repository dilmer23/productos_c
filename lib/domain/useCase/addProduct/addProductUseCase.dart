import 'package:producto_c_node/domain/models/addProduct/addProduct.model.dart';
import 'package:producto_c_node/domain/models/addProduct/geteway/addProductGeteway.dart';

class AddProductUseCase {
  final AddProductGeteway _addProductGeteway;
  // //contrcutor donde pida la entreda de
  AddProductUseCase(this._addProductGeteway);
  Future<List<AddProduct>> getAddProduct() {
    return _addProductGeteway.getAddProduct();
  }
}
