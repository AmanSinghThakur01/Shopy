import 'package:flutter/material.dart';
import 'package:shopy/widgets/product_detail_page.dart';

// Dummy static products (API हटाया गया)
class DummyProduct {
  final String title;
  final String image;
  final int price;

  DummyProduct({required this.title, required this.image, required this.price});
}

class ProductGrid extends StatelessWidget {
  ProductGrid({super.key});

  // ------ STATIC PRODUCTS ------
  final List<DummyProduct> products = [
    DummyProduct(
      title: "Product 1",
      image: "https://placehold.co/300",
      price: 499,
    ),
    DummyProduct(
      title: "Product 2",
      image: "https://placehold.co/300",
      price: 699,
    ),
    DummyProduct(
      title: "Product 3",
      image: "https://placehold.co/300",
      price: 899,
    ),
    DummyProduct(
      title: "Product 4",
      image: "https://placehold.co/300",
      price: 299,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        final product = products[index];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailPage(
                  product: {
                    "title": product.title,
                    "price": product.price,
                    "description": "Sample description here...",
                    "image": product.image,   // single image
                    "images": [product.image] // multiple images fallback
                  },
                ),
              ),
            );
          }
,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Product Image
                Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: Image.network(
                      product.image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),

                // Product Details
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "₹${product.price}",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
