import 'package:flutter/material.dart';

// Modèle pour un produit
class Product {
  final String name;
  final int price;
  final String category;
  final String subtitle;
  final String description;
  final String image;
  final List<String> sizes;
  final List<Color> colors;

  Product({
    required this.name,
    required this.price,
    required this.category,
    required this.subtitle,
    required this.description,
    required this.image,
    required this.sizes,
    required this.colors,
  });
}

// Modèle pour un article dans le panier
class CartItem {
  final Product product;
  int qty;
  final String size;
  final Color color;

  CartItem(this.product, this.qty, this.size, this.color);
}