import 'package:producto_c_node/domain/models/addProduct/addProduct.model.dart';
import 'package:producto_c_node/domain/models/addProduct/geteway/addProductGeteway.dart';
import 'package:http/http.dart' as http;

class AddProductApi extends AddProductGeteway {
  @override
  Future<List<AddProduct>> getAddProduct() async {
    Uri url = Uri.parse("https://web-production-0405.up.railway.app/api/v1/products");
    final response = await http.get(url);
    if (response.statusCode >= 200 && response.statusCode <= 202) {
      final product = addProductFromJson(response.body);
      final productDetail = product;
      return productDetail;
    } else {
      throw "error product";
    }
  }
}
