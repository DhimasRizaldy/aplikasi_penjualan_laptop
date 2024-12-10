import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import pustaka ikon

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Profil Toko'),
      //   backgroundColor: Colors.blueAccent,
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Gambar Profil Toko
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  'https://ik.imagekit.io/xnl4hkzkx/putrakom.jpg?updatedAt=1726633748001',
                ),
              ),
              SizedBox(height: 20),

              // Nama Toko
              Text(
                "Putra Komputer",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 10),

              // Deskripsi
              Text(
                "Putra Komputer adalah toko elektronik terpercaya yang menyediakan berbagai jenis laptop dan aksesoris dengan harga kompetitif. Kami berdedikasi memberikan pelayanan terbaik kepada pelanggan.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 20),

              // Informasi Kontak
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: Icon(Icons.phone, color: Colors.blueAccent),
                        title: Text("Kontak"),
                        subtitle: Text("+62 812-3456-7890"),
                      ),
                      Divider(),
                      ListTile(
                        leading:
                            Icon(Icons.location_on, color: Colors.blueAccent),
                        title: Text("Alamat"),
                        subtitle: Text("Jl. Raya Utama No.123, Jakarta"),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.email, color: Colors.blueAccent),
                        title: Text("Email"),
                        subtitle: Text("putra.komputer@email.com"),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Media Sosial
              Text(
                "Ikuti Kami",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.blue),
                    onPressed: () {
                      // Tambahkan navigasi ke Facebook
                    },
                  ),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.whatsapp, color: Colors.green),
                    onPressed: () {
                      // Tambahkan navigasi ke WhatsApp
                    },
                  ),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.instagram, color: Colors.pink),
                    onPressed: () {
                      // Tambahkan navigasi ke Instagram
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Tombol "Hubungi Kami"
              ElevatedButton(
                onPressed: () {
                  // Tambahkan fungsi untuk menghubungi toko
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Hubungi Kami",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
