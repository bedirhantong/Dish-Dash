import '../product/product_model.dart';

class OrderModel {
  int orderNumber;
  DateTime orderDate;
  String orderStatus;
  List<Product> orderProducts;
  int totalAmount;

  OrderModel({
    required this.orderNumber,
    required this.orderDate,
    required this.orderStatus,
    required this.orderProducts,
    required this.totalAmount,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        orderNumber: json["orderNumber"],
        orderDate: DateTime.parse(json["orderDate"]),
        orderStatus: json["orderStatus"],
        orderProducts: List<Product>.from(
          json["orderProducts"].map((x) => Product.fromJson(x)),
        ),
        totalAmount: json["totalAmount"],
      );

  Map<String, dynamic> toJson() => {
        "orderNumber": orderNumber,
        "orderDate": orderDate.toIso8601String(),
        "orderStatus": orderStatus,
        "orderProducts":
            List<dynamic>.from(orderProducts.map((x) => x.toJson())),
        "totalAmount": totalAmount,
      };
}

// class OrderModel {
//   final int orderNumber;
//   final DateTime orderDate;
//   final String orderStatus;
//   final List<Product> orderProducts;
//   final double totalAmount;
//
//   OrderModel({
//     required this.orderNumber,
//     required this.orderDate,
//     required this.orderStatus,
//     required this.orderProducts,
//     required this.totalAmount,
//   });
//
//   factory OrderModel.fromJson(Map<String, dynamic> json) {
//     List<Product> products = [];
//     if (json['orderProducts'] != null) {
//       products = List<Product>.from(json['orderProducts']
//           .map((productJson) => Product.fromJson(productJson)));
//     }
//     return OrderModel(
//       orderNumber: json['orderNumber'] ?? 0,
//       orderDate: json['orderDate'] != null
//           ? DateTime.parse(json['orderDate'])
//           : DateTime.now(),
//       orderStatus: json['orderStatus'] ?? 'on delivery',
//       orderProducts: products,
//       totalAmount: (json['totalAmount'] ?? 0).toDouble(),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'orderNumber': orderNumber,
//       'orderDate': orderDate.toIso8601String(),
//       'orderStatus': orderStatus,
//       'orderProducts':
//           orderProducts.map((product) => product.toJson()).toList(),
//       'totalAmount': totalAmount,
//     };
//   }
// }
