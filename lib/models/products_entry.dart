// To parse this JSON data, do
//
//     final productsEntry = productsEntryFromJson(jsonString);

import 'dart:convert';

ProductsEntry productsEntryFromJson(String str) => ProductsEntry.fromJson(json.decode(str));

String productsEntryToJson(ProductsEntry data) => json.encode(data.toJson());

class ProductsEntry {
    String pk;
    String model;
    Fields fields;

    ProductsEntry({
        required this.pk,
        required this.model,
        required this.fields,
    });

    factory ProductsEntry.fromJson(Map<String, dynamic> json) => ProductsEntry(
        pk: json["pk"],
        model: json["model"],
        fields: Fields.fromJson(json["fields"]),
    );

  String get username => fields.username;

    Map<String, dynamic> toJson() => {
        "pk": pk,
        "model": model,
        "fields": fields.toJson(),
    };
}

class Fields {
    String name;
    int price;
    String description;
    String category;
    String thumbnail;
    int productViews;
    bool isFeatured;
    int user;
    String username;

    Fields({
        required this.name,
        required this.price,
        required this.description,
        required this.category,
        required this.thumbnail,
        required this.productViews,
        required this.isFeatured,
        required this.user,
        required this.username,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        price: json["price"],
        description: json["description"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        productViews: json["product_views"],
        isFeatured: json["is_featured"],
        user: json["user"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "description": description,
        "category": category,
        "thumbnail": thumbnail,
        "product_views": productViews,
        "is_featured": isFeatured,
        "user": user,
        "username": username,
    };
}
