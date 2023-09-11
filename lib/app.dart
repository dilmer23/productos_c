import 'package:flutter/material.dart';
import 'package:producto_c_node/app/providers/addProductProvider.dart';
import 'package:producto_c_node/app/providers/addUserProvider.dart';
import 'package:producto_c_node/app/providers/postProductProvider.dart';
import 'package:producto_c_node/data/api/product/getProductApi.dart';
import 'package:producto_c_node/data/api/product/postProductApi.dart';
import 'package:producto_c_node/data/api/user/addUserApi.dart';
import 'package:producto_c_node/domain/useCase/addProduct/addProductUseCase.dart';
import 'package:producto_c_node/domain/useCase/addProduct/postProductUseCase.dart';
import 'package:producto_c_node/domain/useCase/addUser/addUserUseCase.dart';
import 'package:producto_c_node/ui/screens/productScreens.dart';
import 'package:provider/provider.dart';

class AppProductos extends StatelessWidget {
  const AppProductos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // CREAR el caso de uso de productos
        ChangeNotifierProvider(
            create: ((context) =>
                AddUserProvider(addUserUseCase: AddUserUseCase(AddUserApi())))),
        // CREAR el caso de uso de productos
        ChangeNotifierProvider(
            create: ((context) => AddProductProvider(
                addProductUseCase: AddProductUseCase(AddProductApi())))),
        // CREAR el caso de uso de productos
        ChangeNotifierProvider(
            create: ((context) => PostProductProvider(
                postProductUseCase: PostProductUseCase(PostProductApi())))),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProductScreens(),
      ),
    );
  }
}
