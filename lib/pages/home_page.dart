import 'package:flutter/material.dart';
import 'details_page.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class HomePage extends StatefulWidget {
  final Function(Map<String, dynamic>) onFavorite;

  const HomePage({Key? key, required this.onFavorite}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> laptops = [];
  List<dynamic> filteredLaptops = [];
  String searchQuery = "";
  String selectedCategory = "Semua";

  final List<String> categories = [
    "Semua",
    "Gaming",
    "Office",
    "Ultrabook",
    "Budget"
  ];
  final List<String> banners = [
    "https://ik.imagekit.io/xnl4hkzkx/slide2.png?updatedAt=1725867897961",
    "https://ik.imagekit.io/xnl4hkzkx/slide1.png?updatedAt=1725867893835",
    "https://ik.imagekit.io/xnl4hkzkx/slide3.png?updatedAt=1725867890134"
  ];

  @override
  void initState() {
    super.initState();
    loadLaptops();
  }

  Future<void> loadLaptops() async {
    final String response =
        await rootBundle.loadString('assets/data/laptops.json');
    final List<dynamic> data = json.decode(response);
    setState(() {
      laptops = data;
      filteredLaptops = laptops;
    });
  }

  void filterLaptops() {
    setState(() {
      filteredLaptops = laptops.where((laptop) {
        final matchesSearch =
            laptop['name'].toLowerCase().contains(searchQuery.toLowerCase());
        final matchesCategory = selectedCategory == "Semua" ||
            laptop['category'] == selectedCategory;
        return matchesSearch && matchesCategory;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: "Cari Laptop...",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                    filterLaptops();
                  });
                },
              ),
              SizedBox(height: 20),

              // Slider Banner
              SizedBox(
                height: 150,
                child: PageView.builder(
                  itemCount: banners.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          banners[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),

              // Categories
              Text(
                "Kategori",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: ChoiceChip(
                        label: Text(categories[index]),
                        selected: selectedCategory == categories[index],
                        onSelected: (selected) {
                          setState(() {
                            selectedCategory = categories[index];
                            filterLaptops();
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),

              // Produk Terbaru
              Text(
                "Produk",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = 2;
                  if (constraints.maxWidth > 600) {
                    crossAxisCount = 3;
                  }
                  if (constraints.maxWidth > 900) {
                    crossAxisCount = 4;
                  }
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: filteredLaptops.length,
                    itemBuilder: (context, index) {
                      final laptop = filteredLaptops[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                product: laptop,
                                onFavorite: widget.onFavorite,
                              ),
                            ),
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AspectRatio(
                                aspectRatio: 1.5,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(12),
                                  ),
                                  child: Image.network(
                                    laptop["image"],
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      laptop["name"],
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      laptop["price"],
                                      style: TextStyle(
                                          fontSize: 11, color: Colors.green),
                                    ),
                                    SizedBox(height: 6),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blueAccent,
                                        minimumSize: Size(double.infinity, 30),
                                      ),
                                      child: Text("Beli"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
