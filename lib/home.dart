import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

// Mon application Nike
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

// La page d'accueil
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mettre la barre de statut transparente
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: Color(0xFFE8E8E8),
      
      // Tout le contenu de la page
      body: Center(
        child: Container(
          // Taille d'un iPhone
          width: 390,
          height: 844,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 30,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Stack(
              children: [
                Column(
                  children: [
                    // Barre de statut (heure, wifi, batterie)
                    Container(
                      height: 44,
                      color: Color(0xFFFAFAFA),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '9:41',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
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
                    ),
                    
                    // Le contenu qui défile
                    Expanded(
                      child: Container(
                        color: Color(0xFFFAFAFA),
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // En haut : photo de profil et icône de recherche
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Photo de profil ronde avec icône
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
                                    // Bouton recherche avec ombre
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.08),
                                            blurRadius: 8,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Icon(Icons.search, color: Colors.grey, size: 20),
                                    ),
                                  ],
                                ),
                                
                                SizedBox(height: 30),
                                
                                // Le titre principal (partie normale + partie en gras)
                                Text.rich(
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
                                        text: 'the Ultimate Shopping With Nike!',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                
                                SizedBox(height: 25),
                                
                                // Les catégories (Sneakers, Basketball, etc.)
                                SizedBox(
                                  height: 45,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    physics: BouncingScrollPhysics(),
                                    children: [
                                      _buildCategory('Sneakers', true),
                                      _buildCategory('Basketball', false),
                                      _buildCategory('Gym Shoes', false),
                                      _buildCategory('Soccer', false),
                                    ],
                                  ),
                                ),
                                
                                SizedBox(height: 30),
                                
                                // Titre de section
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Style Meets Comfort',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'View All',
                                      style: TextStyle(fontSize: 14, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                
                                SizedBox(height: 8),
                                
                                // Sous-titre
                                Text(
                                  'Nike sneakers offer ultimate comfort.',
                                  style: TextStyle(fontSize: 14, color: Colors.grey),
                                ),
                                
                                SizedBox(height: 20),
                                
                                // La carte qui contient la chaussure
                                Container(
                                  height: 320,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFF6B5D41),
                                        Color(0xFF6B5D41),
                                        Color(0xFFF4E8D0),
                                        Color(0xFFF4E8D0),
                                      ],
                                      stops: [0.0, 0.5, 0.5, 1.0],
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      // Texte NIKE en arrière-plan (en blanc maintenant)
                                      Center(
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
                                      
                                      // L'image de la chaussure (tournée)
                                      Center(
                                        child: Transform.rotate(
                                          angle: -0.4,
                                          child: Container(
                                            width: 280,
                                            height: 280,
                                            decoration: BoxDecoration(
                                              color: Colors.white.withOpacity(0.1),
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            child: Icon(
                                              Icons.add_photo_alternate_outlined,
                                              size: 60,
                                              color: Colors.white54,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                
                                SizedBox(height: 90),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                
                // Le menu du bas (positionné par-dessus)
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
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          offset: Offset(0, 5),
                        ),
                      ],
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
  
  // Fonction pour créer une catégorie
  Widget _buildCategory(String text, bool isActive) {
    return Container(
      margin: EdgeInsets.only(right: 12),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: BoxDecoration(
        color: isActive ? Color(0xFFF4E8D0) : Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isActive ? Color(0xFF8B7355) : Colors.grey[600],
          ),
        ),
      ),
    );
  }
  
  // Fonction pour créer un bouton de navigation
  Widget _buildNavItem(IconData icon, bool isActive) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isActive ? Color(0xFFF4E8D0) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Icon(
        icon,
        color: isActive ? Color(0xFF8B7355) : Colors.grey,
        size: 24,
      ),
    );
  }
}