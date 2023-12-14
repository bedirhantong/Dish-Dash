import '../service_model/order/order_model.dart';

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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          email == other.email &&
          password == other.password &&
          shippingAddress == other.shippingAddress &&
          photoLink == other.photoLink &&
          orderList == other.orderList &&
          favoriteList == other.favoriteList;

  @override
  int get hashCode =>
      name.hashCode ^
      email.hashCode ^
      password.hashCode ^
      shippingAddress.hashCode ^
      photoLink.hashCode ^
      orderList.hashCode ^
      favoriteList.hashCode;
}
