import 'package:cart/cart_container_data.dart';
import 'package:cart/cart_page.dart';
import 'package:cart/product_list.dart';
import 'package:cart/shopping_container_data.dart';
import 'package:cart/utilities/color_utilitis/color_utilities.dart';
import 'package:flutter/material.dart';

class Cart2 extends StatefulWidget {
  const Cart2({Key? key}) : super(key: key);

  @override
  _Cart2State createState() => _Cart2State();
}

class _Cart2State extends State<Cart2> {
  final shoppingProducts = shopProductsList;
  List<CartContainerData> cartProducts = <CartContainerData>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtilities.appColor5,
      appBar: AppBar(
        backgroundColor: ColorUtilities.appColor2,
        title: Row(
          children: [
            Expanded(child: Text("Shoes Shop")),
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return CartPage(
                    cartProducts: cartProducts,
                  );
                }));
              },
              icon: Icon(
                Icons.shopping_cart,
                color: ColorUtilities.lightGreyColor,
                size: 30,
              ),
            )
          ],
        ),
      ),
      body: ProductList(
        shoppingProducts: shoppingProducts,
        onProductTAp: (index) {
          if (cartProducts
                  .where((de) => de.index == shoppingProducts[index].index)
                  .length <=
              0) {
            cartProducts.add(
              CartContainerData(
                index: shoppingProducts[index].index,
                qty: 1,
                price: shoppingProducts[index].price,
                tshirtName: shoppingProducts[index].tshirtName,
                url: shoppingProducts[index].url,
              ),
            );
          } else {
            cartProducts
                .where((de) => de.index == shoppingProducts[index].index)
                .toList()[0]
                .qty = (cartProducts
                        .where(
                            (de) => de.index == shoppingProducts[index].index)
                        .toList()[0]
                        .qty ??
                    0) +
                1;
          }
        },
      ),
    );
  }
}
