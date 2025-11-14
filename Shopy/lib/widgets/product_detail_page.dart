import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final Map<String, dynamic> product; // ← Model हटाकर Map कर दिया

  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int currentImageIndex = 0;
  bool isInWishlist = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final List images = widget.product["images"] ??
        [widget.product["image"]]; // single image fallback

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: size.height * 0.4,
            pinned: true,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  isInWishlist ? Icons.favorite : Icons.favorite_border,
                  color: Colors.redAccent,
                ),
                onPressed: () {
                  setState(() => isInWishlist = !isInWishlist);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(isInWishlist
                          ? "Added to Wishlist"
                          : "Removed from Wishlist"),
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.share, color: Colors.black),
                onPressed: () {},
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  PageView.builder(
                    itemCount: images.length,
                    onPageChanged: (i) {
                      setState(() => currentImageIndex = i);
                    },
                    itemBuilder: (context, index) {
                      return Image.network(
                        images[index],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey.shade200,
                            child: const Icon(Icons.image_not_supported, size: 50),
                          );
                        },
                      );
                    },
                  ),

                  if (images.length > 1)
                    Positioned(
                      bottom: 16,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          images.length,
                              (index) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: currentImageIndex == index ? 24 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: currentImageIndex == index
                                  ? Colors.white
                                  : Colors.white54,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),

          // --- BODY CONTENT ---
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category removed because Map me category nahi tha

                  Text(
                    widget.product["title"] ?? "Product Name",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),

                  Row(
                    children: [
                      ...List.generate(
                        5,
                            (index) =>
                        const Icon(Icons.star, color: Colors.amber, size: 20),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "4.5 (120 reviews)",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Text(
                        "₹${widget.product["price"]}",
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        "₹${(widget.product["price"] ?? 0) * 1.5}",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade500,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          "33% OFF",
                          style: TextStyle(
                            color: Colors.green.shade700,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  const Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),

                  Text(
                    widget.product["description"] ??
                        "No description available",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),

                  const Text(
                    "Features",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),

                  _buildFeatureItem(Icons.local_shipping, "Free Delivery"),
                  _buildFeatureItem(Icons.verified_user, "1 Year Warranty"),
                  _buildFeatureItem(Icons.currency_rupee, "Cash on Delivery"),
                  _buildFeatureItem(Icons.refresh, "7 Days Return Policy"),

                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Added to cart!")),
                  );
                },
                icon: const Icon(Icons.shopping_cart),
                label: const Text("Add to Cart"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.redAccent,
                  side: const BorderSide(color: Colors.redAccent, width: 2),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Proceeding to checkout...")),
                  );
                },
                child: const Text("Buy Now"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.blue.shade700, size: 20),
          ),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
