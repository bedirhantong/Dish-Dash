import 'dart:convert';
import 'package:dish_dash/core/model/service_model/product_model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  final String baseUrl;

  ProductService({this.baseUrl = 'https://10.0.2.2:7184'});
  Future<List<Product>> fetchAllProducts(int categoryId) async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/api/products/allProducts/$categoryId'));

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

  Future<void> addProductToFavorites(int productId) async {
    try {
      final response = await http
          .put(Uri.parse('$baseUrl/api/products/addToFavorite/$productId'));

      if (response.statusCode == 200) {
        // Product added to Favorite successfully
        print('Product added to Favorite successfully');
      } else {
        throw Exception('Failed to add product to Favorite');
      }
    } catch (error) {
      throw Exception('Failed to add product to Favorite: $error');
    }
  }
}
