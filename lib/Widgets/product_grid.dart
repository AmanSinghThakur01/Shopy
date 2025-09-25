
import 'package:flutter/material.dart';
import '../services/Api_services.dart';

class Productgrid extends StatefulWidget {
  const Productgrid({super.key});
  @override
  State<Productgrid> createState() => _ProductgridState();
}

class _ProductgridState extends State<Productgrid> {
  var ProductsData;
  bool isLoading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    fetchProductsData();
  }

  void fetchProductsData() async {
    try {
      final data = await ApiService.GetData();
      setState(() {
        ProductsData = data['products']; // Extract products array from JSON response
        isLoading = false;
      });
    }
    catch (e) {
      setState(() {
        error = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    if (error != null) {
      return Scaffold(
          body: Center(child: Text(" Error : $error"))
      );
    }
    return Scaffold(
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
          itemCount: ProductsData.length,
          itemBuilder: (context, index) {
            final product = ProductsData[index];
            return Padding(
              padding: const EdgeInsets.all(1),
              child: Container(
                margin: EdgeInsets.all(1),
                color: Colors.pink[50],
                child: Column(
                  children: [
                    Image.network(product['thumbnail'],
                      width: 130,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                    Text(product['title']),
                    Text('\$${product['price']}'),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
