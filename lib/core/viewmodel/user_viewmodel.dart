import 'package:dish_dash/core/model/service_model/order/order_model.dart';
import 'package:dish_dash/view/payment/identification_strategy/models/AkbankIdentificationStrategy.dart';
import 'package:dish_dash/view/payment/identification_strategy/models/GarantiBankIdentificationStrategy.dart';
import 'package:dish_dash/view/payment/identification_strategy/models/IdentificationStrategy.dart';
import 'package:dish_dash/view/payment/identification_strategy/models/ZiraatBankIdentificationStrategy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../view/payment/components/card_front.dart';
import '../../view/payment/delivery_strategy/models/courier_delivery.dart';
import '../../view/payment/delivery_strategy/models/delivery.dart';
import '../../view/payment/delivery_strategy/models/market_delivery.dart';
import '../../view/payment/delivery_strategy/models/self_delivery.dart';
import '../../view/payment/payment_screen.dart';
import '../model/service_model/product/product_model.dart';
import '../model/service_model/user/user_model.dart';
import 'dart:math';

class UserViewModel extends ChangeNotifier {
  late UserModel currentUser;
  List<UserModel> users = [
    UserModel(
      name: "bedirhan",
      email: "bdo@x.com",
      password: "123",
      shippingAddress: '1343 sokak no 37 daire 10',
      photoLink: '',
      orderList: [],
      favList: [],
    ),
  ];
  void createUserWithEmailAndPassword(UserModel user) {
    users.add(user);
    notifyListeners();
  }

  void changeCurrentUser(UserModel user) {
    currentUser = user;
    notifyListeners();
  }

  List<Product> cartProducts = [];
  Map<Product, int> cartMap = {};
  double priceOfCart = 0.0;

  Map<Product, int> orderMap = {};

  void updateOrderMap(List<Product> products) {
    orderMap.clear();
    for (var product in products) {
      if (orderMap.containsKey(product)) {
        orderMap[product] = (orderMap[product]! + 1);
      } else {
        orderMap[product] = 1;
      }
    }

    notifyListeners();
  }

  void updateCartMap() {
    cartMap.clear();
    for (var product in cartProducts) {
      if (cartMap.containsKey(product)) {
        cartMap[product] = (cartMap[product]! + 1);
      } else {
        cartMap[product] = 1;
      }
    }

    notifyListeners();
  }

  void clearCartProducts() {
    cartProducts.clear();
    notifyListeners();
  }

  // Update the method that calculates the cart price
  double getPriceOfCart() {
    double price = 0;
    for (var product in cartProducts) {
      price += product.price;
    }
    // Use the selected delivery strategy to calculate delivery cost
    price = _deliveryStrategy.calculateDeliveryCost(price);

    price = _identificationStrategy.updatePriceWithTax(price);
    priceOfCart = price;
    notifyListeners();
    return price;
  }

  DeliveryStrategy _deliveryStrategy = SelfDeliveryStrategy();

  void setDeliveryStrategy(DeliveryMethod deliveryMethod) {
    switch (deliveryMethod) {
      case DeliveryMethod.courierDelivery:
        _deliveryStrategy = CourierDeliveryStrategy();
        break;
      case DeliveryMethod.cargoMarketDelivery:
        _deliveryStrategy = CargoMarketDeliveryStrategy();
        break;
      case DeliveryMethod.selfDelivery:
        _deliveryStrategy = SelfDeliveryStrategy();
        break;
    }
    notifyListeners();
  }

  BankIdentificationStrategy _identificationStrategy =
      ZiraatBankIdentificationStrategy();

  void setBankIdentificationStrategy(BankIdentification bankIdentification) {
    switch (bankIdentification) {
      case BankIdentification.ziraatIdentification:
        _identificationStrategy = ZiraatBankIdentificationStrategy();
        break;
      case BankIdentification.akbankIdentification:
        _identificationStrategy = AkbankIdentificationStrategy();
        break;
      case BankIdentification.garantiIdentification:
        _identificationStrategy = GarantiBankIdentificationStrategy();
        break;
    }
    notifyListeners();
  }

  static int orderNumGenerate() {
    Random random = Random();
    return random.nextInt(90000) + 10000;
  }

  int howManyItemIHaveInCart(Product p) {
    int adet = 0;

    if (cartProducts.isEmpty) {
      return 0;
    } else {
      for (var product in cartProducts) {
        if (product == p) {
          adet++;
        }
      }
    }
    return adet;
  }

  static bool isContainsProductInList(Product product, List<Product> list) {
    return list.contains(product);
  }

  void addProductInFavoriteList(Product product) {
    currentUser.favList.add(product);
    notifyListeners();
  }

  void removeProductInFavoriteList(Product product) {
    currentUser.favList.remove(product);
    notifyListeners();
  }

  void removeAllInCartListAndCartProduct(Product product) {
    cartMap.remove(product);
    while (cartProducts.contains(product)) {
      cartProducts.remove(product);
    }
    getPriceOfCart();
    notifyListeners();
  }

  void addProductInCartList(Product product) {
    cartProducts.add(product);
    updateCartMap();
    getPriceOfCart();
    notifyListeners();
  }

  void addOrderInCurrentOrderList(OrderModel order) {
    currentUser.orderList.add(order);
    cartProducts.clear();
    notifyListeners();
  }

  void removeProductInCartList(Product product) {
    cartProducts.remove(product);
    updateCartMap();
    getPriceOfCart();
    notifyListeners();
  }

  void updateProductPrice(int productId, double newPrice) {
    var foundProduct = mealProducts.firstWhere(
      (product) => product.id == productId,
    );
    foundProduct.price = newPrice;
    notifyListeners();
  }

  List<Product> newProducts = [
    // new
    Product(
      imageUrl:
          "https://assets.mmsrg.com/isr/166325/c1/-/ASSET_MMS_101502299/mobile_786_587_png/HUAWEI-Matebook-D15--i5-1155G7-%C4%B0%C5%9Flemci--8GB-Ram--256GB-SSD--15.6-in%C3%A7--Win-11-Laptop-Mistik-G%C3%BCm%C3%BC%C5%9F",
      category: Category(id: 0, name: "new"),
      id: 1,
      value: 0,
      name: "Laptop XYZ",
      price: 999.99,
      isNew: true,
      star: 4.3,
      brand: "laptop",
      cargoType: "bedava",
      size: true,
      sizeType: "orta",
      description:
          "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. Bir ürün, birden fazla satıcı tarafından satılabilir. Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. Bu üründen en fazla 1 adet sipariş verilebilir. 1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. Detaylı bilgi için tıklayın.",
      amountOfStock: 3,
      isInStock: true,
      amountOfDiscount: "10",
      oldCost: 200,
    ),
    Product(
        category: Category(id: 0, name: "new"),
        id: 2,
        amountOfDiscount: "10",
        oldCost: 200,
        amountOfStock: 3,
        isInStock: true,
        value: 0,
        cargoType: "bedava",
        size: true,
        sizeType: "orta",
        name: "Akıllı Telefon ABC",
        imageUrl:
            "https://reimg-teknosa-cloud-prod.mncdn.com/mnresize/600/600/productimage/125078788/125078788_0_MC/66845559.jpg",
        price: 699.99,
        brand: "Kronik Yayınevi",
        isNew: true,
        star: 4.3,
        description:
            "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. Bir ürün, birden fazla satıcı tarafından satılabilir. Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. Bu üründen en fazla 1 adet sipariş verilebilir. 1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. Detaylı bilgi için tıklayın."),
    Product(
        category: Category(id: 0, name: "new"),
        id: 3,
        amountOfDiscount: "10",
        oldCost: 200,
        amountOfStock: 3,
        isInStock: false,
        value: 0,
        cargoType: "bedava",
        size: false,
        sizeType: "orta",
        name: "Bluetooth Kulaklık",
        imageUrl:
            "https://akn-ayb.a-cdn.akinoncdn.com/products/2021/06/14/58647/f007828a-76e7-421a-b61d-37d2503a5a4d_size780x780_quality60_cropCenter.jpg",
        price: 49.99,
        brand: "Kronik Yayınevi",
        isNew: true,
        star: 4.3,
        description:
            "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. Bir ürün, birden fazla satıcı tarafından satılabilir. Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. Bu üründen en fazla 1 adet sipariş verilebilir. 1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. Detaylı bilgi için tıklayın."),
  ];
  List<Product> techProducts = [
    // technology
    Product(
        category: Category(id: 1, name: "technology"),
        id: 4,
        amountOfDiscount: "10",
        oldCost: 200,
        amountOfStock: 3,
        isInStock: true,
        value: 0,
        description:
            "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. Bir ürün, birden fazla satıcı tarafından satılabilir. Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. Bu üründen en fazla 1 adet sipariş verilebilir. 1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. Detaylı bilgi için tıklayın.",
        cargoType: "bedava",
        size: true,
        sizeType: "orta",
        name: "Akıllı Saat",
        imageUrl:
            "https://cdn03.ciceksepeti.com/cicek/kc3222420-1/XL/smart-siyah-akilli-saat-kc3222420-1-451229b892384cfe800c828cfdc243e3.jpg",
        price: 129.99,
        brand: "Kronik Yayınevi",
        isNew: false,
        star: 4.3),
    Product(
        category: Category(id: 1, name: "technology"),
        id: 5,
        amountOfDiscount: "10",
        oldCost: 200,
        amountOfStock: 3,
        isInStock: true,
        value: 0,
        description:
            "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. Bir ürün, birden fazla satıcı tarafından satılabilir. Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. Bu üründen en fazla 1 adet sipariş verilebilir. 1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. Detaylı bilgi için tıklayın.",
        cargoType: "bedava",
        size: true,
        sizeType: "orta",
        name: "Gaming Laptop Ultra",
        imageUrl:
            "https://image.made-in-china.com/202f0j00GyrldSocSAqz/Ultra-Thin-Gaming-Laptops-16-1-Inch-Intel-Core-I9-8950HK-I7-9750h-Nvid:-Gtx-1650-4G-Graphic-Card-Notebook-Win-10-Computer.jpg",
        price: 1499.99,
        brand: "Kronik Yayınevi",
        isNew: false,
        star: 4.3),
    Product(
        category: Category(id: 1, name: "technology"),
        id: 6,
        amountOfDiscount: "10",
        oldCost: 200,
        amountOfStock: 3,
        isInStock: true,
        value: 0,
        description:
            "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. Bir ürün, birden fazla satıcı tarafından satılabilir. Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. Bu üründen en fazla 1 adet sipariş verilebilir. 1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. Detaylı bilgi için tıklayın.",
        name: "4K UHD Smart TV",
        cargoType: "bedava",
        size: true,
        sizeType: "orta",
        imageUrl:
            "https://www.lg.com/africa/images/tvs/md06251641/gallery/uhd-lg-43un7000pta-tv-new_d2.jpg",
        price: 899.99,
        brand: "Kronik Yayınevi",
        isNew: false,
        star: 4.3),
    Product(
        category: Category(id: 1, name: "technology"),
        id: 7,
        amountOfDiscount: "10",
        oldCost: 200,
        amountOfStock: 3,
        isInStock: true,
        value: 0,
        description:
            "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. Bir ürün, birden fazla satıcı tarafından satılabilir. Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. Bu üründen en fazla 1 adet sipariş verilebilir. 1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. Detaylı bilgi için tıklayın.",
        name: "Kablosuz Bluetooth Mouse",
        cargoType: "bedava",
        size: true,
        sizeType: "orta",
        imageUrl:
            "https://productimages.hepsiburada.net/s/48/375-375/10953682354226.jpg",
        price: 19.99,
        brand: "Kronik Yayınevi",
        isNew: false,
        star: 4.3),
    Product(
        category: Category(id: 1, name: "technology"),
        id: 8,
        amountOfDiscount: "10",
        oldCost: 200,
        amountOfStock: 3,
        isInStock: true,
        value: 0,
        description:
            "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. Bir ürün, birden fazla satıcı tarafından satılabilir. Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. Bu üründen en fazla 1 adet sipariş verilebilir. 1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. Detaylı bilgi için tıklayın.",
        name: "Taşınabilir Bluetooth Hoparlör",
        imageUrl:
            "https://www.teknostore.com/image/cache/data/resimler/lenovo-lecoo-ds154-boombox-rgb-tasinabilir-bluetooth-hoparlor-17245-682x682.jpg",
        price: 59.99,
        cargoType: "bedava",
        size: true,
        sizeType: "orta",
        isNew: false,
        brand: "Kronik Yayınevi",
        star: 4.3),
    Product(
        category: Category(id: 1, name: "technology"),
        id: 9,
        amountOfDiscount: "10",
        oldCost: 200,
        amountOfStock: 3,
        isInStock: true,
        value: 0,
        description:
            "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. Bir ürün, birden fazla satıcı tarafından satılabilir. Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. Bu üründen en fazla 1 adet sipariş verilebilir. 1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. Detaylı bilgi için tıklayın.",
        name: "HD Vid: Kamera",
        imageUrl:
            "https://productimages.hepsiburada.net/s/7/375-375/8949968437298.jpg",
        price: 329.99,
        cargoType: "bedava",
        size: true,
        sizeType: "orta",
        isNew: false,
        brand: "Kronik Yayınevi",
        star: 4.3),
  ];
  List<Product> clotheProducts = [
    // clothes
    Product(
        category: Category(id: 2, name: "clothing"),
        id: 15,
        value: 0,
        name: "Siyah Dokuma Dokuma Elbise",
        imageUrl:
            "https://cdn.dsmcdn.com/mnresize/600/-/ty997/product/media/images/prod/PIM/20230908/10/d18cdef2-5281-4d39-96a8-4748790c013d/1_org_zoom.jpg",
        price: 69.99,
        isNew: false,
        star: 4.3,
        brand: "NZ",
        cargoType: "bedava",
        size: true,
        sizeType: "orta",
        description:
            "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. Bir ürün, birden fazla satıcı tarafından satılabilir. Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. Bu üründen en fazla 1 adet sipariş verilebilir. 1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. Detaylı bilgi için tıklayın.",
        amountOfStock: 3,
        isInStock: true,
        amountOfDiscount: "10",
        oldCost: 50),
    Product(
        category: Category(id: 2, name: "clothing"),
        id: 16,
        amountOfDiscount: "10",
        oldCost: 70,
        amountOfStock: 2,
        isInStock: true,
        value: 1,
        cargoType: "bedava",
        size: false,
        sizeType: "orta",
        name: "Kadın Çizgili Triko Kazak",
        imageUrl:
            "https://cdn.dsmcdn.com/mnresize/600/-/ty587/product/media/images/20221103/22/206966411/612981031/1/1_org_zoom.jpg",
        price: 59.99,
        brand: "X Kadın",
        isNew: false,
        star: 4.1,
        description:
            "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. Bir ürün, birden fazla satıcı tarafından satılabilir. Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. Bu üründen en fazla 1 adet sipariş verilebilir. 1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. Detaylı bilgi için tıklayın."),
    Product(
        category: Category(id: 2, name: "clothing"),
        id: 17,
        amountOfDiscount: "10",
        oldCost: 40,
        amountOfStock: 3,
        isInStock: true,
        value: 0,
        cargoType: "bedava",
        size: false,
        sizeType: "orta",
        name: "Kısa Taytlı Outdoor Şort",
        imageUrl:
            "https://cdn.dsmcdn.com/mnresize/600/-/ty955/product/media/images/20230622/13/388128090/881485565/1/1_org_zoom.jpg",
        price: 19.99,
        brand: "X Kadın",
        isNew: false,
        star: 4.3,
        description:
            "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. Bir ürün, birden fazla satıcı tarafından satılabilir. Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. Bu üründen en fazla 1 adet sipariş verilebilir. 1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. Detaylı bilgi için tıklayın."),
    Product(
        category: Category(id: 2, name: "clothing"),
        id: 18,
        amountOfDiscount: "10",
        oldCost: 40,
        amountOfStock: 3,
        isInStock: true,
        value: 0,
        description:
            "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. Bir ürün, birden fazla satıcı tarafından satılabilir. Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. Bu üründen en fazla 1 adet sipariş verilebilir. 1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. Detaylı bilgi için tıklayın.",
        cargoType: "bedava",
        size: true,
        sizeType: "orta",
        name: "El Örgüsü Eldiven",
        imageUrl:
            "https://cdn.dsmcdn.com/mnresize/600/-/ty1081/product/media/images/prod/SPM/PIM/20231207/14/0f9d212e-69a3-3ad7-a2c0-036545b93594/1_org_zoom.jpg",
        price: 29.99,
        brand: "MS Kadın",
        isNew: false,
        star: 4.3),
    Product(
        category: Category(id: 2, name: "clothing"),
        id: 19,
        amountOfDiscount: "10",
        oldCost: 200,
        amountOfStock: 3,
        isInStock: true,
        value: 0,
        description:
            "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. Bir ürün, birden fazla satıcı tarafından satılabilir. Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. Bu üründen en fazla 1 adet sipariş verilebilir. 1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. Detaylı bilgi için tıklayın.",
        cargoType: "bedava",
        size: true,
        sizeType: "orta",
        name: "Kürk Detaylı Pilot Şapka",
        imageUrl:
            "https://cdn.dsmcdn.com/mnresize/600/-/ty273/product/media/images/20211220/9/13657025/340968294/1/1_org_zoom.jpg",
        price: 99.99,
        brand: "Ela Giyim",
        isNew: false,
        star: 4.3),
  ];
  List<Product> eduProducts = [
    // education
    Product(
        category: Category(id: 3, name: "education"),
        id: 10,
        value: 0,
        name: "Atomik Alışkanlıklar",
        imageUrl:
            "https://www.kayhanaydogdu.com.tr/uploads/372888-I%CC%87yi-al%C4%B1%C5%9Fkanl%C4%B1klar-edinmenin-ve-k%C3%B6t%C3%BC-al%C4%B1%C5%9Fkanl%C4%B1klardan-1.jpeg",
        price: 29.99,
        isNew: false,
        star: 4.3,
        brand: "Kronik Yayınevi",
        cargoType: "bedava",
        size: true,
        sizeType: "orta",
        description:
            "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. Bir ürün, birden fazla satıcı tarafından satılabilir. Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. Bu üründen en fazla 1 adet sipariş verilebilir. 1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. Detaylı bilgi için tıklayın.",
        amountOfStock: 3,
        isInStock: true,
        amountOfDiscount: "10",
        oldCost: 50),
    Product(
        category: Category(id: 3, name: "education"),
        id: 11,
        amountOfDiscount: "10",
        oldCost: 70,
        amountOfStock: 2,
        isInStock: false,
        value: 1,
        cargoType: "bedava",
        size: false,
        sizeType: "orta",
        name: "Senin Cahilliğin Benim Yaşamımı Etkiliyor",
        imageUrl:
            "https://cdn.dsmcdn.com/mnresize/600/-/ty1019/product/media/images/prod/SPM/PIM/20231018/16/157fafd0-a216-3b1d-88f9-d9d03e3e86e1/1_org_zoom.jpg",
        price: 59.99,
        brand: "Kronik Yayınevi",
        isNew: false,
        star: 4.1,
        description:
            "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. Bir ürün, birden fazla satıcı tarafından satılabilir. Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. Bu üründen en fazla 1 adet sipariş verilebilir. 1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. Detaylı bilgi için tıklayın."),
    Product(
        category: Category(id: 3, name: "education"),
        id: 12,
        amountOfDiscount: "10",
        oldCost: 40,
        amountOfStock: 3,
        isInStock: true,
        value: 0,
        cargoType: "bedava",
        size: false,
        sizeType: "orta",
        name: "Dahi Diktatör",
        imageUrl:
            "https://cdn.dsmcdn.com/mnresize/600/-/ty102/product/media/images/20210413/15/79805047/13746232/1/1_org_zoom.jpg",
        price: 19.99,
        brand: "Kronik Yayınevi",
        isNew: false,
        star: 4.3,
        description:
            "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. Bir ürün, birden fazla satıcı tarafından satılabilir. Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. Bu üründen en fazla 1 adet sipariş verilebilir. 1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. Detaylı bilgi için tıklayın."),
    Product(
        category: Category(id: 3, name: "education"),
        id: 13,
        amountOfDiscount: "10",
        oldCost: 40,
        amountOfStock: 3,
        isInStock: true,
        value: 0,
        description:
            "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. Bir ürün, birden fazla satıcı tarafından satılabilir. Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. Bu üründen en fazla 1 adet sipariş verilebilir. 1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. Detaylı bilgi için tıklayın.",
        cargoType: "bedava",
        size: true,
        sizeType: "orta",
        name: "A5 Defter Celal Şengör Nasıl Yapıcaz 200 Sayfa",
        imageUrl:
            "https://cdn.dsmcdn.com/mnresize/600/-/ty777/product/media/images/20230315/15/304016577/886696731/1/1_org_zoom.jpg",
        price: 29.99,
        brand: "Kronik Yayınevi",
        isNew: false,
        star: 4.3),
    Product(
        category: Category(id: 3, name: "education"),
        id: 14,
        amountOfDiscount: "20",
        oldCost: 200,
        amountOfStock: 3,
        isInStock: true,
        value: 0,
        description:
            "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. Bir ürün, birden fazla satıcı tarafından satılabilir. Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. Bu üründen en fazla 1 adet sipariş verilebilir. 1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. Detaylı bilgi için tıklayın.",
        cargoType: "bedava",
        size: true,
        sizeType: "orta",
        name: "Var Mısın ?",
        imageUrl:
            "https://cdn.dsmcdn.com/mnresize/600/-/ty998/product/media/images/prod/SPM/PIM/20230907/23/64287eeb-4b25-3322-a722-e4656d841f46/1_org_zoom.jpg",
        price: 99.99,
        brand: "Kronik Yayınevi",
        isNew: false,
        star: 4.3),
  ];
  List<Product> sportProducts = [
    // sport
    Product(
        category: Category(id: 4, name: "sport"),
        id: 20,
        value: 0,
        name: "Dambıl Seti 2'li",
        imageUrl:
            "https://cdn.dsmcdn.com/mnresize/600/-/ty438/product/media/images/20220526/9/116331901/226974396/1/1_org_zoom.jpg",
        price: 69.99,
        isNew: false,
        star: 4.3,
        brand: "SportGiyim",
        cargoType: "bedava",
        size: true,
        sizeType: "orta",
        description:
            "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. Bir ürün, birden fazla satıcı tarafından satılabilir. Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. Bu üründen en fazla 1 adet sipariş verilebilir. 1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. Detaylı bilgi için tıklayın.",
        amountOfStock: 3,
        isInStock: false,
        amountOfDiscount: "10",
        oldCost: 50),
    Product(
        category: Category(id: 4, name: "sport"),
        id: 21,
        amountOfDiscount: "10",
        oldCost: 70,
        amountOfStock: 2,
        isInStock: true,
        value: 1,
        cargoType: "bedava",
        size: false,
        sizeType: "orta",
        name: "Slim Kondisyon Bisikleti",
        imageUrl:
            "https://cdn.dsmcdn.com/mnresize/600/-/ty1029/product/media/images/prod/SPM/PIM/20231105/16/ebe3cf30-2660-376c-8668-1c0ddd10b966/1_org_zoom.jpg",
        price: 59.99,
        brand: "SportGiyim",
        isNew: false,
        star: 4.1,
        description:
            "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. Bir ürün, birden fazla satıcı tarafından satılabilir. Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. Bu üründen en fazla 1 adet sipariş verilebilir. 1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. Detaylı bilgi için tıklayın."),
    Product(
        category: Category(id: 4, name: "sport"),
        id: 22,
        amountOfDiscount: "10",
        oldCost: 40,
        amountOfStock: 3,
        isInStock: true,
        value: 0,
        cargoType: "bedava",
        size: false,
        sizeType: "orta",
        name: "Uzaktan Kumandalı Koşu Bandı",
        imageUrl:
            "https://cdn.dsmcdn.com/mnresize/600/-/ty744/product/media/images/20230223/15/287759278/866433150/1/1_org_zoom.jpg",
        price: 19.99,
        brand: "SportGiyim",
        isNew: false,
        star: 4.3,
        description:
            "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. Bir ürün, birden fazla satıcı tarafından satılabilir. Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. Bu üründen en fazla 1 adet sipariş verilebilir. 1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. Detaylı bilgi için tıklayın."),
    Product(
        category: Category(id: 4, name: "sport"),
        id: 23,
        amountOfDiscount: "10",
        oldCost: 40,
        amountOfStock: 3,
        isInStock: true,
        value: 0,
        description:
            "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. Bir ürün, birden fazla satıcı tarafından satılabilir. Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. Bu üründen en fazla 1 adet sipariş verilebilir. 1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. Detaylı bilgi için tıklayın.",
        cargoType: "bedava",
        size: true,
        sizeType: "orta",
        name: "Kol Bilek Güçlendirici Fitness Bilek Aparatı",
        imageUrl:
            "https://cdn.dsmcdn.com/mnresize/600/-/ty1021/product/media/images/prod/SPM/PIM/20231024/17/f5999ed1-0539-371b-b919-77ecb23dd250/1_org_zoom.jpg",
        price: 29.99,
        brand: "SportGiyim",
        isNew: false,
        star: 4.3),
    Product(
        category: Category(id: 4, name: "sport"),
        id: 24,
        amountOfDiscount: "10",
        oldCost: 200,
        amountOfStock: 3,
        isInStock: true,
        value: 0,
        description:
            "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. Bir ürün, birden fazla satıcı tarafından satılabilir. Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. Bu üründen en fazla 1 adet sipariş verilebilir. 1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. Detaylı bilgi için tıklayın.",
        cargoType: "bedava",
        size: true,
        sizeType: "orta",
        name: "Boks Eldiveni Siyah",
        imageUrl:
            "https://cdn.dsmcdn.com/mnresize/600/-/ty1006/product/media/images/prod/SPM/PIM/20230927/13/68f5adc5-a9f3-3841-a017-55c2674519f6/1_org_zoom.jpg",
        price: 99.99,
        brand: "SportGiyim",
        isNew: false,
        star: 4.3)
  ];
  List<Product> mealProducts = [
    Product(
      imageUrl:
          "https://raw.githubusercontent.com/bedirhantong/flutter_barista/master/assets/images/breakfast/durum.png",
      category: Category(id: 0, name: "meal"),
      id: 1,
      value: 0,
      name: "Zurna Dürüm",
      price: 89.99,
      isNew: true,
      star: 4.7,
      brand: "Yemek Fabrikasi",
      cargoType: "bedava",
      size: true,
      sizeType: "150 gram",
      description:
          "Tamamen helal üretim onaylı Urfa zurna dürüm, tek tıkla sen neredeysen oraya gelsin.",
      amountOfStock: 3,
      isInStock: true,
      amountOfDiscount: "10",
      oldCost: 200,
    ),
    Product(
      imageUrl:
          "https://raw.githubusercontent.com/bedirhantong/flutter_barista/master/assets/images/breakfast/sandwich.png",
      category: Category(id: 0, name: "meal"),
      id: 1,
      value: 0,
      name: "Kahvaltılık Sandviç",
      price: 79.99,
      isNew: true,
      star: 4.7,
      brand: "Sandwichiesy",
      cargoType: "bedava",
      size: true,
      sizeType: "90 gram",
      description:
          "Tamamen helal üretim onaylı Sandviç, tek tıkla sen neredeysen oraya gelsin.",
      amountOfStock: 3,
      isInStock: true,
      amountOfDiscount: "10",
      oldCost: 200,
    ),
    Product(
      imageUrl:
          "https://raw.githubusercontent.com/bedirhantong/flutter_barista/master/assets/images/breakfast/turkey_bacon.png",
      category: Category(id: 0, name: "meal"),
      id: 1,
      value: 0,
      name: "Turkish Pastırma",
      price: 89.99,
      isNew: true,
      star: 4.7,
      brand: "Pastirma Diyari",
      cargoType: "bedava",
      size: true,
      sizeType: "120 gram",
      description:
          "Tamamen helal üretim onaylı Pastırma, tek tıkla sen neredeysen oraya gelsin.",
      amountOfStock: 3,
      isInStock: true,
      amountOfDiscount: "10",
      oldCost: 200,
    ),
  ];
}

final userViewModelProvider = ChangeNotifierProvider((ref) => UserViewModel());
