// widgets/product_detail_page.dart
import 'package:flutter/material.dart';
import 'package:shopy/presentation/user/screens/CartScreen.dart';
import 'package:shopy/services/wishlish_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../services/buynow_screen.dart';

class ProductDetailPage extends StatefulWidget {
  final Map<String, dynamic> product;

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
    final List images = widget.product["images"] ?? [];
    final double rating = widget.product["rating"] ?? 0.0;
    final int ratingCount = widget.product["ratingCount"] ?? 0;
    final String category = widget.product["category"] ?? "Unknown";
    final double price = (widget.product["price"] ?? 0.0);
    final double priceInINR = price * 83; // USD to INR

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // SliverAppBar with images
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
                  if (isInWishlist) {
                    WishlistManager.addToWishlist(widget.product);
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Added to Wishlist ❤️")));
                  } else {
                    WishlistManager.removeFromWishlist(widget.product["title"]);
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Removed from Wishlist")));
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.share, color: Colors.black),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: FaIcon(FontAwesomeIcons.link,color: Colors.grey.shade800,),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(content: Text("Copy Link clicked")));
                                  },
                                ),
                                const Text("Copy Link", style: TextStyle(fontSize: 12)),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: FaIcon(FontAwesomeIcons.whatsapp, color: Colors.green),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(content: Text("WhatsApp clicked")));
                                  },
                                ),
                                const Text("WhatsApp", style: TextStyle(fontSize: 12)),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: FaIcon(FontAwesomeIcons.instagram,color: Colors.pink,),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(content: Text("Instagram clicked")));
                                  },
                                ),
                                const Text("Instagram", style: TextStyle(fontSize: 12)),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: FaIcon(FontAwesomeIcons.telegram,color: Colors.indigoAccent,),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(content: Text("Telegram clicked")));
                                  },
                                ),
                                const Text("Telegram", style: TextStyle(fontSize: 12)),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              )

            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.grey.shade100,
                child: images.isNotEmpty
                    ? Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    PageView.builder(
                      itemCount: images.length,
                      onPageChanged: (index) {
                        setState(() => currentImageIndex = index);
                      },
                      itemBuilder: (context, index) {
                        return Image.network(
                          images[index],
                          fit: BoxFit.contain,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey.shade200,
                              child: const Center(
                                child: Icon(
                                  Icons.image_not_supported,
                                  size: 80,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    Positioned(
                      bottom: 16,
                      child: Row(
                        children: List.generate(
                          images.length,
                              (index) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: currentImageIndex == index ? 12 : 8,
                            height: currentImageIndex == index ? 12 : 8,
                            decoration: BoxDecoration(
                              color: currentImageIndex == index
                                  ? Colors.pinkAccent
                                  : Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
                    : const Center(
                  child: Icon(Icons.image, size: 80, color: Colors.grey),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category Badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.blue.shade200),
                    ),
                    child: Text(
                      category.toUpperCase(),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Product Title
                  Text(
                    widget.product["title"] ?? "Product Name",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Rating Row
                  Row(
                    children: [
                      ...List.generate(5, (index) {
                        if (index < rating.floor()) {
                          return const Icon(Icons.star, color: Colors.amber, size: 20);
                        } else if (index < rating) {
                          return const Icon(Icons.star_half, color: Colors.amber, size: 20);
                        } else {
                          return Icon(Icons.star_border, color: Colors.grey.shade400, size: 20);
                        }
                      }),
                      const SizedBox(width: 8),
                      Text(
                        "${rating.toStringAsFixed(1)} ($ratingCount reviews)",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Price Section
                  Row(
                    children: [
                      Text(
                        "₹${priceInINR.toStringAsFixed(0)}",
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        "₹${(priceInINR * 1.5).toStringAsFixed(0)}",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade500,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                  const SizedBox(height: 8),

                  Text(
                    "Original Price: \$${price.toStringAsFixed(2)} USD",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 24),

                  const Divider(),
                  const SizedBox(height: 16),

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
                    widget.product["description"] ?? "No description available",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Divider(),
                  const SizedBox(height: 16),

                  const Text(
                    "Features & Benefits",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildFeatureItem(Icons.local_shipping, "Free Delivery", "On orders above ₹500"),
                  _buildFeatureItem(Icons.verified_user, "1 Year Warranty", "Manufacturer warranty included"),
                  _buildFeatureItem(Icons.currency_rupee, "Cash on Delivery", "Pay when you receive"),
                  _buildFeatureItem(Icons.refresh, "7 Days Return", "Easy return & refund policy"),
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
            BoxShadow(color: Colors.black12, blurRadius: 10, offset: const Offset(0, -2)),
          ],
        ),
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    CartlistManager.addToCartlist(widget.product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("${widget.product["title"]} added to cart! 🛒"),
                        duration: const Duration(seconds: 2),
                        action: SnackBarAction(
                          label: 'VIEW',
                          onPressed: () {
                            Navigator.push(

                              context,
                              MaterialPageRoute(builder: (_) => const Cartscreen()),
                            );
                          },
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.shopping_cart),
                  label: const Text("Add to Cart"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.redAccent,
                    side: const BorderSide(color: Colors.redAccent, width: 2),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
              const SizedBox(width: 12),

      Expanded(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BuyNowScreen(product: widget.product),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text("Buy Now"),
        ),
      ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.blue.shade700, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// CART MANAGER
class CartlistManager {
  static List<Map<String, dynamic>> cartlist = [];

  static void addToCartlist(Map<String, dynamic> product) {
    bool exists = cartlist.any((item) => item["title"] == product["title"]);
    if (!exists) cartlist.add(product);
  }

  static void removeFromCartlist(String title) {
    cartlist.removeWhere((item) => item["title"] == title);
  }
}
