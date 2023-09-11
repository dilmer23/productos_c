import 'dart:convert';

List<AddProducts> addProductsFromJson(String str) => List<AddProducts>.from(json.decode(str).map((x) => AddProducts.fromJson(x)));

String addProductsToJson(List<AddProducts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddProducts {
    int id;
    String name;
    String image;
    String description;
    int price;
    DateTime createdAt;
    int categoryId;
    Category category;

    AddProducts({
        required this.id,
        required this.name,
        required this.image,
        required this.description,
        required this.price,
        required this.createdAt,
        required this.categoryId,
        required this.category,
    });

    factory AddProducts.fromJson(Map<String, dynamic> json) => AddProducts(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        description: json["description"],
        price: json["price"],
        createdAt: DateTime.parse(json["createdAt"]),
        categoryId: json["categoryId"],
        category: Category.fromJson(json["category"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "description": description,
        "price": price,
        "createdAt": createdAt.toIso8601String(),
        "categoryId": categoryId,
        "category": category.toJson(),
    };
}

class Category {
    int id;
    String name;
    String image;
    DateTime createdAt;

    Category({
        required this.id,
        required this.name,
        required this.image,
        required this.createdAt,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "createdAt": createdAt.toIso8601String(),
    };
}
