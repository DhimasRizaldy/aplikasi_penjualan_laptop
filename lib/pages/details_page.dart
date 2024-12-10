import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final Map<String, dynamic> product; // Data lengkap produk
  final Function(Map<String, dynamic>)
      onFavorite; // Callback untuk menambahkan favorit

  const DetailsPage({
    Key? key,
    required this.product,
    required this.onFavorite,
  }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int quantity = 1;
  bool isFavorite = false; // Status apakah produk di favorit atau tidak.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product['name']),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.white,
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
                if (isFavorite) {
                  widget.onFavorite(widget.product); // Tambahkan ke favorit
                }
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    isFavorite
                        ? "Berhasil menambahkan ke Favorit!"
                        : "Dihapus dari Favorit!",
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar Produk
              Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      widget.product['image'],
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Nama Produk
              Text(
                widget.product['name'],
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 10),

              // Harga
              Text(
                "Harga: ${widget.product['price']}",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 20),

              // Deskripsi
              Text(
                widget.product['description'],
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
              SizedBox(height: 20),

              // Spesifikasi
              if (widget.product.containsKey('specifications')) ...[
                Text(
                  "Spesifikasi:",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      widget.product['specifications'].keys.map<Widget>((key) {
                    return Text(
                      "$key: ${widget.product['specifications'][key]}",
                      style: TextStyle(fontSize: 18),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
              ],

              // Pilihan Jumlah
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Jumlah:", style: TextStyle(fontSize: 18)),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove, color: Colors.blueAccent),
                        onPressed: () {
                          setState(() {
                            if (quantity > 1) quantity--;
                          });
                        },
                      ),
                      Text(
                        "$quantity",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: Icon(Icons.add, color: Colors.blueAccent),
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Tombol Tambahkan ke Keranjang
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Berhasil menambahkan ke keranjang!"),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Tambahkan ke Keranjang",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
