import 'package:flutter/material.dart';
import 'shoe.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double deliveryFee = 13.00; // Frais de livraison

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Cart",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
              onPressed: () {
                setState(() {
                  myCart.clear();
                });
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: myCart.length,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (context, index) {
                return buildCardArticle(index);
              },
            ),
          ),
          buildTotalPrice(),
        ],
      ),
    );
  }

  Widget buildCardArticle(int article) {
    final item = myCart[article];
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[200]!.withOpacity(0.5),
        borderRadius: BorderRadius.circular(30),
      ),

      child: Column(
        children: [
          // Collage d'images
          Row(
            children: [
              // Image principale (Gauche)
              Expanded(
                flex: 2,
                child: Container(
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(item.shoe.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 8),

              // Petites images (Droite)
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 76,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(item.shoe.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    Container(
                      height: 76,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(item.shoe.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          // Infos du l'article et Sélecteur de quantité
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.shoe.model,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    "\$${item.shoe.price}",
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),

              // Sélecteur de quantité (Boutons - 01 +)
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.grey.shade100),
                ),
                child: Row(
                  children: [
                    buildQuantityBtn(Icons.remove, () {
                      if (item.quantity > 1) {
                        setState(() {
                          item.quantity--;
                        });
                      }
                    }),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        '${item.quantity}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    buildQuantityBtn(
                      Icons.add,
                      () {
                        setState(() {
                          item.quantity++;
                        });
                      },
                      isPrimary: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildQuantityBtn( IconData icon, VoidCallback onTap, { bool isPrimary = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: isPrimary ? const Color(0xFF7B6132) : Colors.grey[100],
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 16,
          color: isPrimary ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  Widget buildTotalPrice() {
    double subtotal = 0;
    for (var item in myCart) {
      subtotal += item.shoe.price * item.quantity;
    } 
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Delivery Fee:",
                style: TextStyle(color: Colors.grey[500], fontSize: 16),
              ),
              Text(
                "\$${deliveryFee.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Subtotal:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "\$${(subtotal + deliveryFee).toStringAsFixed(2)}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: double.infinity,
            height: 65,
            child: ElevatedButton(
              onPressed: () {
                // On affiche le message de succès
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text(
                      "Paid successfully!",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Colors.green,
                    behavior: SnackBarBehavior.floating, // Pour qu'il soit arrondi et flotte
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    duration: const Duration(seconds: 2),
                  ),
                );

    // 2. Optionnel : On vide le panier après le paiement
    setState(() {
      myCart.clear();
    });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF6E5B3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                elevation: 0,
              ),
              child: const Text(
                "Checkout",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
