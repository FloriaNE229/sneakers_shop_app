import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'panier.dart';

class ProductPage extends StatefulWidget {
  final Product product;
  
  const ProductPage({super.key, required this.product});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String selectedSize = '6Y';
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
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
            child: Stack(
              children: [
                // La partie du haut avec dégradé
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 440,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF6B5D41), Color(0xFF6B5D41), Color(0xFFF4E8D0), Color(0xFFF4E8D0)],
                        stops: [0.0, 0.5, 0.5, 1.0],
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          left: 20,
                          right: 20,
                          child: SizedBox(
                            height: 44,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('9:41', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white)),
                                Row(
                                  children: [
                                    Icon(Icons.signal_cellular_4_bar, size: 16, color: Colors.white),
                                    SizedBox(width: 5),
                                    Icon(Icons.wifi, size: 16, color: Colors.white),
                                    SizedBox(width: 5),
                                    Icon(Icons.battery_full, size: 20, color: Colors.white),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 70,
                          left: 20,
                          right: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                  width: 45,
                                  height: 45,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: const Icon(Icons.arrow_back, size: 24, color: Colors.black),
                                ),
                              ),
                              Container(
                                width: 45,
                                height: 45,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: const Icon(Icons.favorite_border, size: 24, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Text(
                            'NIKE',
                            style: TextStyle(
                              fontSize: 140,
                              fontWeight: FontWeight.w900,
                              color: Colors.white.withValues(alpha: 0.15),
                              letterSpacing: -8,
                            ),
                          ),
                        ),
                        Center(
                          child: Transform.rotate(
                            angle: -0.3,
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
                          left: 40,
                          bottom: 30,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('AIR JORDAN 1', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Colors.white, letterSpacing: 1)),
                              SizedBox(height: 6),
                              Text('X TRAVIS SCOTT', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Colors.white, letterSpacing: 1)),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 40,
                          bottom: 30,
                          child: const Text('LOW RETRO OG', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.white, letterSpacing: 1)),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 440,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(widget.product.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black)),
                                  Text(widget.product.subtitle, style: const TextStyle(fontSize: 14, color: Colors.grey)),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('\$${widget.product.price.toInt()}', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: Colors.black)),
                                  const Text('Price', style: TextStyle(fontSize: 12, color: Colors.grey)),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                                  decoration: BoxDecoration(color: const Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(15)),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: const Color(0xFF6B5D41),
                                          border: Border.all(color: Colors.white, width: 2),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      const Text('Colors', style: TextStyle(fontSize: 14)),
                                      const SizedBox(width: 10),
                                      const Text('▼', style: TextStyle(fontSize: 10, color: Colors.grey)),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(color: const Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(10)),
                                  child: const Icon(Icons.circle_outlined, size: 20, color: Colors.grey),
                                ),
                                const SizedBox(width: 8),
                                ...widget.product.sizes.map((size) => Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: GestureDetector(
                                    onTap: () => setState(() => selectedSize = size),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                      decoration: BoxDecoration(
                                        color: selectedSize == size ? Colors.black : Colors.white,
                                        border: Border.all(color: selectedSize == size ? Colors.black : const Color(0xFFE0E0E0)),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(size, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: selectedSize == size ? Colors.white : Colors.black)),
                                    ),
                                  ),
                                )),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: ['Description', 'Pickup', 'Details', 'Reviews'].asMap().entries.map((entry) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: GestureDetector(
                                  onTap: () => setState(() => selectedTab = entry.key),
                                  child: Column(
                                    children: [
                                      Text(entry.value, style: TextStyle(fontSize: 14, fontWeight: selectedTab == entry.key ? FontWeight.w600 : FontWeight.normal, color: selectedTab == entry.key ? Colors.black : Colors.grey)),
                                      const SizedBox(height: 8),
                                      if (selectedTab == entry.key) Container(width: 40, height: 2, color: Colors.black),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 15),
                          Text.rich(
                            TextSpan(
                              style: const TextStyle(fontSize: 13, color: Colors.grey, height: 1.6),
                              children: [
                                TextSpan(text: widget.product.description),
                                const TextSpan(text: '...Read', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 55,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF5F5F5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF4E8D0),
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    child: const Center(
                                      child: Text('Start', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF8B7355))),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage()));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      child: const Center(
                                        child: Text('Place To Bag', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)),
                                      ),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 