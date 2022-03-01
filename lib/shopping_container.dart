import 'package:cart/utilities/color_utilitis/color_utilities.dart';
import 'package:flutter/material.dart';

class ShoppingContainer extends StatefulWidget {
  final String? url;
  final String? tshirtName;
  final String? price;
  final ValueSetter<int>? onProductTAp;
  final int qty;
  const ShoppingContainer({
    Key? key,
    this.url,
    this.tshirtName,
    this.price,
    this.onProductTAp,
    required this.qty,
  }) : super(key: key);

  @override
  _ShoppingContainerState createState() => _ShoppingContainerState();
}

class _ShoppingContainerState extends State<ShoppingContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            height: 150,
            width: 380,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(widget.url!),
              ),
            ),
          ),
          Container(
            height: 90,
            width: 380,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: ColorUtilities.appColor2,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.tshirtName!,
                          style: TextStyle(
                            color: ColorUtilities.appColor4,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          widget.price ?? "",
                          style: TextStyle(
                            color: ColorUtilities.appColor4,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: CircleAvatar(
                          backgroundColor: ColorUtilities.appColor4,
                          child: Icon(
                            Icons.shopping_cart,
                            color: ColorUtilities.appColor1,
                          ),
                        ),
                      ),
                      Text(
                        "${widget.qty}",
                        style: TextStyle(
                          color: ColorUtilities.appColor4,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
