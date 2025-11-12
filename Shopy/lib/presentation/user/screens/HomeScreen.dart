import 'package:flutter/material.dart';
import 'package:shopy/widgets/product_grid.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final List<Map<String, String>> categories = [
    {"name": "Beauty", "image": "assets/beauty.jpg"},
    {"name": "Fashion", "image": "assets/fashion.jpg"},
    {"name": "Kids", "image": "assets/kids.jpg"},
    {"name": "Mens", "image": "assets/man.jpg"},
    {"name": "Womens", "image": "assets/women.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Stylish",
          style: TextStyle(
            fontSize: 22,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage("https://via.placeholder.com/150"),
              radius: 18,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search
              TextField(
                decoration: InputDecoration(
                  hintText: " Search any Product.....",
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
        
              // All Featured header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    " All Featured ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      TextButton.icon(
                        onPressed: () => debugPrint("Sort clicked"),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        icon: const Icon(Icons.sort, color: Colors.black, size: 18),
                        label: const Text("Sort", style: TextStyle(color: Colors.black, fontSize: 14)),
                      ),
                      const SizedBox(width: 8),
                      TextButton.icon(
                        onPressed: () => debugPrint("Filter clicked"),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        icon: const Icon(Icons.filter_list, color: Colors.black, size: 18),
                        label: const Text("Filter", style: TextStyle(color: Colors.black, fontSize: 14)),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 25),
        
              // Categories horizontal list
              SizedBox(
                height: size.height * 0.11,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(category['image']!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            category['name']!,
                            style: const TextStyle(fontSize: 14),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
        
              // Banner
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: AssetImage('assets/banner.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                padding: const EdgeInsets.all(16),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Text(
                          " Upto ",
                          style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "70%",
                          style: TextStyle(color: Colors.yellow, fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          " Off",
                          style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Text(
                      " On trending items",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text("Button clicked!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            backgroundColor: Colors.pinkAccent.withOpacity(0.3),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange.shade300,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: const BorderSide(color: Colors.white, width: 2),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.shopping_cart, size: 20),
                          SizedBox(width: 5),
                          Text("Shop Now", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
        
              // Product Grid
              ProductGrid(
              ),


            ],
          ),
        ),
      ),
    );
  }
}
