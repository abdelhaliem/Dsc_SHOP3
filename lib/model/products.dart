import 'package:flutter/material.dart';

class Prodaucts {
  final id;
  final title;
  final price;
  final description;
  final category;
  final imageUrl;

  Prodaucts({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.description,
    @required this.category,
    @required this.imageUrl,
  });

  factory Prodaucts.fromJason(Map<String, dynamic> parsedJson) {
    return Prodaucts(
      id: parsedJson['id'],
      title: parsedJson['title'],
      price: parsedJson['price'],
      description: parsedJson['description'],
      category: parsedJson['category'],
      imageUrl: parsedJson['image'],
    );
  }
}
