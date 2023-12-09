class Product {
  final String name;
  final String imageUrl;
  final double price;
  final bool isNew;
  final double star;

  Product({
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
          star == other.star;

  @override
  int get hashCode =>
      name.hashCode ^
      imageUrl.hashCode ^
      price.hashCode ^
      isNew.hashCode ^
      star.hashCode;
}
