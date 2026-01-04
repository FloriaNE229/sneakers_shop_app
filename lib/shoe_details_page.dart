import 'package:flutter/material.dart';
import 'shoe.dart';

class ShoeDetailsPage extends StatefulWidget {
  final Shoe shoe;
  const ShoeDetailsPage({super.key, required this.shoe});

  @override
  State<ShoeDetailsPage> createState() => _ShoeDetailsPageState();
}

class _ShoeDetailsPageState extends State<ShoeDetailsPage> {
  bool isFavorite = false;
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    // Gestion de l'icône de favoris
    IconData favoriteIcon = Icons.favorite_border;
    Color favoriteColor = Colors.black54;

    if (isFavorite) {
      favoriteIcon = Icons.favorite;
      favoriteColor = Colors.red;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 450,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF7B6132), Color(0xFFF6E5B3)],
                      stops: [0.5, 0.5],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),

                Positioned(
                  bottom: 100,
                  left: 0,
                  right: 0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "NIKE",
                        style: TextStyle(
                          fontSize: 140,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: -4,
                          height: 0.8,
                        ),
                      ),

                      SizedBox(
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.shoe.model,
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
                  padding: const EdgeInsets.only(bottom: 0, top: 80),
                  child: Transform.rotate(
                    angle: 0.4,
                    child: Image.asset(
                      widget.shoe.image,
                      height: 180,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                // Texte central
                Positioned(
                  bottom: 85,
                  child: Text(
                    "X TRAVIS SCOTT",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 8,
                    ),
                  ),
                ),

                // Les boutons de navigation
                Positioned(
                  top: 50,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Bouton de retour
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.black54,
                            size: 20,
                          ),
                        ),
                      ),

                      // Bouton favoris
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            favoriteIcon,
                            color: favoriteColor,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Section des détails
            Transform.translate(
              offset: const Offset(0, -30),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Le nom de la chaussure et le prix
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.shoe.model,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "LOW RETRO OG",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "\$${widget.shoe.price}",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Price",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Les couleurs
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey.shade200),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: Color(0xFF7B6132),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SizedBox(width: 8),

                              Text(
                                "Colors",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.grey[500],
                                ),
                              ),
                              Icon(Icons.keyboard_arrow_down, size: 16),
                            ],
                          ),
                        ),

                        const SizedBox(width: 12),

                        // Les tailles
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey.shade200),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 5,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.straighten,
                                  color: Colors.grey,
                                  size: 16,
                                ),
                              ),

                              const SizedBox(width: 10),

                              Text(
                                "5Y  5.5Y  6Y  6.5Y",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 35),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedTab = 0;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "Description",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: selectedTab == 0 ? Colors.black : Colors.grey.shade400,
                                ),
                              ),
                              const SizedBox(height: 4),
                              if(selectedTab == 0)
                                Container(width: 50, height: 2, color: Colors.black,)
                            ],
                          )
                        ),

                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedTab = 1;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "Pickup",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: selectedTab == 1 ? Colors.black : Colors.grey.shade400,
                                ),
                              ),
                              const SizedBox(height: 4),
                              if(selectedTab == 1)
                                Container(width: 50, height: 2, color: Colors.black,)
                            ],
                          )
                        ),

                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedTab = 2;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "Details",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: selectedTab == 2 ? Colors.black : Colors.grey.shade400,
                                ),
                              ),
                              const SizedBox(height: 4),
                              if(selectedTab == 2)
                                Container(width: 50, height: 2, color: Colors.black,)
                            ],
                          )
                        ),

                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedTab = 3;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "Reviews",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: selectedTab == 3 ? Colors.black : Colors.grey.shade400,
                                ),
                              ),
                              const SizedBox(height: 4),
                              if(selectedTab == 3)
                                Container(width: 50, height: 2, color: Colors.black,)
                            ],
                          )
                        ),
                      ],
                    ),

                    const SizedBox(height: 35),

                    Text(
                      "Every Jordan Retro is a classic sneaker done up in new colors and textures for a fresh look. With smooth leather, this iteration gives little feet standout style",
                      style: TextStyle(color: Colors.grey, height: 1.5),
                    ),

                    const SizedBox(height: 40),

                    // Bouton Panier
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 120,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFFF6E5B3),
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: Center(
                              child: Text(
                                "Start",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                "Place To Bag",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ], 
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
