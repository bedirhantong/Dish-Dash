import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../view/home/components/product_details_page.dart';
import '../../../view/main/components/meal_decorator/additional_decorator.dart';
import '../../../view/main/components/meal_decorator/drink_decorator.dart';
import '../../../view/main/components/meal_decorator/meal_order_component.dart';
import '../../../view/main/components/meal_decorator/order_component.dart';
import '../../../view/main/components/meal_decorator/sauce_decorator.dart';
import '../../constants/app/color_strings.dart';
import '../../model/service_model/product/product_model.dart';
import '../../viewmodel/user_viewmodel.dart';
import 'components/abstract_ product_card.dart';
import 'components/product_card_factory.dart';
import 'meal_add_cart_card.dart';
import 'meal_add_cart_card.dart';
import 'meal_add_cart_card.dart';

class MainScreenCard extends ProductCardWidget {
  const MainScreenCard({
    super.key,
    required super.product,
    required super.isMainScreenCard,
    required super.isFavoriteCard,
    required super.isDetailedCard,
    required super.isCartCard,
    required super.isOrderedCard,
    required super.value,
    required super.oldCost,
    required super.amountOfDiscount,
  });

  @override
  ConsumerState<MainScreenCard> createState() => _MainScreenCardState();
}

class _MainScreenCardState extends ConsumerState<MainScreenCard> {
  late var screenWidth;
  late var screenHeight;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userViewModel = ref.watch(userViewModelProvider);

    screenWidth = MediaQuery.sizeOf(context).width;
    screenHeight = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              product: widget.product,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 170,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12.0),
                ),
                image: DecorationImage(
                  image: NetworkImage(widget.product.imageUrl),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                ),
              ),
              child: widget.product.isNew
                  ? Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.red,
                        ),
                        child: const Text(
                          "New",
                          style: TextStyle(color: Colors.white, fontSize: 12.0),
                        ),
                      ),
                    )
                  : Container(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.visible,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 18.0,
                            color: Colors.yellow,
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            "4.5",
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.grey),
                          ),
                        ],
                      ),
                      Text(
                        '\$${widget.product.price.toStringAsFixed(2)}',
                        style:
                            const TextStyle(fontSize: 14, color: Colors.green),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  UserViewModel.isContainsProductInList(
                          widget.product, userViewModel.cartProducts)
                      ? InkWell(
                          onTap: () {
                            ref
                                .read(userViewModelProvider)
                                .removeProductInCartList(widget.product);
                          },
                          child: Container(
                            width: screenWidth * 0.28,
                            height: screenHeight * 0.04,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.deepPurple, width: 2),
                            ),
                            child: const Text(
                              "Sepetten Çıkar",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            widget.product.category.name != "meal"
                                ? ref
                                    .read(userViewModelProvider)
                                    .addProductInCartList(widget.product)
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          MyHomePage(product: widget.product),
                                    ),
                                  );
                          },
                          child: Container(
                            width: screenWidth * 0.28,
                            height: screenHeight * 0.04,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.deepPurple, width: 2),
                            ),
                            child: const Text(
                              "Sepete ekle",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key, required this.product});
  final Product product;
  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  String selectedSauce = "";
  String selectedDrink = "";
  String additionalNote = "";

  @override
  Widget build(BuildContext context) {
    OrderComponent order = MealOrder(widget.product);
    final userViewModel = ref.watch(userViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Order'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductCardFactory.createProductCard(
                cardType: 'meal',
                product: widget.product,
              ),
              const Text(
                'Sauce Preference:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Radio(
                    value: 'Ketchup',
                    groupValue: selectedSauce,
                    onChanged: (value) {
                      setState(() {
                        selectedSauce = value!;
                      });
                    },
                  ),
                  const Text('Ketchup'),
                  Radio(
                    value: 'Mustard',
                    groupValue: selectedSauce,
                    onChanged: (value) {
                      setState(() {
                        selectedSauce = value!;
                      });
                    },
                  ),
                  const Text('Chipotle'),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Drink Selection:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Radio(
                    value: 'Water',
                    groupValue: selectedDrink,
                    onChanged: (value) {
                      setState(() {
                        selectedDrink = value!;
                      });
                    },
                  ),
                  const Text('Water'),
                  Radio(
                    value: 'Soda',
                    groupValue: selectedDrink,
                    onChanged: (value) {
                      setState(() {
                        selectedDrink = value!;
                      });
                    },
                  ),
                  const Text('Soda'),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Additional Note:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextField(
                maxLines: 2,
                onChanged: (value) {
                  setState(
                    () {
                      additionalNote = value;
                    },
                  );
                },
                decoration: const InputDecoration(
                  hintText: 'Enter additional note...',
                ),
              ),
              const SizedBox(height: 16),
              UserViewModel.isContainsProductInList(
                      widget.product, userViewModel.cartProducts)
                  ? Center(
                      child: OutlinedButton(
                        onPressed: () {
                          ref
                              .read(userViewModelProvider)
                              .removeProductInCartList(widget.product);
                        },
                        child: const Text('Remove from Cart'),
                      ),
                    )
                  : Center(
                      child: OutlinedButton(
                        onPressed: () {
                          // Add decorators based on user choices
                          if (selectedSauce.isNotEmpty) {
                            order = SauceDecorator(order, selectedSauce);
                          }
                          if (selectedDrink.isNotEmpty) {
                            order = DrinkDecorator(order, selectedDrink);
                          }
                          if (additionalNote.isNotEmpty) {
                            order =
                                AdditionalNoteDecorator(order, additionalNote);
                          }
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   SnackBar(
                          //     content: Text(
                          //         "Order description: ${order.description} \nOrder price: ${order.price} \nEstimated delivery time: ${order.deliveryTime} minutes \nSauce: $selectedSauce, Drink: $selectedDrink, Note: $additionalNote"),
                          //     backgroundColor: AppColor.appBarColor,
                          //   ),
                          // );
                          ref.read(userViewModelProvider).updateProductPrice(
                              widget.product.id, order.price);

                          ref
                              .read(userViewModelProvider)
                              .addProductInCartList(widget.product);
                        },
                        child: const Text('Add to Cart'),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
