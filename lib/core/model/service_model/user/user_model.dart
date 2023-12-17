import 'package:dish_dash/core/model/service_model/product/product_model.dart';

import '../order/order_model.dart';

class UserModel {
  String name;
  String email;
  String password;
  String shippingAddress;
  String photoLink;
  List<OrderModel> orderList;
  List<Product> favoriteList;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.shippingAddress,
    required this.photoLink,
    required this.orderList,
    required this.favoriteList,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"],
      email: json["email"],
      password: json["password"],
      shippingAddress: json["shippingAddress"],
      photoLink: json["photoLink"],
      orderList: (json["orderList"] as List<dynamic>?)
              ?.map((x) => OrderModel.fromJson(x))
              .toList() ??
          [],
      favoriteList: (json["favoriteList"] as List<dynamic>?)
              ?.map((x) => Product.fromJson(x))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "shippingAddress": shippingAddress,
        "photoLink": photoLink,
        "orderList": List<dynamic>.from(orderList.map((x) => x.toJson())),
        "favoriteList": List<dynamic>.from(favoriteList.map((x) => x.toJson())),
      };
}
//   final String name;
//   final String email;
//   final String password;
//   final String shippingAddress;
//   final String photoLink;
//   List<OrderModel> orderList;
//   List<Product> favoriteList;
//
//   UserModel({
//     required this.name,
//     required this.email,
//     required this.password,
//     required this.shippingAddress,
//     required this.photoLink,
//     required this.orderList,
//     required this.favoriteList,
//   });
//
//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     List<OrderModel> orderList = [];
//     if (json['orderList'] != null) {
//       orderList = List<OrderModel>.from(
//           json['orderList'].map((orderJson) => OrderModel.fromJson(orderJson)));
//     }
//
//     List<Product> favoriteList = [];
//     if (json['favoriteList'] != null) {
//       favoriteList = List<Product>.from(json['favoriteList']
//           .map((productJson) => Product.fromJson(productJson)));
//     }
//
//     return UserModel(
//       name: json['name'] ?? '',
//       email: json['email'] ?? '',
//       password: json['password'] ?? '',
//       shippingAddress: json['shippingAddress'] ?? '',
//       photoLink: json['photoLink'] ?? '',
//       orderList: orderList,
//       favoriteList: favoriteList,
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'email': email,
//       'password': password,
//       'shippingAddress': shippingAddress,
//       'photoLink': photoLink,
//       'orderList': orderList.map((order) => order.toJson()).toList(),
//       'favoriteList': favoriteList.map((product) => product.toJson()).toList(),
//     };
//   }
// }
