import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<Map<String, dynamic>> GetData() async {
    final response = await http.get(Uri.parse("https://dummyjson.com/products"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Failed to load products");
    }
  }
}
