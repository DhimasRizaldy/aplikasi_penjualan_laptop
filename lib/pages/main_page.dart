import 'package:flutter/material.dart';
import 'home_page.dart';
import 'favorite_page.dart';
import 'profile_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  // Daftar produk favorit
  List<Map<String, dynamic>> favorites = [];

  final List<String> _titles = ["Home", "Favorite", "Profile"];

  // Method untuk menambahkan produk ke favorit
  void addToFavorites(Map<String, dynamic> product) {
    if (!favorites.any((item) => item['name'] == product['name'])) {
      setState(() {
        favorites.add(product);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
                Text("${product['name']} berhasil ditambahkan ke favorit!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          title: Text(
            _titles[_selectedIndex],
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          elevation: 10,
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomePage(onFavorite: addToFavorites), // Pass method ke HomePage
          FavoritePage(favorites: favorites), // Pass favorites ke FavoritePage
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            backgroundColor: Colors.white,
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
