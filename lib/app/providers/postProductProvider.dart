import 'package:flutter/cupertino.dart';
import 'package:producto_c_node/domain/useCase/addProduct/postProductUseCase.dart';


class PostProductProvider extends ChangeNotifier {
  final PostProductUseCase postProductUseCase;
  PostProductProvider({required this.postProductUseCase});
}