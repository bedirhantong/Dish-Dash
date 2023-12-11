class Product {
  final String name;
  final String imageUrl;
  final double price;
  final String description;
  final bool isNew;
  final double star;
  final String brand;
  final String cargoType;
  final bool ebat;
  final int value;
  final String ebat_tipi;

  Product({
    required this.description,
    required this.brand,
    required this.cargoType,
    required this.ebat,
    required this.value,
    required this.ebat_tipi,
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
          ebat == other.ebat &&
          ebat_tipi == other.ebat_tipi &&
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
      ebat.hashCode ^
      ebat_tipi.hashCode ^
      value.hashCode;
}
