class Product {
  final int id;
  final String name;
  final String imageUrl;
  final double price;
  final String description;
  final bool isNew;
  final double star;
  final String brand;
  final String cargoType;
  final bool size;
  final int value;
  final String sizeType;
  final bool isInStock;
  final int amountOfStock;
  final int oldCost;
  final String amountOfDiscount;

  Product({
    required this.id,
    required this.amountOfDiscount,
    required this.oldCost,
    required this.amountOfStock,
    required this.isInStock,
    required this.description,
    required this.brand,
    required this.cargoType,
    required this.size,
    required this.value,
    required this.sizeType,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.isNew,
    required this.star,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: (json['id'] ?? 0),
        name: (json['name'] ?? "x"),
        description: (json['description'] ?? "x"),
        imageUrl: json['imageUrl'] ?? "",
        price: (json['price'] ?? 0.0),
        isNew: json['isNew'] ?? false,
        star: (json['star'] ?? 0.0),
        brand: json['brand'] ?? "x",
        cargoType: json['cargoType'] ?? "bedava",
        size: json['size'] ?? true,
        value: (json['value'] ?? 0),
        sizeType: json['sizeType'] ?? "normal",
        isInStock: json['isInStock'] ?? true,
        amountOfStock: json['amountOfStock'] ?? 0,
        oldCost: (json['oldCost'] ?? 0),
        amountOfDiscount: json['amountOfDiscount'] ?? "0");
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          imageUrl == other.imageUrl &&
          price == other.price &&
          isNew == other.isNew &&
          star == other.star &&
          size == other.size &&
          sizeType == other.sizeType &&
          cargoType == other.cargoType &&
          brand == other.brand &&
          value == other.value;

  @override
  int get hashCode =>
      name.hashCode ^
      imageUrl.hashCode ^
      price.hashCode ^
      isNew.hashCode ^
      star.hashCode ^
      brand.hashCode ^
      cargoType.hashCode ^
      size.hashCode ^
      sizeType.hashCode ^
      value.hashCode;
}
