import '../../../model/service_model/product/product_model.dart';
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
          isMainScreenCard: false,
          isFavoriteCard: false,
          isDetailedCard: false,
          isCartCard: false,
          isOrderedCard: true,
          value: 1,
          oldCost: 1000,
          amountOfDiscount: '%5',
        );
      case 'mainScreen':
        return MainScreenCard(
          product: product,
          isMainScreenCard: true,
          isFavoriteCard: false,
          isDetailedCard: false,
          isCartCard: false,
          isOrderedCard: false,
          value: 1,
          oldCost: 1000,
          amountOfDiscount: '%5',
        );
      case 'detailed':
        return DetailedProductCard(
          product: product,
          isMainScreenCard: false,
          isFavoriteCard: false,
          isDetailedCard: true,
          isCartCard: false,
          isOrderedCard: false,
          value: 0,
          oldCost: 200,
          amountOfDiscount: '%5',
        );
      case 'cartProduct':
        return CartProductCard(
          product: product,
          isMainScreenCard: false,
          isFavoriteCard: false,
          isDetailedCard: false,
          isCartCard: true,
          isOrderedCard: false,
          value: 3,
          oldCost: 500,
          amountOfDiscount: '%5',
        );
      case 'favorite':
        return FavoriteProductCard(
          product: product,
          isMainScreenCard: false,
          isFavoriteCard: true,
          isDetailedCard: false,
          isCartCard: false,
          isOrderedCard: false,
          value: 2,
          oldCost: 600,
          amountOfDiscount: '%5',
        );
      default:
        throw Exception('Invalid card type: $cardType');
    }
  }
}
