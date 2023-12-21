import '../product/product_model.dart';

class OrderModel {
  int orderNumber;
  DateTime orderDate;
  String orderStatus;
  List<Product> orderProducts;
  double totalAmount;

  OrderModel({
    required this.orderNumber,
    required this.orderDate,
    required this.orderStatus,
    required this.orderProducts,
    required this.totalAmount,
  });
}
