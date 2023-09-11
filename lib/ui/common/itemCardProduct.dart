import 'package:flutter/material.dart';
import 'package:producto_c_node/app/const/constants.dart';
import 'package:producto_c_node/domain/models/addProduct/addProduct.model.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.product, required this.press});

  final AddProduct product;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(Constantes.kDefaultPaddin),
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${product.id}",
                child: Image.network(product.image)
                // Image.asset("assets/img/pr.png"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:Constantes.kDefaultPaddin / 4),
            child: Text(
              // products is out demo list
              product.name,
              style: const TextStyle(color: Constantes.kTextLightColor),
            ),
          ),
          Text(
            "\$${product.price}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}