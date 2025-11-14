import 'package:flutter/material.dart';
import 'package:shopy/widgets/product_detail_page.dart';

class Wishlistscreen extends StatefulWidget {
  const Wishlistscreen({super.key});

  @override
  State<Wishlistscreen> createState() => _WishlistscreenState();
}

class _WishlistscreenState extends State<Wishlistscreen> {

  // ------------------ LOCAL STATIC WATCHLIST ------------------
  List<Map<String, dynamic>> watchlist = [
    {
      "id": 1,
      "title": "Demo Product 1",
      "price": 499,
      "image": "https://via.placeholder.com/300",
      "description": "Sample product description",
    },
    {
      "id": 2,
      "title": "Demo Product 2",
      "price": 899,
      "image": "https://via.placeholder.com/300",
      "description": "Sample product description",
    },
  ];
  // ------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Shopy",
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: width * 0.055,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(Icons.person, color: Colors.blueAccent),
          )
        ],
      ),

      // ----------------- CHECK EMPTY WISHLIST -----------------
      body: watchlist.isEmpty
          ? Center(
        child: Text(
          "Your Wishlist is Empty",
          style: TextStyle(
            fontSize: width * 0.05,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ),
      )

      // ----------------- GRID VIEW FOR WISHLIST -----------------
          : GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: width < 600 ? 2 : 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.65,
        ),
        itemCount: watchlist.length,
        itemBuilder: (context, index) {
          final product = watchlist[index];

          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailPage(
                    product: product, // Map pass ho raha hai
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                border: Border.all(color: Colors.black12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // IMAGE
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12)),
                      child: Image.network(
                        product["image"] ?? "",
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  // TITLE
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      product["title"] ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: width * 0.035,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  // PRICE
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                    child: Text(
                      "₹ ${product["price"]}",
                      style: TextStyle(
                        fontSize: width * 0.032,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // REMOVE BUTTON
                  Center(
                    child: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          watchlist.removeAt(index);
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Removed from Wishlist"),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
