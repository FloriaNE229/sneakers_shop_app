import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool estEnTrainDeChercher = false;
  int selectedIndex = 0; // Onglet actif de la barre de navigation
  @override
  Widget build(BuildContext context) {
    // Rendre dynamique le bouton de recherche
    Widget searchButton = GestureDetector(
      onTap: () {
        setState(() {
          estEnTrainDeChercher = true;
        });
      },

      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 1,
              offset: Offset(0, 5),
            ),
          ],
        ),

        child: const Icon(Icons.search, color: Colors.black, size: 28),
      ),
    );

    // Barre de Recherche
    Widget searchField = Expanded(
      child: TextField(
        autofocus: true,
        decoration: InputDecoration(
          hintText: "Search a sneaker...",
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              setState(() {
                estEnTrainDeChercher = false;
              });
            },
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      // La barre de navigation
      bottomNavigationBar: Container(
        height: 85,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
			buildNavItem(Icons.home_filled, 0),
			buildNavItem(Icons.search, 1),
			buildNavItem(Icons.favorite_border, 2),
			buildNavItem(Icons.person_outline, 3),
		  ],
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // L'entête
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // La photo de profil
                    const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('./images/profile.png'),
                    ),

                    // L'icône de recherche
                    if (estEnTrainDeChercher == true)
                      searchField
                    else
                      searchButton,
                  ],
                ),

                const SizedBox(height: 30),

                RichText(
                  text: TextSpan(
                    text: 'Experience',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.normal,
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                        text: " the Ultimate Shopping With Nike!",
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // La ligne des catégories
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      categoryItem("Sneakers", isSelected: true),
                      categoryItem("Basketball"),
                      categoryItem("Gym Shoes"),
                      categoryItem("Running"),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Style Meet Comfort",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    Column(
                      children: [
                        Text(
                          "View All",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        // Le trait de soulignement sous View All
                        Container(
                          height: 2,
                          width: 30,
                          color: Colors.grey[500],
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                Text(
                  "Nike sneakers offer ultimate comfort.",
                  style: TextStyle(color: Colors.grey[500], fontSize: 14),
                ),

                const SizedBox(height: 20),

                Stack(
                  alignment: Alignment.center,
                  // Ajout de l'effet de cartes empilés
                  clipBehavior: Clip.none,
                  children: [
                    // La carte la plus petite
                    Positioned(
                      right: -10,
                      top: 10,
                      child: Container(
                        height: 230,
                        width: 300,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF6E5B3).withOpacity(0.4),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),

                    // La carte intermédiaire
                    Positioned(
                      right: -5,
                      top: 5,
                      child: Container(
                        height: 240,
                        width: 350,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF6E5B3).withOpacity(0.7),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),

                    // La carte principale
                    Container(
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF7B6132), Color(0xFFF6E5B3)],
                          stops: [0.5, 0.5],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),

                    // Le bloc NIKE et les sous-titres
                    Positioned(
                      bottom: 30,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "NIKE",
                            style: TextStyle(
                              fontSize: 120,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: -4,
                              height: 0.9,
                            ),
                          ),

                          SizedBox(
                            width: 260,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "AIR JORDAN 1",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 8,
                                  ),
                                ),

                                Text(
                                  "LOW RETRO OG",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // L'image de la chaussure
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Image.asset('./images/nike_air.png', height: 180),
                    ),

                    // Texte central
                    Positioned(
                      bottom: 40,
                      child: Text(
                        "X TRAVIS SCOTT",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 8,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget pour les catégories de chaussures
  Widget categoryItem(String name, {bool isSelected = false}) {
    // Définition des couleurs par défaut
    Color backgroundColor = Color(0xFFF1F3F4);
    Color textColor = Colors.grey[900]!;
    Color borderColor = Colors.grey[200]!;
    FontWeight textWeight = FontWeight.w500;

    // Lors d'une sélection, on change les couleurs
    if (isSelected == true) {
      backgroundColor = const Color(0xFFF6E5B3);
      textColor = Colors.black;
      borderColor = Colors.grey[200]!;
      textWeight = FontWeight.bold;
    }
    return Container(
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: borderColor, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        name,
        style: TextStyle(fontWeight: textWeight, color: textColor),
      ),
    );
  }

  // Widget pour construire les boutons de la barre de navigation
  Widget buildNavItem(IconData icon, int index) {
    // Définition des couleurs par défaut
    Color backgroundColor = Colors.white;
    Color iconColor = Colors.grey[400]!;

    // Changement des couleurs si l'index est sélectionné
    if (selectedIndex == index) {
      backgroundColor = const Color(0xFFF6E5B3);
      iconColor = Colors.black;
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),

        child: Icon(icon, size: 26, color: iconColor),
      ),
    );
  }
}
