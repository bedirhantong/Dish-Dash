import '../../../../core/viewmodel/user_viewmodel.dart';
import 'delivery.dart';

class CourierDelivery implements DeliveryType {
  @override
  void selectDelivery(String deliveryMessage) {
    deliveryMessage =
        " numaralı siparişinizi kargo firması tarafınıza ulaştırılacaktır..";
    UserViewModel.setPriceOfCartWithTaxes(54.5);
  }
}
