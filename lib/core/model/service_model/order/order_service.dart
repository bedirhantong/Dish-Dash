import 'dart:convert';
import 'package:http/http.dart' as http;
import 'order_model.dart';

class OrderService {
  final String baseUrl;

  OrderService({this.baseUrl = 'https://10.0.2.2:7184'});

  Future<List<OrderModel>> fetchAllOrderProducts() async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl/api/users/allOrders'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        List<OrderModel> orders =
            jsonList.map((json) => OrderModel.fromJson(json)).toList();
        return orders;
      } else {
        throw Exception('Failed to load all order products');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
