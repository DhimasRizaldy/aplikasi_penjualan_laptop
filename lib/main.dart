import 'package:flutter/material.dart';
import 'pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key})
      : super(key: key); // Gunakan konstanta untuk widget statis.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Penjualan Laptop', // Judul aplikasi.
      theme: ThemeData(
        primarySwatch: Colors.blue, // Tema utama aplikasi.
      ),
      home: MainPage(), // MainPage adalah halaman utama aplikasi.
      debugShowCheckedModeBanner:
          false, // Menghilangkan label debug di pojok kanan atas.
    );
  }
}
