import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../presentation/ui/screens/home/components/product_details_page.dart';
import '../../../presentation/view_models/viewmodel/user_viewmodel.dart';
import 'components/abstract_ product_card.dart';

class MealAddCartProductCard extends ProductCardWidget {
  const MealAddCartProductCard({
    super.key,
    required super.product,
  });

  @override
  ConsumerState<MealAddCartProductCard> createState() =>
      _MealAddCartProductCardState();
}

class _MealAddCartProductCardState
    extends ConsumerState<MealAddCartProductCard> {
  var screenWidth;
  var screenHeight;
  @override
  Widget build(BuildContext context) {
    final userViewModel = ref.watch(userViewModelProvider);

    screenWidth = MediaQuery.sizeOf(context).width;
    screenHeight = MediaQuery.sizeOf(context).height;
    return InkWell(
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
      child: Container(
        width: double.infinity,
        height: screenHeight * 0.25,
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            SizedBox(
              width: screenWidth * 0.37,
              child: Image.network(
                widget.product.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              width: screenWidth * 0.02,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screenWidth * 0.37,
                    child: Text(
                      widget.product.name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      overflow: TextOverflow.visible,
                      textDirection: TextDirection.ltr,
                      softWrap: true,
                    ),
                  ),
                  Text(
                    widget.product.brand,
                    style: TextStyle(
                        color: Colors.grey[600],
                        overflow: TextOverflow.ellipsis),
                  ),
                  createProductStar(),
                  Text(
                    '${widget.product.price} TL',
                    style: TextStyle(color: Colors.orange[800]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  createProductStar() {
    List starList1 = [
      Icon(
        Icons.star,
        size: 15,
        color: Colors.orange[800],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.grey[600],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.grey[600],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.grey[600],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.grey[600],
      ),
    ];

    List starList2 = [
      Icon(
        Icons.star,
        size: 15,
        color: Colors.orange[800],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.orange[800],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.grey[600],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.grey[600],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.grey[600],
      ),
    ];

    List starList3 = [
      Icon(
        Icons.star,
        size: 15,
        color: Colors.orange[800],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.orange[800],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.orange[800],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.grey[600],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.grey[600],
      ),
    ];

    List starList4 = [
      Icon(
        Icons.star,
        size: 15,
        color: Colors.orange[800],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.orange[800],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.orange[800],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.orange[800],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.grey[600],
      ),
    ];

    List starList5 = [
      Icon(
        Icons.star,
        size: 15,
        color: Colors.orange[800],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.orange[800],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.orange[800],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.orange[800],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.orange[800],
      ),
    ];

    if (widget.product.star == 0) {
      return const Padding(
        padding: EdgeInsets.only(left: 3.0, top: 3.0),
        child: Row(
          children: [
            Text(
              "(Yeni Ürün)",
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      );
    }

    if (widget.product.star == 1) {
      return Row(
        children: [
          starList1[0],
          starList1[1],
          starList1[2],
          starList1[3],
          starList1[4],
        ],
      );
    }

    if (widget.product.star == 2) {
      return Row(
        children: [
          starList2[0],
          starList2[1],
          starList2[2],
          starList2[3],
          starList2[4],
        ],
      );
    }

    if (widget.product.star == 3) {
      return Row(
        children: [
          starList3[0],
          starList3[1],
          starList3[2],
          starList3[3],
          starList3[4],
        ],
      );
    }

    if (widget.product.star == 4) {
      return Row(
        children: [
          starList4[0],
          starList4[1],
          starList4[2],
          starList4[3],
          starList4[4],
        ],
      );
    } else {
      return Row(
        children: [
          starList5[0],
          starList5[1],
          starList5[2],
          starList5[3],
          starList5[4],
        ],
      );
    }
  }
}
