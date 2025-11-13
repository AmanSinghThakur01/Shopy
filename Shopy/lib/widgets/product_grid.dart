import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/provider/api_provider.dart';
import 'package:shopy/widgets/product_detail_page.dart';

class ProductGrid extends StatefulWidget {
  const ProductGrid({super.key});

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  @override
  void initState() {
    super.initState();
    Provider.of<ApiProvider>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ApiProvider>(context);

    if (provider.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: provider.products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.75, // Adjusted for better ratio
      ),
      itemBuilder: (context, index) {
        final product = provider.products[index];

        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(product: product),));
          },
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
                // Image container - Takes maximum available space
                Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.network(
                      product.images != null && product.images!.isNotEmpty
                          ? product.images!.first
                          : "https://via.placeholder.com/150",
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),

                // Text section - Fixed space at bottom
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title ?? "No Title",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "₹${product.price ?? 'N/A'}",
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