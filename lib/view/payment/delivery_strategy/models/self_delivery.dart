import '../../../../core/viewmodel/user_viewmodel.dart';
import 'delivery.dart';

class SelfDelivery implements DeliveryType {
  @override
  void selectDelivery(String deliveryMessage) {
    deliveryMessage =
        " numaralı siparişinizi aşağıda seçtiğiniz gel al noktasından almanız gerekmektedir.";
    UserViewModel.setPriceOfCartWithTaxes(25.5);
  }
}
