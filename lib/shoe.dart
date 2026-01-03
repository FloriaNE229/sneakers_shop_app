import 'package:flutter/material.dart';

// Classe pour afficher la liste des chaussures
// Propriétés d'une chaussure
class Shoe {
  String model; // Le modèle de la chaussure
  double price; // Le prix de la chaussure
  String image; // L'image de la chaussure
  String category; // La catégorie de la chaussure

  // Création d'une instance de la classe
  Shoe({
    required this.model,
    required this.price,
    required this.image,
    required this.category,
  });
}

// La liste des chaussures
List<Shoe> allShoes = [
  Shoe(model: "AIR FORCE 1", price: 120.00, image: './images/nike_air.png', category: "Sneakers"),
  Shoe(model: "LEBRON 21", price: 120.00, image: './images/basket_nike_air.png', category: "Basketball"),
  Shoe(model: "METCON 9", price: 120.00, image: './images/gym_nike_air2.png', category: "Gym Shoes"),
  Shoe(model: "PEGASUS 40", price: 120.00, image: './images/Run_nike_air.png', category: "Running"),
  Shoe(model: "AIR FORCE 1", price: 120.00, image: './images/nike_jordan.png', category: "Sneakers"),
  Shoe(model: "AIR JORDAN 1", price: 120.00, image: './images/Air_Jordan_1.png', category: "Sneakers"),
  Shoe(model: "AIR JORDAN 4", price: 120.00, image: './images/Air Jordan 4 SB Pine Green.png', category: "Sneakers"),
  Shoe(model: "AIR JORDAN 1", price: 120.00, image: './images/AIR_JORDAN_1_MID_SE_WMNS.png', category: "Sneakers"),
  Shoe(model: "AIR JORDAN 1", price: 120.00, image: './images/Jordan 1 Mid ‘Midnight Navy_Football Grey’ _ Color_ Blue_White.png', category: "Sneakers"),
  Shoe(model: "AIR JORDAN 4", price: 120.00, image: './images/Jordan 4 Retro ‘Military Black’ _ Color_ Black _ Size_ Various.png', category: "Sneakers"),
  Shoe(model: "AIR JORDAN 4", price: 120.00, image: './images/Jordan Off-White 4 Sneakers _ Color_ Cream _ Size.png', category: "Sneakers"),
  Shoe(model: "AIR JORDAN 4", price: 120.00, image: './images/Nike Air Jordan 4 Retro Military Black.png', category: "Sneakers"),
  Shoe(model: "AIR JORDAN 1", price: 120.00, image: './images/Air Jordan Ones.png', category: "Sneakers"),
  Shoe(model: "AIR FORCE 1", price: 120.00, image: './images/Air Force 1.png', category: "Sneakers"),
  Shoe(model: "LEBRON 21", price: 120.00, image: './images/Basketball Shoes.png', category: "Basketball"),
  Shoe(model: "AIR JORDAN 1", price: 120.00, image: './images/Jordan Air 1 Special.png', category: "Sneakers"),
  Shoe(model: "AIR FORCE 1", price: 120.00, image: './images/Green Color Block Custom Air Force.png', category: "Sneakers"),
  Shoe(model: "AIR FORCE 1", price: 120.00, image: './images/Nike Air Force 1.png', category: "Sneakers"),
  Shoe(model: "LEBRON 21", price: 120.00, image: './images/Nike Basketball Shoes SportChek.png', category: "Basketball"),
  Shoe(model: "LEBRON 21", price: 120.00, image: './images/Sabrina 3 _Blueprint Basketball Shoes.png', category: "Basketball"),
  Shoe(model: "PEGASUS 40", price: 120.00, image: './images/Nike Running Shoes.png', category: "Running"),
  Shoe(model: "PEGASUS 40", price: 120.00, image: './images/NIKE V2K RUN.png', category: "Running"),
  Shoe(model: "PEGASUS 40", price: 120.00, image: './images/Nike Sportswear Womens V2K Run.png', category: "Running"),
  Shoe(model: "METCON 9", price: 120.00, image: './images/Nike V5 RNR Sneaker.png', category: "Gym Shoes"),
  Shoe(model: "METCON 9", price: 120.00, image: './images/Nike Initiator.png', category: "Gym Shoes"),
  Shoe(model: "METCON 9", price: 120.00, image: './images/Nike V5 RNR Shoes.png', category: "Gym Shoes"),
];

