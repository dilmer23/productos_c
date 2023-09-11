import 'dart:convert';
import 'dart:developer';
import 'package:producto_c_node/app/const/constants.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:producto_c_node/domain/models/addProduct/postProduct.model.dart';
import 'package:producto_c_node/domain/models/getProduct/repository/postProductGeteway.dart';

class PostProductApi extends PostProductGeteway {
  @override
  Future<PostProducts> postProduct(body) async {
    log(body);
    Uri url = Uri.parse("${Constantes.apiRoute}/api/v1/products");
    final response =
        await http.post(url, headers: Constantes.header, body: body);
    if (response.statusCode >= 200 && response.statusCode <= 202) {
      final product = addProductsFromJson(response.body);
      final productosDetalle = product;
      return productosDetalle;
    } else {
      throw "error product";
    }
  }
}
