import '../order/order_model.dart';
import '../product/product_model.dart';

class UserModel {
  String name;
  String email;
  String password;
  String shippingAddress;
  String photoLink;
  List<OrderModel> orderList;
  List<Product> favList;
  List<Product> notifyMe;

  UserModel({
    required this.notifyMe,
    required this.name,
    required this.email,
    required this.password,
    required this.shippingAddress,
    required this.photoLink,
    required this.orderList,
    required this.favList,
  });
}
