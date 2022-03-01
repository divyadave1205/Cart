import 'package:cart/utilities/color_utilitis/color_utilities.dart';
import 'package:flutter/material.dart';

class CartContainer extends StatefulWidget {
  final int? index;

  final String? url;
  final String? tshirtName;
  final String? price;
  final ValueSetter<int>? onProductTAp;
  final int qty;
  const CartContainer({
    Key? key,
    this.url,
    this.tshirtName,
    this.price,
    this.onProductTAp,
    required this.qty,
    this.index,
  }) : super(key: key);

  @override
  _CartContainerState createState() => _CartContainerState();
}

class _CartContainerState extends State<CartContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
              height: 120,
              width: 380,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorUtilities.appColor2,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.url!),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
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
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
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
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
