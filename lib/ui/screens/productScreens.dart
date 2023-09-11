import 'package:flutter/material.dart';
import 'package:producto_c_node/app/const/constants.dart';
import 'package:producto_c_node/app/providers/addProductProvider.dart';
import 'package:producto_c_node/domain/models/addProduct/addProduct.model.dart';
import 'package:producto_c_node/ui/common/categorriesProduct.dart';
import 'package:producto_c_node/ui/common/circularProgressIndicator.dart';
import 'package:producto_c_node/ui/common/itemCardProduct.dart';
import 'package:producto_c_node/ui/screens/detailsScreenProduct.dart';
import 'package:producto_c_node/ui/screens/productAddScreens.dart';
import 'package:provider/provider.dart';
// import 'package:camera/camera.dart';

class ProductScreens extends StatelessWidget {
  const ProductScreens({super.key});

  @override
  Widget build(BuildContext context) {
    // final providerAddUser = Provider.of<AddUserProvider>(context);
    final providerProduct =
        Provider.of<AddProductProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text("Product"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_business_sharp),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductAdd(),
                ),
              );
            },
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Constantes.kDefaultPaddin),
            child: Text(
              "Product",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Categories(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Constantes.kDefaultPaddin),
              child: FutureBuilder<List<AddProduct>>(
                  future: providerProduct.addProductUseCase.getAddProduct(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.manual,
                        itemCount: snapshot.data!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: Constantes.kDefaultPaddin,
                          crossAxisSpacing: Constantes.kDefaultPaddin,
                          childAspectRatio: 0.75,
                        ),
                        itemBuilder: (context, index) => ItemCard(
                          product: snapshot.data![index],
                          press: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DetailsScreen(),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const Center(child: LoaderCustom());
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
