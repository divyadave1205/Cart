import 'package:cart/cart_container.dart';
import 'package:cart/cart_container_data.dart';
import 'package:cart/shopping_container_data.dart';
import 'package:cart/utilities/color_utilitis/color_utilities.dart';
import 'package:flutter/material.dart';

import 'cart2.dart';

class CartPage extends StatefulWidget {
  final ValueSetter<int>? onProductTAp;
  final List<CartContainerData> cartProducts;
  final shoppingProducts = shopProductsList;

  CartPage({
    Key? key,
    this.onProductTAp,
    required this.cartProducts,
  }) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtilities.appColor5,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: ColorUtilities.appColor4,
        ),
        backgroundColor: ColorUtilities.appColor2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        title: Text(
          "Your Shopping Cart",
          style: TextStyle(
            color: ColorUtilities.appColor4,
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Text(
                "PRODUCTS",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorUtilities.appColor2,
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: widget.cartProducts.map((element) {
                  print(element.qty);
                  return GestureDetector(
                    onTap: () {},
                    child: CartContainer(
                      index: element.index,
                      price: element.price,
                      tshirtName: element.tshirtName,
                      url: element.url,
                      qty: element.qty ?? 0,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
