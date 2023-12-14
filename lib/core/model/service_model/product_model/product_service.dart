import 'dart:convert';
import 'package:dish_dash/core/model/service_model/product_model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  final String baseUrl;

  ProductService({this.baseUrl = 'https://10.0.2.2:7184'});

  Future<List<Product>> fetchAllClotheProducts() async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/api/products/allProducts?categoryId=2'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse.map((item) => Product.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      throw Exception('Failed to load products');
    }
  }

  Future<List<Product>> fetchAllTechProducts() async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/api/products/allProducts?categoryId=1'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse.map((item) => Product.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      throw Exception('Failed to load products');
    }
  }

  Future<List<Product>> fetchAllEducationProducts() async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/api/products/allProducts?categoryId=3'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse.map((item) => Product.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      throw Exception('Failed to load products');
    }
  }

  Future<List<Product>> fetchAllSportsProducts() async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/api/products/allProducts?categoryId=4'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse.map((item) => Product.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      throw Exception('Failed to load products');
    }
  }

  Future<List<Product>> fetchAllFavoriteProducts() async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/api/products/allProducts?categoryId=5'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse.map((item) => Product.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load favorite products');
      }
    } catch (error) {
      throw Exception('Failed to load favorite products: $error');
    }
  }
}
