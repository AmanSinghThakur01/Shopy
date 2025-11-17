import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class ApiService {
  static const String baseUrl = "https://dummyjson.com";

  // GET PRODUCTS
  Future<List<dynamic>> fetchProducts() async {
    final url = Uri.parse("$baseUrl/products");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return body["products"]; // returning List
    } else {
      throw Exception("Failed to load products");
    }
  }
}
