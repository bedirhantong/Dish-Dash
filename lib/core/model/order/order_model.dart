import 'package:flutter/foundation.dart';

import '../product/product_model.dart';

class OrderModel {
  final int orderNumber;
  final DateTime orderDate;
  final String orderStatus;
  final List<Product> products;
  final double totalAmount;

  OrderModel({
    required this.orderNumber,
    required this.orderDate,
    required this.orderStatus,
    required this.products,
    required this.totalAmount,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is OrderModel &&
              runtimeType == other.runtimeType &&
              orderNumber == other.orderNumber &&
              orderDate == other.orderDate &&
              orderStatus == other.orderStatus &&
              listEquals(products, other.products) &&
              totalAmount == other.totalAmount;

  @override
  int get hashCode =>
      orderNumber.hashCode ^
      orderDate.hashCode ^
      orderStatus.hashCode ^
      products.hashCode ^
      totalAmount.hashCode;
}