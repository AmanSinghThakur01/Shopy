import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopy/model/model.dart';

class ApiServices {
  Future<List<Model>> getData() async {
    final response = await http.get(Uri.parse("https://api.escuelajs.co/api/v1/products"));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((item) => Model.fromJson(item)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }
}
