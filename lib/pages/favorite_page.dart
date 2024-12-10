import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  final List<Map<String, dynamic>> favorites; // Ubah tipe data ke dynamic

  const FavoritePage({Key? key, required this.favorites}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: favorites.isEmpty
          ? Center(
              child: Text(
                'Belum ada produk favorit!',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            )
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final product = favorites[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        product['image'] ?? 'https://via.placeholder.com/150',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      product['name'] ?? 'Produk',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      product['price'] ?? 'Harga tidak tersedia',
                      style: TextStyle(color: Colors.green),
                    ),
                    trailing: Icon(Icons.favorite, color: Colors.red),
                  ),
                );
              },
            ),
    );
  }
}
