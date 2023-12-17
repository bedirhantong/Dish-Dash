class Product {
  Category category;
  int id;
  String name;
  String description;
  String imageUrl;
  double price;
  bool isNew;
  double star;
  String brand;
  String cargoType;
  bool size;
  int value;
  String sizeType;
  bool isInStock;
  int amountOfStock;
  int oldCost;
  String amountOfDiscount;

  Product({
    required this.category,
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.isNew,
    required this.star,
    required this.brand,
    required this.cargoType,
    required this.size,
    required this.value,
    required this.sizeType,
    required this.isInStock,
    required this.amountOfStock,
    required this.oldCost,
    required this.amountOfDiscount,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        category: Category.fromJson(json["category"]),
        id: json["id"],
        name: json["name"],
        description: json["description"],
        imageUrl: json["imageUrl"],
        price: json["price"]?.toDouble(),
        isNew: json["isNew"],
        star: json["star"]?.toDouble(),
        brand: json["brand"],
        cargoType: json["cargoType"],
        size: json["size"],
        value: json["value"],
        sizeType: json["sizeType"],
        isInStock: json["isInStock"],
        amountOfStock: json["amountOfStock"],
        oldCost: json["oldCost"],
        amountOfDiscount: json["amountOfDiscount"],
      );

  Map<String, dynamic> toJson() => {
        "category": category.toJson(),
        "id": id,
        "name": name,
        "description": description,
        "imageUrl": imageUrl,
        "price": price,
        "isNew": isNew,
        "star": star,
        "brand": brand,
        "cargoType": cargoType,
        "size": size,
        "value": value,
        "sizeType": sizeType,
        "isInStock": isInStock,
        "amountOfStock": amountOfStock,
        "oldCost": oldCost,
        "amountOfDiscount": amountOfDiscount,
      };
}

class Category {
  int id;
  String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

// class Product {
//   final int id;
//   final String name;
//   final String imageUrl;
//   final double price;
//   final String description;
//   final bool isNew;
//   final double star;
//   final String brand;
//   final String cargoType;
//   final bool size;
//   final int value;
//   final String sizeType;
//   final bool isInStock;
//   final int amountOfStock;
//   final int oldCost;
//   final String amountOfDiscount;
//
//   Product({
//     required this.id,
//     required this.amountOfDiscount,
//     required this.oldCost,
//     required this.amountOfStock,
//     required this.isInStock,
//     required this.description,
//     required this.brand,
//     required this.cargoType,
//     required this.size,
//     required this.value,
//     required this.sizeType,
//     required this.name,
//     required this.imageUrl,
//     required this.price,
//     required this.isNew,
//     required this.star,
//   });
//
//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//         id: (json['id'] ?? 0),
//         name: (json['name'] ?? "x"),
//         description: (json['description'] ?? "x"),
//         imageUrl: json['imageUrl'] ?? "",
//         price: (json['price'] ?? 0.0),
//         isNew: json['isNew'] ?? false,
//         star: (json['star'] ?? 0.0),
//         brand: json['brand'] ?? "x",
//         cargoType: json['cargoType'] ?? "bedava",
//         size: json['size'] ?? true,
//         value: (json['value'] ?? 0),
//         sizeType: json['sizeType'] ?? "normal",
//         isInStock: json['isInStock'] ?? true,
//         amountOfStock: json['amountOfStock'] ?? 0,
//         oldCost: (json['oldCost'] ?? 0),
//         amountOfDiscount: json['amountOfDiscount'] ?? "0");
//   }
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'description': description,
//       'imageUrl': imageUrl,
//       'price': price,
//       'isNew': isNew,
//       'star': star,
//       'brand': brand,
//       'cargoType': cargoType,
//       'size': size,
//       'value': value,
//       'sizeType': sizeType,
//       'isInStock': isInStock,
//       'amountOfStock': amountOfStock,
//       'oldCost': oldCost,
//       'amountOfDiscount': amountOfDiscount,
//     };
//   }
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is Product &&
//           runtimeType == other.runtimeType &&
//           name == other.name &&
//           imageUrl == other.imageUrl &&
//           price == other.price &&
//           isNew == other.isNew &&
//           star == other.star &&
//           size == other.size &&
//           sizeType == other.sizeType &&
//           cargoType == other.cargoType &&
//           brand == other.brand &&
//           value == other.value;
//
//   @override
//   int get hashCode =>
//       name.hashCode ^
//       imageUrl.hashCode ^
//       price.hashCode ^
//       isNew.hashCode ^
//       star.hashCode ^
//       brand.hashCode ^
//       cargoType.hashCode ^
//       size.hashCode ^
//       sizeType.hashCode ^
//       value.hashCode;
// }
