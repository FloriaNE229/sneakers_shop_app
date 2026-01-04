import 'package:flutter/material.dart';
import 'package:sneakers_shop_app/shoe_details_page.dart';
import 'shoe.dart';

class CategoryPage extends StatelessWidget {
  final String category;
  const CategoryPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    // Filtrage par catégorie de chaussure
    // Création d'une liste vide qui va accueillir les chaussures sélectionnées
    List<Shoe> selectedShoes = [];

    // Parcourt de la liste allShoes
    for (var currentShoe in allShoes) {
      // Si la catégorie de la chaussure correspond à celle demandée
      if (currentShoe.category == category) {
        // Alors on l'ajoute dans la liste selectedShoes
        selectedShoes.add(currentShoe);
      }
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          category.toUpperCase(),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        // Bouton de retour
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: GridView.count(
        padding: EdgeInsets.all(20),
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 0.9,

        children: [for (var shoe in selectedShoes) ShoeCard(shoe: shoe)],
      ),
    );
  }
}

class ShoeCard extends StatefulWidget {
  final Shoe shoe;
  const ShoeCard({super.key, required this.shoe});

  @override
  State<ShoeCard> createState() => _ShoeCardState();
}

class _ShoeCardState extends State<ShoeCard> {
  bool showInfo = false;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    // Gestion de l'opacité
    double opacityValue = 0.0;
    if (showInfo) {
      opacityValue = 1.0;
    }

    // Gestion de l'icône de favoris
    IconData favoriteIcon = Icons.favorite_border;
    Color favoriteColor = Colors.white;

    if (isFavorite) {
      favoriteIcon = Icons.favorite;
      favoriteColor = Colors.red;
    }

    return TapRegion(
      onTapOutside: (event) {
        setState(() {
          showInfo = false;
        });
      },

      child: GestureDetector(
        onTap: () {
          setState(() {
            showInfo = !showInfo;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              image: AssetImage(widget.shoe.image),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedOpacity(
                  opacity: opacityValue,
                  duration: const Duration(milliseconds: 300),
                  child: FractionallySizedBox(
                    heightFactor: 0.45,
                    widthFactor: 1.0,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        color: Colors.black.withOpacity(0.75),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.shoe.model,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),

                          const SizedBox(height: 4),

                          Text(
                            "\$${widget.shoe.price}",
                            style: const TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),

                          const Divider(color: Colors.white24),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ShoeDetailsPage(shoe: widget.shoe),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                      size: 10,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Voir détails",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isFavorite = !isFavorite;
                                  });
                                },
                                child: Icon(
                                  favoriteIcon,
                                  color: favoriteColor,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
