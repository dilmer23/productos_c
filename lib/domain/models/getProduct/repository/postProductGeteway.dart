import 'package:producto_c_node/domain/models/addProduct/postProduct.model.dart';

abstract class PostProductGeteway {
  Future<PostProducts> postProduct(body);
}
