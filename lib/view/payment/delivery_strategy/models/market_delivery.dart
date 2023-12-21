import 'package:dish_dash/core/viewmodel/user_viewmodel.dart';
import 'delivery.dart';

class CargoMarketDelivery implements DeliveryType {
  @override
  void selectDelivery(String deliveryMessage) {
    deliveryMessage =
        " numaralı siparişinizi kargo firmasına gidip alacaksınız.";
    UserViewModel.setPriceOfCartWithTaxes(2.5);
  }
}
