import '../product_model/product_model.dart';

class OrderModel {
  final int orderNumber;
  final DateTime orderDate;
  final String orderStatus;
  final List<Product> orderProducts;
  final double totalAmount;

  OrderModel({
    required this.orderNumber,
    required this.orderDate,
    required this.orderStatus,
    required this.orderProducts,
    required this.totalAmount,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    List<Product> products = [];
    if (json['orderProducts'] != null) {
      products = List<Product>.from(json['orderProducts']
          .map((productJson) => Product.fromJson(productJson)));
    }
    return OrderModel(
      orderNumber: json['orderNumber'] ?? 0,
      orderDate: json['orderDate'] != null
          ? DateTime.parse(json['orderDate'])
          : DateTime.now(),
      orderStatus: json['orderStatus'] ?? 'on delivery',
      orderProducts: products,
      totalAmount: (json['totalAmount'] ?? 0).toDouble(),
    );
  }
}
