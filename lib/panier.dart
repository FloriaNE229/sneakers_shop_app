import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Product {
  final int id;
  final String name;
  final String subtitle;
  final String collaboration;
  final double price;
  final List<String> colors;
  final List<String> sizes;
  final String imageUrl;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.collaboration,
    required this.price,
    required this.colors,
    required this.sizes,
    required this.imageUrl,
    required this.description,
  });
}

List<Product> getAllProducts() {
  return [
    Product(
      id: 1,
      name: 'Air Jordan 1',
      subtitle: 'Low Retro OG',
      collaboration: 'X TRAVIS SCOTT',
      price: 120,
      colors: ['Olive', 'Cream'],
      sizes: ['5Y', '5.5Y', '6Y', '6.5Y'],
      imageUrl: 'assets/images/jordan1_olive.png',
      description: 'Every Jordan Retro is a classic sneaker done up in new colors and textures for a fresh look. With smooth leather, this iteration gives little feet stand out style. Plus, premium materials',
    ),
    Product(
      id: 2,
      name: 'Air Jordan 1',
      subtitle: 'Chicago',
      collaboration: 'X NIKE',
      price: 120,
      colors: ['Red', 'White'],
      sizes: ['5Y', '5.5Y', '6Y', '6.5Y'],
      imageUrl: 'assets/images/jordan1_chicago.png',
      description: 'The classic Chicago colorway brings iconic style to your feet. Premium materials and timeless design make this a must-have.',
    ),
    Product(
      id: 3,
      name: 'Air Jordan 1',
      subtitle: 'Black Toe',
      collaboration: 'X JORDAN',
      price: 130,
      colors: ['Black', 'White', 'Red'],
      sizes: ['5Y', '5.5Y', '6Y', '6.5Y'],
      imageUrl: 'assets/images/jordan1_blacktoe.png',
      description: 'The Black Toe design combines classic elements with modern comfort. Perfect for any sneaker collection.',
    ),
  ];
}

class CartItem {
  Product product;
  int quantity;
  CartItem({required this.product, required this.quantity});
}

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> cartItems = [
    CartItem(product: getAllProducts()[0], quantity: 1),
    CartItem(product: getAllProducts()[1], quantity: 1),
  ];

  double deliveryFee = 13.0;

  double _calculateSubtotal() {
    double total = 0;
    for (var item in cartItems) {
      total += item.product.price * item.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    double subtotal = _calculateSubtotal();

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
                    color: const Color(0xFFF5F5F5),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Cart', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black)),
                                Icon(Icons.delete_outline, color: Color(0xFFFF6B6B), size: 24),
                              ],
                            ),
                            const SizedBox(height: 20),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: cartItems.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 150,
                                        height: 150,
                                        child: GridView.count(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 8,
                                          mainAxisSpacing: 8,
                                          physics: const NeverScrollableScrollPhysics(),
                                          children: List.generate(4, (i) {
                                            return Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(15),
                                                color: const Color(0xFFE0E0E0),
                                              ),
                                              child: const Icon(Icons.image, size: 30, color: Colors.white),
                                            );
                                          }),
                                        ),
                                      ),
                                      const SizedBox(width: 15),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(cartItems[index].product.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)),
                                            const SizedBox(height: 5),
                                            Text('\$${cartItems[index].product.price.toInt()}', style: const TextStyle(fontSize: 14, color: Colors.grey)),
                                            const SizedBox(height: 15),
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    if (cartItems[index].quantity > 1) {
                                                      setState(() => cartItems[index].quantity--);
                                                    }
                                                  },
                                                  child: Container(
                                                    width: 28,
                                                    height: 28,
                                                    decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                                                    child: const Icon(Icons.remove, color: Colors.black, size: 16),
                                                  ),
                                                ),
                                                const SizedBox(width: 15),
                                                Text('0${cartItems[index].quantity}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)),
                                                const SizedBox(width: 15),
                                                GestureDetector(
                                                  onTap: () => setState(() => cartItems[index].quantity++),
                                                  child: Container(
                                                    width: 28,
                                                    height: 28,
                                                    decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF8B7355)),
                                                    child: const Icon(Icons.add, color: Colors.white, size: 16),
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
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Delivery Fee:', style: TextStyle(fontSize: 14, color: Colors.grey)),
                                Text('\$${deliveryFee.toStringAsFixed(2)}', style: const TextStyle(fontSize: 14, color: Colors.grey)),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Subtotal:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black)),
                                Text('\$${subtotal.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black)),
                              ],
                            ),
                            const SizedBox(height: 30),
                            Container(
                              width: double.infinity,
                              height: 60,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF4E8D0),
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [BoxShadow(color: const Color(0xFFF4E8D0).withValues(alpha: 0.4), blurRadius: 15, offset: const Offset(0, 5))],
                              ),
                              child: const Center(child: Text('Checkout', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF8B7355)))),
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
    );
  }
}