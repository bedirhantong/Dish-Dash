import 'package:dish_dash/core/model/service_model/user/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService {
  final String baseUrl;

  UserService({this.baseUrl = 'https://10.0.2.2:7184'});

  Future<void> addUser(UserModel user) async {
    try {
      final response = await http.post(Uri.parse('$baseUrl/api/users'));

      if (response.statusCode == 201) {
        // User added successfully
        print('User added successfully');
      } else {
        throw Exception('Failed to add user');
      }
    } catch (error) {
      throw Exception('Failed to add user: $error');
    }
  }

  Future<List<UserModel>> fetchAllUsers() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/api/users'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse.map((item) => UserModel.fromJson(item)).toList();
      } else {
        throw Exception();
      }
    } catch (error) {
      throw Exception('Failed to find user: $error');
    }
  }

  Future<UserModel> findUserByEmail(String email) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/api/users/$email'));

      if (response.statusCode == 201) {
        final dynamic jsonResponse = json.decode(response.body);
        print("başarılı");
        return jsonResponse.map((item) => UserModel.fromJson(item)).toList();
      } else {
        throw Exception();
      }
    } catch (error) {
      throw Exception('Failed to find user: $error');
    }
  }
}
