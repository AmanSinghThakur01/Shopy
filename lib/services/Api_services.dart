import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  static Future<void> GetData() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/products'));
    if (response.statusCode==200){
      final Product = json.decode(response.body);
      print(Product);
    }
    else {
      print("request faileed");
    }
  }
}