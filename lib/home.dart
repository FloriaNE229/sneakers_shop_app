import 'package:flutter/material.dart';
import 'product_details.dart';

/// Page d'accueil
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
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
                    // Status bar fake
                    Container(
                      height: 44,
                      color: const Color(0xFFFAFAFA),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            '9:41',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.signal_cellular_4_bar, size: 16),
                              SizedBox(width: 5),
                              Icon(Icons.wifi, size: 16),
                              SizedBox(width: 5),
                              Icon(Icons.battery_full, size: 20),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Top icons
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.grey[300],
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black
                                              .withValues(alpha: 0.08),
                                          blurRadius: 8,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: const Icon(Icons.search,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 30),

                              // Title
                              const Text.rich(
                                TextSpan(
                                  style: TextStyle(fontSize: 32, height: 1.3),
                                  children: [
                                    TextSpan(
                                      text: 'Experience ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xFF333333),
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          'the Ultimate Shopping With Nike!',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 25),

                              // Categories
                              SizedBox(
                                height: 45,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  children: const [
                                    CategoryChip(
                                        text: 'Sneakers', active: true),
                                    CategoryChip(
                                        text: 'Basketball', active: false),
                                    CategoryChip(
                                        text: 'Gym Shoes', active: false),
                                    CategoryChip(text: 'Soccer', active: false),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 30),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Style Meets Comfort',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'View All',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 8),

                              const Text(
                                'Nike sneakers offer ultimate comfort.',
                                style: TextStyle(color: Colors.grey),
                              ),

                              const SizedBox(height: 20),

                              // ✅ CARTE CLIQUABLE → ouvre Details()
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const Details(),
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
                                      colors: [
                                        Color(0xFF6B5D41),
                                        Color(0xFF6B5D41),
                                        Color(0xFFF4E8D0),
                                        Color(0xFFF4E8D0),
                                      ],
                                      stops: [0, 0.5, 0.5, 1],
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      const Center(
                                        child: Text(
                                          'NIKE',
                                          style: TextStyle(
                                            fontSize: 120,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.white,
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
                                              color: Colors.white.withValues(
                                                  alpha: 0.1),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: const Icon(
                                              Icons
                                                  .add_photo_alternate_outlined,
                                              size: 60,
                                              color: Colors.white54,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: 16,
                                        top: 16,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 6,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.black
                                                .withValues(alpha: 0.15),
                                            borderRadius:
                                                BorderRadius.circular(999),
                                          ),
                                          child: const Text(
                                            'Tap',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
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
                  ],
                ),

                // Bottom navigation (UI)
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        NavItem(icon: Icons.home, active: true),
                        NavItem(icon: Icons.search),
                        NavItem(icon: Icons.favorite_border),
                        NavItem(icon: Icons.person_outline),
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

/// Category widget
class CategoryChip extends StatelessWidget {
  final String text;
  final bool active;

  const CategoryChip({
    super.key,
    required this.text,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: BoxDecoration(
        color: active ? const Color(0xFFF4E8D0) : Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: active ? const Color(0xFF8B7355) : Colors.grey[600],
        ),
      ),
    );
  }
}

/// Navigation item
class NavItem extends StatelessWidget {
  final IconData icon;
  final bool active;

  const NavItem({
    super.key,
    required this.icon,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: active ? const Color(0xFFF4E8D0) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Icon(
        icon,
        color: active ? const Color(0xFF8B7355) : Colors.grey,
        size: 24,
      ),
    );
  }
}
