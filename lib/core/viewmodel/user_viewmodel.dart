import '../model/service_model/user/user_model.dart';

class UserViewModel {
  static late UserModel currentUser;
  static List<UserModel> users = [
    UserModel(
      name: "bedirhan",
      email: "bdo@x.com",
      password: "123",
      shippingAddress: '1343 sokak no 37 daire 10',
      photoLink: '',
      orderList: [],
      favoriteList: [],
    ),
  ];
}
