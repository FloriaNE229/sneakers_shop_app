import 'package:flutter/material.dart';

// Classe pour afficher la liste des chaussures
// Propriétés d'une chaussure
class Shoe {
  String model; // Le modèle de la chaussure
  double price; // Le prix de la chaussure
  String image; // L'image de la chaussure
  String category;
  Color shoeColor; // La catégorie de la chaussure

  // Création d'une instance de la classe
  Shoe({
    required this.model,
    required this.price,
    required this.image,
    required this.category,
    required this.shoeColor,
  });
}

// La liste des chaussures
List<Shoe> allShoes = [
  Shoe(
    model: "AIR FORCE 1",
    price: 120.00,
    image: './images/nike_air.png',
    category: "Sneakers",
    shoeColor: Colors.brown,
  ),
  Shoe(
    model: "LEBRON 21",
    price: 120.00,
    image: './images/basket_nike_air.png',
    category: "Basketball",
    shoeColor: Color(0xFFF6E5B3),
  ),
  Shoe(
    model: "METCON 9",
    price: 120.00,
    image: './images/gym_nike_air2.png',
    category: "Gym Shoes",
    shoeColor: Colors.amberAccent,
  ),
  Shoe(
    model: "PEGASUS 40",
    price: 120.00,
    image: './images/Run_nike_air.png',
    category: "Running",
    shoeColor: Color(0xFFF6E5B3),
  ),
  Shoe(
    model: "AIR FORCE 1",
    price: 120.00,
    image: './images/nike_jordan.png',
    category: "Sneakers",
    shoeColor: Color(0xFFF6E5B3),
  ),
  Shoe(
    model: "AIR JORDAN 1",
    price: 120.00,
    image: './images/Air_Jordan_1.png',
    category: "Sneakers",
    shoeColor: Colors.brown,
  ),
  Shoe(
    model: "AIR JORDAN 4",
    price: 120.00,
    image: './images/Air Jordan 4 SB Pine Green.png',
    category: "Sneakers",
    shoeColor: Colors.white,
  ),
  Shoe(
    model: "AIR JORDAN 1",
    price: 120.00,
    image:
        './images/Jordan 1 Mid ‘Midnight Navy_Football Grey’ _ Color_ Blue_White.png',
    category: "Sneakers",
    shoeColor: Colors.lightBlue,
  ),
  Shoe(
    model: "AIR JORDAN 4",
    price: 120.00,
    image: './images/Jordan Off-White 4 Sneakers _ Color_ Cream _ Size.png',
    category: "Sneakers",
    shoeColor: Color(0xFFF6E5B3),
  ),
  Shoe(
    model: "AIR JORDAN 4",
    price: 120.00,
    image: './images/Nike Air Jordan 4 Retro Military Black.png',
    category: "Sneakers",
    shoeColor: Colors.white10,
  ),
  Shoe(
    model: "AIR FORCE 1",
    price: 120.00,
    image: './images/Air Force 1.png',
    category: "Sneakers",
    shoeColor: Colors.blue,
  ),
  Shoe(
    model: "LEBRON 21",
    price: 120.00,
    image: './images/Basketball Shoes.png',
    category: "Basketball",
    shoeColor: Colors.black12,
  ),
  Shoe(
    model: "AIR JORDAN 1",
    price: 120.00,
    image: './images/Jordan Air 1 Special.png',
    category: "Sneakers",
    shoeColor: Colors.lightGreen,
  ),
  Shoe(
    model: "AIR FORCE 1",
    price: 120.00,
    image: './images/Green Color Block Custom Air Force.png',
    category: "Sneakers",
    shoeColor: Colors.green,
  ),
  Shoe(
    model: "AIR FORCE 1",
    price: 120.00,
    image: './images/Nike Air Force 1.png',
    category: "Sneakers",
    shoeColor: Colors.white,
  ),
  Shoe(
    model: "LEBRON 21",
    price: 120.00,
    image: './images/Nike Basketball Shoes SportChek.png',
    category: "Basketball",
    shoeColor: Colors.blueGrey,
  ),
  Shoe(
    model: "LEBRON 21",
    price: 120.00,
    image: './images/Sabrina 3 _Blueprint Basketball Shoes.png',
    category: "Basketball",
    shoeColor: Colors.lightBlue,
  ),
  Shoe(
    model: "PEGASUS 40",
    price: 120.00,
    image: './images/Nike Running Shoes.png',
    category: "Running",
    shoeColor: Colors.greenAccent,
  ),
  Shoe(
    model: "PEGASUS 40",
    price: 120.00,
    image: './images/NIKE V2K RUN.png',
    category: "Running",
    shoeColor: Colors.white,
  ),
  Shoe(
    model: "PEGASUS 40",
    price: 120.00,
    image: './images/Nike Sportswear Womens V2K Run.png',
    category: "Running",
    shoeColor: Colors.purpleAccent,
  ),
  Shoe(
    model: "METCON 9",
    price: 120.00,
    image: './images/Nike V5 RNR Sneaker.png',
    category: "Gym Shoes",
    shoeColor: Colors.white,
  ),
  Shoe(
    model: "METCON 9",
    price: 120.00,
    image: './images/Nike Initiator.png',
    category: "Gym Shoes",
    shoeColor: Colors.white12,
  ),
  Shoe(
    model: "METCON 9",
    price: 120.00,
    image: './images/Nike V5 RNR Shoes.png',
    category: "Gym Shoes",
    shoeColor: Color(0xFFF6E5B3),
  ),
];

// Ajout de la classe pour les chaussures ajoutés au panier
class CartItem {
  Shoe shoe; // La chaussure choisie
  int quantity; // La quantité

  CartItem({required this.shoe, this.quantity = 1});
}

// Liste vide pour stocker les futurs achats
List<CartItem> myCart = [];
