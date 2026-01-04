import 'package:flutter/material.dart';

// Crée une forme diagonale pour découper les widgets
class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * .45);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// Barre de navigation inférieure avec 4 icônes
class BottomNavBar extends StatelessWidget {
  final int view;
  final int cartLength;
  final Function(int) onViewChange;
  final VoidCallback onSearchTap;

  const BottomNavBar({
    super.key,
    required this.view,
    required this.cartLength,
    required this.onViewChange,
    required this.onSearchTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF2D58C),
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Icône Accueil
          IconButton(
            icon: Icon(
              Icons.home,
              color: view == 0 ? Colors.black : Colors.black54,
              size: 28,
            ),
            onPressed: () => onViewChange(0),
          ),
          // Icône Recherche
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black54,
              size: 28,
            ),
            onPressed: onSearchTap,
          ),
          // Icône Favoris
          IconButton(
            icon: Icon(
              Icons.favorite_border,
              color: Colors.black54,
              size: 28,
            ),
            onPressed: () {},
          ),
          // Icône Panier avec badge du nombre d'articles
          Stack(
            children: [
              IconButton(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  color: view == 2 ? Colors.black : Colors.black54,
                  size: 28,
                ),
                onPressed: () => onViewChange(2),
              ),
              if (cartLength > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 18,
                      minHeight: 18,
                    ),
                    child: Center(
                      child: Text(
                        cartLength.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
            ],
          )
        ],
      ),
    );
  }
}