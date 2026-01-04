import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'models.dart';
import 'widgets.dart';
import 'home_detail_screens.dart';
import 'cart_search_screens.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(const NikeApp());
}

// Application principale
class NikeApp extends StatelessWidget {
  const NikeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppRoot(),
    );
  }
}

// Racine de l'application avec gestion d'état
class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  // Navigation
  int view = 0;
  bool searchOpen = false;

  // Produits et panier
  String category = "Sneakers";
  Product? current;
  String search = "";
  String selectedSize = "5Y";
  Color selectedColor = const Color(0xFF6B5D3F);
  final cart = <CartItem>[];
  Map<String, bool> likedProducts = {};

  final products = [
    Product(
      name: "Air Jordan 1",
      price: 120,
      category: "Sneakers",
      subtitle: "Low Retro OG",
      description:
          "Every Jordan Retro is a classic sneaker done up in new colors and textures for a fresh look. With smooth leather, this iteration gives little feet stand out style. Plus, premium materials...Read",
      image: "assets/shoe.png",
      sizes: ["5Y", "5.5Y", "6Y", "6.5Y"],
      colors: [
        Color(0xFF6B5D3F),
        Color(0xFFE8E8E8),
        Color(0xFF2C2C2C),
      ],
    ),
    Product(
      name: "Air Max 97",
      price: 180,
      category: "Basketball",
      subtitle: "Retro Edition",
      description: "Classic design with modern comfort for the court.",
      image: "assets/shoe.png",
      sizes: ["5Y", "5.5Y", "6Y", "6.5Y"],
      colors: [Color(0xFFE74C3C), Color(0xFF000000), Color(0xFFFFFFFF)],
    ),
    Product(
      name: "Metcon 8",
      price: 150,
      category: "Gym Shoes",
      subtitle: "Training Shoes",
      description: "Built for intense training sessions.",
      image: "assets/shoe.png",
      sizes: ["5Y", "5.5Y", "6Y", "6.5Y"],
      colors: [Color(0xFF3498DB), Color(0xFF95A5A6), Color(0xFF000000)],
    ),
    Product(
      name: "Mercurial Vapor",
      price: 200,
      category: "Soccer",
      subtitle: "15 Elite",
      description: "Speed and precision for the pitch.",
      image: "assets/shoe.png",
      sizes: ["5Y", "5.5Y", "6Y", "6.5Y"],
      colors: [Color(0xFF27AE60), Color(0xFFF39C12), Color(0xFFFFFFFF)],
    ),
  ];

  // Ajoute un produit au panier
  void addToCart(Product p) {
    final found = cart.where((c) =>
        c.product.name == p.name &&
        c.size == selectedSize &&
        c.color == selectedColor);
    if (found.isNotEmpty) {
      found.first.qty++;
    } else {
      cart.add(CartItem(p, 1, selectedSize, selectedColor));
    }
    setState(() {});
  }

  // Change la quantité d'un article
  void changeQty(CartItem item, int delta) {
    item.qty += delta;
    if (item.qty <= 0) cart.remove(item);
    setState(() {});
  }

  // Calcule le sous-total
  double getSubtotal() {
    return cart.fold(0.0, (s, i) => s + (i.product.price * i.qty).toDouble());
  }

  // Retourne les frais de livraison
  double getDelivery() {
    return cart.isEmpty ? 0.0 : 13.0;
  }

  void _goToHome() => setState(() => view = 0);

  void _goToDetail(Product product) {
    current = product;
    setState(() => view = 1);
  }

  void _goToCart() => setState(() => view = 2);

  void _openSearch() => setState(() => searchOpen = true);

  void _closeSearch() {
    setState(() {
      searchOpen = false;
      search = "";
    });
  }

  void _changeCategory(String newCategory) {
    setState(() => category = newCategory);
  }

  void _changeSearch(String value) {
    setState(() => search = value);
  }

  void _toggleLike(String productName) {
    setState(() {
      likedProducts[productName] = !(likedProducts[productName] ?? false);
    });
  }

  void _addToCartWithSnackbar() {
    addToCart(current!);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${current!.name} ajouté au panier"),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void _clearCart() {
    setState(() => cart.clear());
  }

  void _checkout() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Commande en cours..."),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _selectProductFromSearch(Product product) {
    _goToDetail(product);
    _closeSearch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: 390,
          height: 844,
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                blurRadius: 40,
                color: Colors.black.withOpacity(.2),
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Stack(
              children: [
                // Change la vue selon la navigation
                IndexedStack(
                  index: view,
                  children: [
                    HomeView(
                      category: category,
                      search: search,
                      products: products,
                      onCategoryChange: _changeCategory,
                      onProductTap: _goToDetail,
                      onSearchOpen: _openSearch,
                      view: view,
                      cartLength: cart.length,
                      onViewChange: (v) => setState(() => view = v),
                    ),
                    if (current != null)
                      DetailView(
                        product: current!,
                        isLiked: likedProducts[current!.name] ?? false,
                        selectedSize: selectedSize,
                        selectedColor: selectedColor,
                        onBack: _goToHome,
                        onLikeTap: () => _toggleLike(current!.name),
                        onAddToCart: _addToCartWithSnackbar,
                      ),
                    CartView(
                      cart: cart,
                      onBack: _goToHome,
                      onClearCart: _clearCart,
                      onChangeQty: changeQty,
                      subtotal: getSubtotal(),
                      delivery: getDelivery(),
                      onCheckout: _checkout,
                    ),
                  ],
                ),
                // Affiche la recherche par-dessus les autres vues
                if (searchOpen)
                  SearchOverlay(
                    search: search,
                    products: products,
                    onSearchChange: _changeSearch,
                    onClose: _closeSearch,
                    onProductTap: _selectProductFromSearch,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}