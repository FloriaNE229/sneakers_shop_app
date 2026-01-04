import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'panier.dart';
import 'product.dart';

List<Product> favoriteProducts = [];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  int _selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      backgroundColor: const Color(0xFFE8E8E8),
      body: Center(
        child: Container(
          width: 390,
          height: 844,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: _buildCurrentPage(),
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentPage() {
    switch (_selectedIndex) {
      case 0:
        return _buildHomePage();
      case 1:
        return _buildSearchPage();
      case 2:
        return _buildFavoritesPage();
      case 3:
        return _buildProfilePage();
      default:
        return _buildHomePage();
    }
  }

  Widget _buildHomePage() {
    final List<String> categories = ['Sneakers', 'Basketball', 'Gym Shoes', 'Soccer'];
    final List<Product> products = getAllProducts();

    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 44,
              color: const Color(0xFFFAFAFA),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('9:41', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black)),
                    Row(
                      children: const [
                        Icon(Icons.signal_cellular_4_bar, size: 16, color: Colors.black),
                        SizedBox(width: 5),
                        Icon(Icons.wifi, size: 16, color: Colors.black),
                        SizedBox(width: 5),
                        Icon(Icons.battery_full, size: 20, color: Colors.black),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: const Color(0xFFFAFAFA),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey[300],
                              ),
                              child: Icon(
                                Icons.person,
                                color: Colors.grey[700],
                                size: 28,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = 1;
                                });
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(alpha: 0.08),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: const Icon(Icons.search, color: Colors.grey, size: 20),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        const Text.rich(
                          TextSpan(
                            style: TextStyle(fontSize: 32, color: Color(0xFF333333), fontWeight: FontWeight.w300, height: 1.3),
                            children: [
                              TextSpan(text: 'Experience '),
                              TextSpan(
                                text: 'the Ultimate Shopping With Nike!',
                                style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 25),
                        SizedBox(
                          height: 45,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              final isActive = _selectedCategory == index;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedCategory = index;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 12),
                                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: isActive ? const Color(0xFFE8D5B7) : Colors.white,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Center(
                                    child: Text(
                                      categories[index],
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: isActive ? const Color(0xFF5C4A34) : Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${categories[_selectedCategory]} Meets Comfort', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black)),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ViewAllPage(category: categories[_selectedCategory]),
                                  ),
                                );
                              },
                              child: const Text('View All', style: TextStyle(fontSize: 14, color: Colors.grey)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text('Nike ${categories[_selectedCategory].toLowerCase()} offer ultimate comfort.', style: const TextStyle(fontSize: 14, color: Colors.grey)),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductPage(product: products[_selectedCategory]),
                              ),
                            );
                          },
                          child: Container(
                            height: 320,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Color(0xFF5C4A34), Color(0xFF5C4A34), Color(0xFFE8D5B7), Color(0xFFE8D5B7)],
                                stops: [0.0, 0.5, 0.5, 1.0],
                              ),
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: Text(
                                    'NIKE',
                                    style: TextStyle(
                                      fontSize: 120,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white.withValues(alpha: 0.15),
                                      letterSpacing: -5,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Transform.rotate(
                                    angle: -0.4,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        products[_selectedCategory].imageUrl,
                                        width: 280,
                                        height: 280,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 20,
                                  left: 20,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        products[_selectedCategory].name.toUpperCase(),
                                        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.white, letterSpacing: 1),
                                      ),
                                      const SizedBox(height: 4),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: Colors.black.withValues(alpha: 0.3),
                                          borderRadius: BorderRadius.circular(3),
                                        ),
                                        child: Text(
                                          products[_selectedCategory].collaboration,
                                          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.white),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        products[_selectedCategory].subtitle.toUpperCase(),
                                        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.white, letterSpacing: 1),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 90),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        _buildBottomNav(),
      ],
    );
  }

  Widget _buildSearchPage() {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 44,
              color: const Color(0xFFFAFAFA),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('9:41', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black)),
                    Row(
                      children: const [
                        Icon(Icons.signal_cellular_4_bar, size: 16, color: Colors.black),
                        SizedBox(width: 5),
                        Icon(Icons.wifi, size: 16, color: Colors.black),
                        SizedBox(width: 5),
                        Icon(Icons.battery_full, size: 20, color: Colors.black),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: const Color(0xFFFAFAFA),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Rechercher des chaussures...',
                          prefixIcon: const Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        _buildBottomNav(),
      ],
    );
  }

  Widget _buildFavoritesPage() {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 44,
              color: const Color(0xFFFAFAFA),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('9:41', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black)),
                    Row(
                      children: const [
                        Icon(Icons.signal_cellular_4_bar, size: 16, color: Colors.black),
                        SizedBox(width: 5),
                        Icon(Icons.wifi, size: 16, color: Colors.black),
                        SizedBox(width: 5),
                        Icon(Icons.battery_full, size: 20, color: Colors.black),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: const Color(0xFFFAFAFA),
                child: favoriteProducts.isEmpty
                    ? const Center(
                        child: Text('Vos produits favoris apparaîtront ici', style: TextStyle(fontSize: 16, color: Colors.grey)),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(20),
                        itemCount: favoriteProducts.length,
                        itemBuilder: (context, index) {
                          final product = favoriteProducts[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF5F5F5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      product.imageUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(product.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                      Text('\$${product.price.toInt()}', style: const TextStyle(fontSize: 14, color: Colors.grey)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
        _buildBottomNav(),
      ],
    );
  }

  Widget _buildProfilePage() {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 44,
              color: const Color(0xFFFAFAFA),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('9:41', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black)),
                    Row(
                      children: const [
                        Icon(Icons.signal_cellular_4_bar, size: 16, color: Colors.black),
                        SizedBox(width: 5),
                        Icon(Icons.wifi, size: 16, color: Colors.black),
                        SizedBox(width: 5),
                        Icon(Icons.battery_full, size: 20, color: Colors.black),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: const Color(0xFFFAFAFA),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFE8D5B7),
                        ),
                        child: const Icon(Icons.person, size: 50, color: Color(0xFF5C4A34)),
                      ),
                      const SizedBox(height: 20),
                      const Text('Floriane', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black)),
                      const SizedBox(height: 5),
                      const Text('floriane@email.com', style: TextStyle(fontSize: 14, color: Colors.grey)),
                      const SizedBox(height: 30),
                      _buildProfileOption(Icons.shopping_bag, 'Mes commandes'),
                      _buildProfileOption(Icons.location_on, 'Adresses'),
                      _buildProfileOption(Icons.payment, 'Moyens de paiement'),
                      _buildProfileOption(Icons.settings, 'Paramètres'),
                      _buildProfileOption(Icons.help_outline, 'Aide'),
                      _buildProfileOption(Icons.logout, 'Déconnexion'),
                      const SizedBox(height: 90),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        _buildBottomNav(),
      ],
    );
  }

  Widget _buildProfileOption(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFF5F5F5),
            ),
            child: Icon(icon, color: const Color(0xFF5C4A34), size: 22),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black)),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 20, offset: const Offset(0, 5))],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, 0),
            _buildNavItem(Icons.search, 1),
            _buildNavItem(Icons.favorite_border, 2),
            _buildNavItem(Icons.person_outline, 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    final isActive = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFFE8D5B7) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(icon, color: isActive ? const Color(0xFF5C4A34) : Colors.grey, size: 24),
      ),
    );
  }
}

class ViewAllPage extends StatelessWidget {
  final String category;
  
  const ViewAllPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final products = getAllProducts();
    
    return Scaffold(
      backgroundColor: const Color(0xFFE8E8E8),
      body: Center(
        child: Container(
          width: 390,
          height: 844,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Column(
              children: [
                Container(
                  height: 44,
                  color: const Color(0xFFFAFAFA),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('9:41', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black)),
                        Row(
                          children: const [
                            Icon(Icons.signal_cellular_4_bar, size: 16, color: Colors.black),
                            SizedBox(width: 5),
                            Icon(Icons.wifi, size: 16, color: Colors.black),
                            SizedBox(width: 5),
                            Icon(Icons.battery_full, size: 20, color: Colors.black),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: const Color(0xFFFAFAFA),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: const Icon(Icons.arrow_back, color: Colors.black, size: 24),
                              ),
                              const SizedBox(width: 15),
                              Text('$category Collection', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: GridView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                              childAspectRatio: 0.75,
                            ),
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductPage(product: products[index]),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            gradient: const LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [Color(0xFF5C4A34), Color(0xFFE8D5B7)],
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(20),
                                            child: Image.asset(
                                              products[index].imageUrl,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(products[index].name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                                            Text('\$${products[index].price.toInt()}', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                                          ],
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
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}