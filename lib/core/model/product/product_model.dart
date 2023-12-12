class Product {
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

  Product({
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
