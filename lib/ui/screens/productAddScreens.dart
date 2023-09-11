// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:producto_c_node/app/const/constants.dart';
import 'package:producto_c_node/app/providers/addProductProvider.dart';
import 'package:producto_c_node/app/providers/postProductProvider.dart';
import 'package:producto_c_node/domain/models/addProduct/postProduct.model.dart';
import 'package:producto_c_node/ui/common/alert.dart' as Alert;
import 'package:producto_c_node/ui/common/alert.dart';
import 'package:producto_c_node/ui/common/camara.dart';
import 'package:producto_c_node/ui/common/imagenAssets.dart';
import 'package:producto_c_node/ui/common/textFromFielProduct.dart';
import 'package:producto_c_node/ui/screens/productScreens.dart';
import 'package:provider/provider.dart';
// import 'package:camera/camera.dart';
// import 'package:camera/camera.dart';

class ProductAdd extends StatelessWidget {
  final dynamic product;

  const ProductAdd({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    final TextEditingController name = TextEditingController();
    final TextEditingController description = TextEditingController();
    final TextEditingController price = TextEditingController();
    final TextEditingController categoriId = TextEditingController();
    final providerAddProduct =
        Provider.of<PostProductProvider>(context, listen: false);
    final providerProduct =
        Provider.of<AddProductProvider>(context, listen: false);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("product"),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: size.height * .2),
              padding: EdgeInsets.only(
                top: size.height * 0.06,
                left: Constantes.kDefaultPaddin,
                right: Constantes.kDefaultPaddin,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  Alert.AlertsTemplate.alertCustom('error', (onPressed) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProductScreens()),
                    );
                  },
                      context: context,
                      onWillPopActive: true,
                      colors: const Color.fromRGBO(0, 179, 134, 1.0),
                      borderRadius: BorderRadius.circular(0.0),
                      title: "prueba",
                      desc: "prueba prueba",
                      content: const Text(
                        "OK",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("take photo"),
                        SizedBox(width: 20.0),
                        Icon(
                          Icons.camera_alt,
                          size: 60.0,
                        ),
                      ],
                    ),
                    TextFromFielProduct(
                      maxLength: 30,
                      icon: const Icon(Icons.production_quantity_limits),
                      labelText: "name",
                      controller: name,
                      textInputType: TextInputType.name,
                      inputFormatters:
                          FilteringTextInputFormatter.singleLineFormatter,
                      provider: providerProduct.setName,
                    ),
                    TextFromFielProduct(
                      maxLength: 200,
                      icon: const Icon(Icons.description),
                      labelText: "description",
                      controller: description,
                      textInputType: TextInputType.multiline,
                      inputFormatters:
                          FilteringTextInputFormatter.singleLineFormatter,
                      provider: providerProduct.setDescription,
                    ),
                    TextFromFielProduct(
                      maxLength: 6,
                      icon: const Icon(Icons.attach_money_rounded),
                      labelText: "price",
                      controller: price,
                      textInputType: TextInputType.number,
                      inputFormatters: FilteringTextInputFormatter.digitsOnly,
                      provider: providerProduct.setPrice,
                    ),
                    TextFromFielProduct(
                      maxLength: 2,
                      icon: const Icon(Icons.category),
                      labelText: "categoryId",
                      controller: categoriId,
                      textInputType: TextInputType.number,
                      inputFormatters: FilteringTextInputFormatter.digitsOnly,
                      provider: providerProduct.setCategoriId,
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          textStyle: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      onPressed: () async {
                        if (name.text.isEmpty &&
                            description.text.isEmpty &&
                            price.text.isEmpty &&
                            categoriId.text.isEmpty) {
                          Alert.AlertsTemplate.alertCustom('error',
                              (onPressed) {
                              Navigator.pop(context);
                          },
                              context: context,
                              onWillPopActive: true,
                              colors: const Color.fromRGBO(0, 179, 134, 1.0),
                              borderRadius: BorderRadius.circular(0.0),
                              title: "Has empty fields",
                              desc: "Empty fields, please validate",
                              content: const Text(
                                "OK",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ));
                        } else {
                          Map<String, dynamic> body = {
                            'name': providerProduct.name,
                            'image':
                                "https://www.philips.es/c-dam/b2c/de_DE/experience/producttester/ablauf-produkttest-s-schritt1.png",
                            'description': providerProduct.description,
                            'price': providerProduct.price.toString(),
                            'categoryId': providerProduct.categoryId
                          };
                          var rta = jsonEncode(body);
                          var data = await providerAddProduct.postProductUseCase
                              .postProduct(rta);
                          if (data.id > 0) {
                            Alert.AlertsTemplate.alertCustom('success',
                                context: context,
                                onWillPopActive: true,
                                colors: const Color.fromRGBO(0, 179, 134, 1.0),
                                borderRadius: BorderRadius.circular(0.0),
                                title: "successfully created",
                                desc: "Product created successfully.",
                                (onPressed) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ProductScreens()),
                              );
                            },
                                content: const Text("OK",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)));
                          } else {
                            Alert.AlertsTemplate.alertCustom('error',
                                context: context,
                                onWillPopActive: false,
                                colors: const Color.fromARGB(255, 255, 7, 7),
                                borderRadius: BorderRadius.circular(0.0),
                                title: "creation failed",
                                desc: "product creation failed", (onPressed) {
                              Navigator.pop(context);
                            },
                                content: const Text("OK",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)));
                          }
                        }
                      },
                      child: const Text("ADD DATA"),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
            ),
            const ProductTitleWithImage()
          ],
        ),
      ),
    );
  }
}
