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
        ProductsData =
        data['products']; // Extract products array from JSON response
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
      body: SafeArea(child:
      GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              childAspectRatio: 0.75), // Added this to give more height
          itemCount: ProductsData.length,
          itemBuilder: (context, index) {
            final product = ProductsData[index];
            return Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.0)
              ),

              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.favorite_border_outlined,
                        color: Colors.red,
                      )
                    ],
                  ),
                  Expanded( // Added Expanded here
                    child: SizedBox(
                      height: 130,
                      width: 130,
                      child: Image.network(
                        product['thumbnail'], fit: BoxFit.cover,),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(product['title'],
                        maxLines: 2, // Added maxLines
                        overflow: TextOverflow.ellipsis, // Added overflow handling
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14, // Reduced font size slightly
                          fontWeight: FontWeight.bold,
                        )
                    ),
                  ),
                  Text('\$${product['price'].toString()}'
,style: TextStyle(
                      fontSize: 15,

                    ),                  )

                ],
              ),
            );
          }),
      )
    );
  }
}