import 'package:cart/cart2.dart';
import 'package:cart/shopping_container.dart';
import 'package:cart/shopping_container_data.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  final shoppingProducts;
  final ValueSetter<int>? onProductTAp;
  ProductList({
    Key? key,
    this.shoppingProducts,
    this.onProductTAp,
  }) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<ShoppingContainerData>? cartProducts;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: ShoppingContainer(
            qty: 1,
            price: shopProductsList[index].price,
            tshirtName: shopProductsList[index].tshirtName,
            url: shopProductsList[index].url,
          ),
          onTap: () {
            widget.onProductTAp!(index);
            if (cartProducts?.contains(widget.shoppingProducts[index]) ??
                false) {
              index++;
            } else {
              ShoppingContainer(
                qty: 1,
                price: widget.shoppingProducts[index].price,
                tshirtName: widget.shoppingProducts[index].tshirtName,
                url: widget.shoppingProducts[index].url,
              );
            }
            SnackBar s = SnackBar(content: Text("Product is added"));
            ScaffoldMessenger.of(context).showSnackBar(s);
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
      itemCount: widget.shoppingProducts.length,
    );
  }
}
