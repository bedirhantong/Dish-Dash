import '../order/order_model.dart';

class UserModel {
  final String name;
  final String email;
  final String password;
  final String shippingAddress;
  final String photoLink;
  List<OrderModel> orderList;
  List<OrderModel> favoriteList;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.shippingAddress,
    required this.photoLink,
    required this.orderList,
    required this.favoriteList,
  });
}
