import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'panier.dart';
import 'product.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    final List<String> categories = ['Sneakers', 'Basketball', 'Gym Shoes', 'Soccer'];
    final List<Product> products = getAllProducts();

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
            child: Stack(
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
                                        image: const DecorationImage(
                                          image: NetworkImage('https://i.pravatar.cc/100'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
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
                                      final isActive = index == 0;
                                      return Container(
                                        margin: const EdgeInsets.only(right: 12),
                                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                                        decoration: BoxDecoration(
                                          color: isActive ? const Color(0xFFF4E8D0) : Colors.white,
                                          borderRadius: BorderRadius.circular(25),
                                        ),
                                        child: Center(
                                          child: Text(
                                            categories[index],
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: isActive ? const Color(0xFF8B7355) : Colors.grey[600],
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
                                  children: const [
                                    Text('Style Meets Comfort', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black)),
                                    Text('View All', style: TextStyle(fontSize: 14, color: Colors.grey)),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                const Text('Nike sneakers offer ultimate comfort.', style: TextStyle(fontSize: 14, color: Colors.grey)),
                                const SizedBox(height: 20),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: products.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(bottom: 20),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ProductPage(product: products[index]),
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
                                              colors: [Color(0xFF6B5D41), Color(0xFF6B5D41), Color(0xFFF4E8D0), Color(0xFFF4E8D0)],
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
                                                  child: Container(
                                                    width: 280,
                                                    height: 280,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white.withValues(alpha: 0.1),
                                                      borderRadius: BorderRadius.circular(20),
                                                    ),
                                                    child: const Icon(Icons.add_photo_alternate_outlined, size: 60, color: Colors.white54),
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
                                                      products[index].name.toUpperCase(),
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
                                                        products[index].collaboration,
                                                        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.white),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Text(
                                                      products[index].subtitle.toUpperCase(),
                                                      style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.white, letterSpacing: 1),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
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
                Positioned(
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
                        _buildNavItem(Icons.home, true),
                        _buildNavItem(Icons.search, false),
                        _buildNavItem(Icons.favorite_border, false),
                        _buildNavItem(Icons.person_outline, false),
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

  Widget _buildNavItem(IconData icon, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFF4E8D0) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Icon(icon, color: isActive ? const Color(0xFF8B7355) : Colors.grey, size: 24),
    );
  }
}