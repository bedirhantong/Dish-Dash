import 'dart:async';
import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dish_dash/core/viewmodel/user_viewmodel.dart';
import 'package:dish_dash/view/favorite/product_avaliablity_observer/notification_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/common_widgets/product_card/components/product_card_factory.dart';
import '../../core/constants/app/color_strings.dart';
import '../../core/model/service_model/product/product_model.dart';

class FavoritePage extends ConsumerStatefulWidget {
  const FavoritePage({super.key});

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends ConsumerState<FavoritePage>
    with SingleTickerProviderStateMixin {
  late TabController controller2;
  @override
  void initState() {
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onDismissActionReceivedMethod:
          NotificationController.onDismissActionReceivedMethod,
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod:
          NotificationController.onNotificationDisplayedMethod,
    );
    super.initState();
    controller2 = TabController(length: 2, vsync: this);

    // Call the updateStock method when the page is first loaded
    updateStock();

    // Schedule periodic stock updates using Future.delayed
    const updateInterval =
        Duration(minutes: 30); // Adjust the interval as needed
    Timer.periodic(updateInterval, (timer) {
      updateStock();
    });
  }

  // Function to simulate stock update
  Future<void> updateStock() async {
    final userViewModel = ref.read(userViewModelProvider);

    for (var product in userViewModel.currentUser.favList) {
      if (!product.isInStock) {
        // Simulate stock update with a random delay (between 1 and 60 seconds)
        final randomDelay = Random().nextInt(120) + 1;
        await Future.delayed(Duration(seconds: randomDelay));

        // Update stock status
        product.isInStock = true;

        // Notify the user about the stock update
        AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: 1,
            channelKey: "basic_channel",
            title: "Merhaba ${userViewModel.currentUser.name}",
            body:
                "${product.name} stoklarımıza girmiştir. Stoklar tükenmeden siparişini ver.",
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final userViewModel = ref.watch(userViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBarColor,
        elevation: 1,
        title: const Text(
          "Favorilerim",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Colors.grey[300],
      body: userViewModel.currentUser.favList.isEmpty
          ? const Center(
              child: Text("There is no any product in favorite"),
            )
          : SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: userViewModel.currentUser.favList.length,
                    itemBuilder: (context, index) {
                      Product product =
                          userViewModel.currentUser.favList[index];
                      return ProductCardFactory.createProductCard(
                          cardType: 'favorite', product: product);
                    },
                  )),
            ),
    );
  }
}
