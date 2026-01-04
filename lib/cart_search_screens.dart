import 'package:flutter/material.dart';
import 'models.dart';

// Vue du panier avec liste des articles
class CartView extends StatelessWidget {
  final List<CartItem> cart;
  final VoidCallback onBack;
  final VoidCallback onClearCart;
  final Function(CartItem, int) onChangeQty; // Change la quantité
  final double subtotal;
  final double delivery;
  final VoidCallback onCheckout;

  const CartView({
    super.key,
    required this.cart,
    required this.onBack,
    required this.onClearCart,
    required this.onChangeQty,
    required this.subtotal,
    required this.delivery,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
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
              const SizedBox(width: 12),
              const Text(
                "Cart",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.delete_outline,
                      size: 20, color: Colors.red),
                  onPressed: onClearCart,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          // Affiche le panier vide ou la grille d'articles
          child: cart.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart_outlined,
                          size: 80, color: Colors.grey.shade300),
                      const SizedBox(height: 16),
                      Text(
                        "Votre panier est vide",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                )
              : GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    final item = cart[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(20)),
                              child: Container(
                                width: double.infinity,
                                color: Colors.grey.shade200,
                                child: Transform.rotate(
                                  angle: -0.2,
                                  child: Image.network(
                                    'https://static.nike.com/a/images/t_web_pdp_936_v2/f_auto/tjkr8ecmktw7qooy9d0h/NIKE+SHOX+TL.png',
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Icon(Icons.image,
                                          size: 50, color: Colors.grey);
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.product.name,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "\$${item.product.price}",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Boutons pour ajuster la quantité
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () => onChangeQty(item, -1),
                                            child: Container(
                                              width: 30,
                                              height: 30,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Icon(Icons.remove,
                                                  size: 16),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            child: Text(
                                              item.qty
                                                  .toString()
                                                  .padLeft(2, '0'),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () => onChangeQty(item, 1),
                                            child: Container(
                                              width: 30,
                                              height: 30,
                                              decoration: const BoxDecoration(
                                                color: Color(0xFFF2D58C),
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Icon(Icons.add,
                                                  size: 16),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
        // Résumé et bouton de paiement
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Delivery Fee:",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  Text(
                    "\$${delivery.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Subtotal:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "\$${(subtotal + delivery).toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: cart.isEmpty ? null : onCheckout,
                child: Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    color: cart.isEmpty
                        ? Colors.grey.shade300
                        : const Color(0xFFF2D58C),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Center(
                    child: Text(
                      "Checkout",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: cart.isEmpty
                            ? Colors.grey.shade500
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Overlay de recherche avec résultats
class SearchOverlay extends StatelessWidget {
  final String search;
  final List<Product> products;
  final Function(String) onSearchChange; // Met à jour le texte de recherche
  final VoidCallback onClose;
  final Function(Product) onProductTap;

  const SearchOverlay({
    super.key,
    required this.search,
    required this.products,
    required this.onSearchChange,
    required this.onClose,
    required this.onProductTap,
  });

  @override
  Widget build(BuildContext context) {
    // Filtre les produits selon la recherche
    final results = products
        .where((p) => p.name.toLowerCase().contains(search.toLowerCase()))
        .toList();

    return Container(
      color: const Color(0xFFF5F5F5),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextField(
                      autofocus: true,
                      decoration: const InputDecoration(
                        hintText: "Search products...",
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 14),
                      ),
                      onChanged: onSearchChange,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: onClose,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.close),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            // Affiche aucun résultat ou liste des produits
            child: results.isEmpty
                ? Center(
                    child: Text(
                      "Aucun produit trouvé",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      final p = results[index];
                      return GestureDetector(
                        onTap: () => onProductTap(p),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Transform.rotate(
                                  angle: -0.2,
                                  child: Image.network(
                                    'https://static.nike.com/a/images/t_web_pdp_936_v2/f_auto/tjkr8ecmktw7qooy9d0h/NIKE+SHOX+TL.png',
                                    width: 50,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Icon(Icons.image);
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      p.name,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      p.subtitle,
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "\$${p.price}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}