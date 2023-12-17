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
    required int cartItemCount,
    required String cargoType,
    required Function(int) onAddToCart,
  }) {
    switch (cardType) {
      case 'ordered':
        return OrderedProductCard(
          product: product,
          cartItemCount: cartItemCount,
          onAddToCart: onAddToCart,
          cardList: [],
          isMainScreenCard: false,
          isFavoriteCard: false,
          isDetailedCard: false,
          isCartCard: false,
          isOrderedCard: true,
          value: 1,
          cargoType: 'free',
          oldCost: 1000,
          amountOfDiscount: '%5',
        );
      case 'mainScreen':
        return MainScreenCard(
          product: product,
          cartItemCount: cartItemCount,
          onAddToCart: onAddToCart,
          cardList: [],
          isMainScreenCard: true,
          isFavoriteCard: false,
          isDetailedCard: false,
          isCartCard: false,
          isOrderedCard: false,
          value: 1,
          cargoType: 'free',
          oldCost: 1000,
          amountOfDiscount: '%5',
        );
      case 'detailed':
        return DetailedProductCard(
          product: product,
          cartItemCount: cartItemCount,
          onAddToCart: onAddToCart,
          cardList: [],
          isMainScreenCard: false,
          isFavoriteCard: false,
          isDetailedCard: true,
          isCartCard: false,
          isOrderedCard: false,
          value: 0,
          cargoType: 'free',
          oldCost: 200,
          amountOfDiscount: '%5',
        );
      case 'cartProduct':
        return CartProductCard(
          product: product,
          cartItemCount: cartItemCount,
          onAddToCart: onAddToCart,
          cardList: [],
          isMainScreenCard: false,
          isFavoriteCard: false,
          isDetailedCard: false,
          isCartCard: true,
          isOrderedCard: false,
          value: 3,
          cargoType: 'free',
          oldCost: 500,
          amountOfDiscount: '%5',
        );
      case 'favorite':
        return FavoriteProductCard(
          product: product,
          cartItemCount: cartItemCount,
          onAddToCart: onAddToCart,
          cardList: [],
          isMainScreenCard: false,
          isFavoriteCard: true,
          isDetailedCard: false,
          isCartCard: false,
          isOrderedCard: false,
          value: 2,
          cargoType: 'free',
          oldCost: 600,
          amountOfDiscount: '%5',
        );
      default:
        throw Exception('Invalid card type: $cardType');
    }
  }
}
