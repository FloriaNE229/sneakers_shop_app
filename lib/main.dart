// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const NikeShoppingApp());
}

class NikeShoppingApp extends StatelessWidget {
  const NikeShoppingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nike Shopping',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        fontFamily: 'Helvetica',
      ),
      home: const HomeScreen(),
    );
  }
}

// Models
class Product {
  final String id;
  final String name;
  final String subtitle;
  final double price;
  final String description;
  final List<Color> colors;
  final List<String> sizes;

  Product({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.price,
    required this.description,
    required this.colors,
    required this.sizes,
  });
}

class CartItem {
  final String id;
  final String name;
  final double price;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    this.quantity = 1,
  });
}

// Diagonal Painter
class DiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        colors: [
          const Color(0xFF8B6914),
          const Color(0xFF6B5410),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * 0.60, 0)
      ..lineTo(size.width * 0.45, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Home Screen
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedChip = 'Sneakers';
  final List<String> chips = ['Sneakers', 'Basketball', 'Gym Shoes', 'Soccer'];
  int selectedNav = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Colors.yellow.shade200,
                              Colors.yellow.shade300,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: const Icon(Icons.person, color: Colors.black87),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade100,
                        ),
                        child: const Icon(Icons.search, color: Colors.black54, size: 20),
                      ),
                    ],
                  ),
                ),

                // Title
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 32, height: 1.2),
                      children: [
                        TextSpan(
                          text: 'Experience ',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        TextSpan(
                          text: 'the Ultimate\n',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: 'Shopping With Nike!',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Chips
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    scrollDirection: Axis.horizontal,
                    itemCount: chips.length,
                    itemBuilder: (context, index) {
                      final chip = chips[index];
                      final isSelected = chip == selectedChip;
                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: GestureDetector(
                          onTap: () => setState(() => selectedChip = chip),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              gradient: isSelected
                                  ? LinearGradient(
                                      colors: [
                                        Colors.yellow.shade300,
                                        Colors.yellow.shade400,
                                      ],
                                    )
                                  : null,
                              color: isSelected ? null : Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              border: isSelected
                                  ? null
                                  : Border.all(color: Colors.grey.shade300),
                              boxShadow: isSelected
                                  ? [
                                      BoxShadow(
                                        color: Colors.yellow.shade300.withOpacity(0.3),
                                        blurRadius: 8,
                                        offset: const Offset(0, 2),
                                      ),
                                    ]
                                  : null,
                            ),
                            child: Text(
                              chip,
                              style: TextStyle(
                                color: isSelected ? Colors.black : Colors.black54,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Section Header
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Style Meets Comfort',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Nike sneakers offer ultimate comfort.',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'View All',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                // Product Card
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 100),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProductDetailScreen(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(32),
                          child: Stack(
                            children: [
                              // Background gradient
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.yellow.shade50,
                                      Colors.yellow.shade100,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                              ),
                              // Diagonal overlay
                              CustomPaint(
                                size: Size.infinite,
                                painter: DiagonalPainter(),
                              ),
                              // NIKE Text
                              Positioned(
                                left: 24,
                                top: 0,
                                bottom: 0,
                                child: Center(
                                  child: Text(
                                    'NI\nKE',
                                    style: TextStyle(
                                      fontSize: 88,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white.withOpacity(0.9),
                                      height: 0.95,
                                      letterSpacing: -4,
                                    ),
                                  ),
                                ),
                              ),
                              // Product Info
                              Positioned(
                                left: 24,
                                bottom: 24,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'AIR JORDAN 1',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        const Text(
                                          'X TRAVIS SCOTT',
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.symmetric(horizontal: 6),
                                          width: 3,
                                          height: 3,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        const Text(
                                          'LOW RETRO OG',
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // Shoe Image
                              Positioned(
                                right: -20,
                                top: 0,
                                bottom: 0,
                                child: Center(
                                  child: Transform.rotate(
                                    angle: -0.3,
                                    child: Container(
                                      width: 240,
                                      height: 160,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.brown.shade300,
                                            Colors.yellow.shade300,
                                            Colors.brown.shade200,
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.2),
                                            blurRadius: 20,
                                            offset: const Offset(5, 10),
                                          ),
                                        ],
                                      ),
                                      child: Stack(
                                        children: [
                                          // Shoe sole
                                          Positioned(
                                            bottom: 10,
                                            left: 20,
                                            right: 20,
                                            child: Container(
                                              height: 15,
                                              decoration: BoxDecoration(
                                                color: Colors.white.withOpacity(0.9),
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                            ),
                                          ),
                                          // Nike swoosh representation
                                          Positioned(
                                            top: 40,
                                            left: 40,
                                            child: Container(
                                              width: 60,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: Colors.white.withOpacity(0.9),
                                                borderRadius: const BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomLeft: Radius.circular(20),
                                                ),
                                              ),
                                            ),
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
                    ),
                  ),
                ),
              ],
            ),

            // Bottom Navigation
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: Colors.grey.shade100),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildNavItem(Icons.home_rounded, 0),
                    _buildNavItem(Icons.search, 1),
                    _buildNavItem(Icons.favorite_border, 2),
                    _buildNavItem(Icons.person_outline, 3),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    final isSelected = selectedNav == index;
    return GestureDetector(
      onTap: () {
        if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CartScreen()),
          );
        } else {
          setState(() => selectedNav = index);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
                  colors: [
                    Colors.yellow.shade300,
                    Colors.yellow.shade400,
                  ],
                )
              : null,
          shape: BoxShape.circle,
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.yellow.shade300.withOpacity(0.4),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.black : Colors.grey.shade400,
          size: 24,
        ),
      ),
    );
  }
}

// Product Detail Screen
class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String selectedSize = '6Y';
  String selectedTab = 'Description';
  bool isFavorite = false;
  final List<String> sizes = ['5Y', '5.5Y', '6Y', '6.5Y'];
  final List<String> tabs = ['Description', 'Pickup', 'Details', 'Reviews'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Hero Section
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.55,
            child: Stack(
              children: [
                // Background
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.yellow.shade50,
                        Colors.yellow.shade100,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                // Diagonal overlay
                CustomPaint(
                  size: Size.infinite,
                  painter: DiagonalPainter(),
                ),
                // NIKE Text
                Positioned(
                  left: 32,
                  top: MediaQuery.of(context).padding.top + 100,
                  child: Text(
                    'NI\nKE',
                    style: TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.w900,
                      color: Colors.white.withOpacity(0.9),
                      height: 0.95,
                      letterSpacing: -4,
                    ),
                  ),
                ),
                // Product Info
                Positioned(
                  left: 32,
                  bottom: 32,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'AIR JORDAN 1',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Text(
                            'X TRAVIS SCOTT',
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            width: 3,
                            height: 3,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const Text(
                            'LOW RETRO OG',
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Shoe placeholder
                Positioned(
                  right: -30,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: Transform.rotate(
                      angle: -0.3,
                      child: Container(
                        width: 280,
                        height: 180,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.brown.shade300,
                              Colors.yellow.shade300,
                              Colors.brown.shade200,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 30,
                              offset: const Offset(10, 15),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            // Shoe sole
                            Positioned(
                              bottom: 15,
                              left: 30,
                              right: 30,
                              child: Container(
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            // Nike swoosh
                            Positioned(
                              top: 50,
                              left: 50,
                              child: Container(
                                width: 80,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.9),
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(25),
                                    bottomLeft: Radius.circular(25),
                                  ),
                                ),
                              ),
                            ),
                            // Laces area
                            Positioned(
                              top: 20,
                              left: 80,
                              child: Container(
                                width: 40,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.brown.shade700.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // Top buttons
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: const Icon(Icons.arrow_back, size: 20),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => setState(() => isFavorite = !isFavorite),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: Icon(
                              isFavorite ? Icons.favorite : Icons.favorite_border,
                              size: 20,
                              color: isFavorite ? Colors.red : Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Product Info Section
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Price
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Air Jordan 1',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Low Retro OG',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            '\$120',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Price',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Color and Size selector
                  Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: const Color(0xFF8B6914),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey.shade300, width: 2),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Colors',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_down, size: 18),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(Icons.shopping_bag_outlined, size: 18, color: Colors.grey.shade600),
                      ),
                      const SizedBox(width: 8),
                      ...sizes.map((size) => Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: GestureDetector(
                              onTap: () => setState(() => selectedSize = size),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: selectedSize == size
                                      ? Colors.black
                                      : Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  size,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: selectedSize == size
                                        ? Colors.white
                                        : Colors.black87,
                                  ),
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Tabs
                  Row(
                    children: tabs.map((tab) {
                      final isSelected = tab == selectedTab;
                      return GestureDetector(
                        onTap: () => setState(() => selectedTab = tab),
                        child: Container(
                          margin: const EdgeInsets.only(right: 24),
                          padding: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: isSelected ? Colors.black : Colors.transparent,
                                width: 2,
                              ),
                            ),
                          ),
                          child: Text(
                            tab,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: isSelected ? Colors.black : Colors.grey.shade400,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),

                  // Description
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                        height: 1.6,
                      ),
                      children: const [
                        TextSpan(
                          text:
                              'Every Jordan Retro is a classic sneaker done up in new colors and textures for a fresh look. With smooth leather, this iteration gives little feet stand out style. Plus, premium materials...',
                        ),
                        TextSpan(
                          text: 'Read',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 56,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.yellow.shade300,
                                Colors.yellow.shade400,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(28),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.yellow.shade300.withOpacity(0.4),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(28),
                              child: const Center(
                                child: Text(
                                  'Start',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          height: 56,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const CartScreen(),
                                  ),
                                );
                              },
                              borderRadius: BorderRadius.circular(28),
                              child: const Center(
                                child: Text(
                                  'Place To Bag',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
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
          ),
        ],
      ),
    );
  }
}

// Cart Screen
class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItem> items = [
    CartItem(id: '1', name: 'Air Jordan 1', price: 120, quantity: 1),
    CartItem(id: '2', name: 'Air Jordan 1', price: 133, quantity: 1),
  ];

  void updateQuantity(String id, int delta) {
    setState(() {
      for (var item in items) {
        if (item.id == id) {
          item.quantity = (item.quantity + delta).clamp(1, 99);
          break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Cart',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.delete_outline,
                color: Colors.red,
                size: 20,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 1,
            color: Colors.grey.shade100,
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(24),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Padding(
                  padding: EdgeInsets.only(top: index > 0 ? 24 : 0),
                  child: Column(
                    children: [
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 1,
                        ),
                        itemCount: 4,
                        itemBuilder: (context, imgIndex) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: imgIndex % 2 == 0 
                                ? const Color(0xFFFFF8E1)
                                : const Color(0xFFFFECB3),
                            ),
                            child: Stack(
                              children: [
                                // Gradient background
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: imgIndex % 2 == 0
                                          ? [
                                              Colors.yellow.shade50,
                                              Colors.yellow.shade100,
                                            ]
                                          : [
                                              Colors.red.shade50,
                                              Colors.orange.shade100,
                                            ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                // Shoe representation
                                Center(
                                  child: Transform.rotate(
                                    angle: -0.3,
                                    child: Container(
                                      width: 80,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: imgIndex % 2 == 0
                                              ? [
                                                  Colors.brown.shade300,
                                                  Colors.yellow.shade300,
                                                ]
                                              : [
                                                  Colors.red.shade400,
                                                  Colors.orange.shade300,
                                                ],
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '\${item.price}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => updateQuantity(item.id, -1),
                                child: Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.remove, size: 16),
                                ),
                              ),
                              Container(
                                width: 40,
                                alignment: Alignment.center,
                                child: Text(
                                  item.quantity.toString().padLeft(2, '0'),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => updateQuantity(item.id, 1),
                                child: Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.yellow.shade300,
                                        Colors.yellow.shade400,
                                      ],
                                    ),
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.yellow.shade300.withOpacity(0.4),
                                        blurRadius: 8,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: const Icon(Icons.add, size: 16, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey.shade100),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery Fee:',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const Text(
                      '\$13.00',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Subtotal:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '\${subtotal.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.yellow.shade300,
                        Colors.yellow.shade400,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.yellow.shade300.withOpacity(0.5),
                        blurRadius: 16,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(28),
                      child: const Center(
                        child: Text(
                          'Checkout',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}