import 'package:producto_c_node/domain/models/addProduct/postProduct.model.dart';
import 'package:producto_c_node/domain/models/getProduct/repository/postProductGeteway.dart';

class PostProductUseCase {
  final PostProductGeteway _postProductGeteway;
  // //contrcutor donde pida la entreda de
  PostProductUseCase(this._postProductGeteway);
  Future<PostProducts> postProduct(body) {
    return _postProductGeteway.postProduct(body);
  }
}
