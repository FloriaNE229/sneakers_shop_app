import 'package:flutter/material.dart';
import 'models.dart';
import 'widgets.dart';

// Vue d'accueil avec liste des produits
class HomeView extends StatelessWidget {
  final String category;
  final String search;
  final List<Product> products;
  final Function(String) onCategoryChange;
  final Function(Product) onProductTap;
  final VoidCallback onSearchOpen;
  final int view;
  final int cartLength;
  final Function(int) onViewChange;

  const HomeView({
    super.key,
    required this.category,
    required this.search,
    required this.products,
    required this.onCategoryChange,
    required this.onProductTap,
    required this.onSearchOpen,
    required this.view,
    required this.cartLength,
    required this.onViewChange,
  });

  @override
  Widget build(BuildContext context) {
    // Filtre les produits par catégorie et recherche
    final filtered = products
        .where((p) =>
            p.category == category &&
            p.name.toLowerCase().contains(search.toLowerCase()))
        .toList();

    return Column(
      children: [
        const SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.person, color: Colors.grey.shade600),
              ),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.search, size: 24),
                  onPressed: onSearchOpen,
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text.rich(
              TextSpan(
                text: "Experience ",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w400,
                  height: 1.3,
                ),
                children: const [
                  TextSpan(
                    text: "the Ultimate\nShoping With Nike!",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        // Catégories scrollables
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: ["Sneakers", "Basketball", "Gym Shoes", "Soccer"]
                .map((c) => Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: GestureDetector(
                        onTap: () => onCategoryChange(c),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          decoration: BoxDecoration(
                            color: category == c
                                ? const Color(0xFFF2D58C)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Text(
                            c,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: category == c
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Style Meets Comfort",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "View All",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Nike sneakers offer ultimate comfort.",
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade500,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          // Liste des produits filtrés
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: filtered.map((p) {
              return GestureDetector(
                onTap: () => onProductTap(p),
                child: Container(
                  height: 320,
                  margin: const EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: ClipPath(
                          clipper: DiagonalClipper(),
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFF6B5D3F),
                                  Color(0xFFF2D58C),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        bottom: 30,
                        child: Text(
                          "NIKE",
                          style: TextStyle(
                            fontSize: 140,
                            fontWeight: FontWeight.w900,
                            color: Colors.white.withOpacity(0.15),
                            height: 0.9,
                          ),
                        ),
                      ),
                      Positioned(
                        right: -20,
                        top: 40,
                        child: Transform.rotate(
                          angle: -0.2,
                          child: Image.network(
                            'https://static.nike.com/a/images/t_web_pdp_936_v2/f_auto/tjkr8ecmktw7qooy9d0h/NIKE+SHOX+TL.png',
                            width: 260,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 260,
                                height: 200,
                                color: Colors.grey.shade300,
                                child: const Icon(Icons.image, size: 80),
                              );
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        left: 24,
                        top: 24,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              p.name.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF2D58C),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text(
                                "X TRAVIS SCOTT",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 24,
                        bottom: 24,
                        child: Text(
                          p.subtitle.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        BottomNavBar(
          view: view,
          cartLength: cartLength,
          onViewChange: onViewChange,
          onSearchTap: onSearchOpen,
        ),
      ],
    );
  }
}

// Vue détail d'un produit
class DetailView extends StatelessWidget {
  final Product product;
  final bool isLiked;
  final String selectedSize;
  final Color selectedColor;
  final VoidCallback onBack;
  final VoidCallback onLikeTap;
  final VoidCallback onAddToCart;

  const DetailView({
    super.key,
    required this.product,
    required this.isLiked,
    required this.selectedSize,
    required this.selectedColor,
    required this.onBack,
    required this.onLikeTap,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    int activeTab = 0;

    return StatefulBuilder(builder: (context, setDetailState) {
      return Column(
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.arrow_back, size: 20),
                    onPressed: onBack,
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Colors.red : Colors.black,
                      size: 20,
                    ),
                    onPressed: onLikeTap,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  child: ClipPath(
                    clipper: DiagonalClipper(),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF6B5D3F),
                            Color(0xFFF2D58C),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  bottom: 30,
                  child: Text(
                    "NIKE",
                    style: TextStyle(
                      fontSize: 180,
                      fontWeight: FontWeight.w900,
                      color: Colors.white.withOpacity(0.15),
                      height: 0.8,
                    ),
                  ),
                ),
                Center(
                  child: Transform.rotate(
                    angle: -0.2,
                    child: Image.network(
                      'https://static.nike.com/a/images/t_web_pdp_936_v2/f_auto/tjkr8ecmktw7qooy9d0h/NIKE+SHOX+TL.png',
                      width: 320,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 320,
                          height: 250,
                          color: Colors.grey.shade300,
                          child: const Icon(Icons.image, size: 100),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  left: 24,
                  top: 24,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF2D58C),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          "X TRAVIS SCOTT",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 24,
                  bottom: 24,
                  child: Text(
                    product.subtitle.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          product.subtitle,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "\$${product.price}",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Price",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: selectedColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey.shade300, width: 2),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      "Colors",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_down),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.straighten, size: 16),
                          SizedBox(width: 4),
                          Text("5Y  5.5Y  6Y  6.5Y",
                              style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Onglets de détails
                Row(
                  children: ["Description", "Pickup", "Details", "Reviews"]
                      .asMap()
                      .entries
                      .map((entry) {
                    int idx = entry.key;
                    String tab = entry.value;
                    bool isActive = activeTab == idx;
                    return GestureDetector(
                      onTap: () => setDetailState(() => activeTab = idx),
                      child: Container(
                        margin: const EdgeInsets.only(right: 20),
                        padding: const EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: isActive
                                  ? Colors.black
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                        ),
                        child: Text(
                          tab,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight:
                                isActive ? FontWeight.bold : FontWeight.normal,
                            color:
                                isActive ? Colors.black : Colors.grey.shade500,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                Text(
                  product.description,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade700,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 56,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF2D58C),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: const Center(
                          child: Text(
                            "Start",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: onAddToCart,
                        child: Container(
                          height: 56,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: const Center(
                            child: Text(
                              "Place To Bag",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}