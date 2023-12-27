import '../../../../../data/service_model/product/product_model.dart';
import '../meal_add_cart_card.dart';
import 'abstract_ product_card.dart';
import '../cart_product_card.dart';
import '../detailed_product_card.dart';
import '../favorite_product_card.dart';
import '../main_screen_card.dart';
import '../ordered_product_card.dart';

class ProductCardFactory {
  static ProductCardWidget createProductCard({
    required String cardType,
    required Product product,
  }) {
    switch (cardType) {
      case 'ordered':
        return OrderedProductCard(
          product: product,
        );
      case 'mainScreen':
        return MainScreenCard(
          product: product,
        );
      case 'detailed':
        return DetailedProductCard(
          product: product,
        );
      case 'cartProduct':
        return CartProductCard(
          product: product,
        );
      case 'favorite':
        return FavoriteProductCard(
          product: product,
        );
      case 'meal':
        return MealAddCartProductCard(
          product: product,
        );
      default:
        throw Exception('Invalid card type: $cardType');
    }
  }
}
