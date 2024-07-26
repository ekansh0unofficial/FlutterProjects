import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';

class Product {
  String name;
  String description;
  double price;
  String imageUrl;

  Product(
      {required this.name,
      required this.description,
      required this.price,
      required this.imageUrl});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
    };
  }
}
