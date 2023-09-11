// To parse this JSON data, do
//
//     final addProducts = addProductsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PostProducts addProductsFromJson(String str) => PostProducts.fromJson(json.decode(str));

String addProductsToJson(PostProducts data) => json.encode(data.toJson());

class PostProducts {
    DateTime createdAt;
    int id;
    String name;
    String image;
    String description;
    int price;
    int categoryId;

    PostProducts({
        required this.createdAt,
        required this.id,
        required this.name,
        required this.image,
        required this.description,
        required this.price,
        required this.categoryId,
    });

    factory PostProducts.fromJson(Map<String, dynamic> json) => PostProducts(
        createdAt: DateTime.parse(json["createdAt"]),
        id: json["id"],
        name: json["name"],
        image: json["image"],
        description: json["description"],
        price: json["price"],
        categoryId: json["categoryId"],
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "id": id,
        "name": name,
        "image": image,
        "description": description,
        "price": price,
        "categoryId": categoryId,
    };
}
