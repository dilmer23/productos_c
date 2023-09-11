import 'package:producto_c_node/domain/models/addProduct/addProduct.model.dart';

abstract class AddProductGeteway {
  Future<List<AddProduct>> getAddProduct();
}
