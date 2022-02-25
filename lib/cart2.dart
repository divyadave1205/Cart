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

List<ShoppingContainerData> shopProductsList = [
  ShoppingContainerData(
    index: 1,
    qty: 0,
    price: "300/-",
    tshirtName: "Girl's Sports Shoes",
    url:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_h0iDJk1_vn0xTxvpSIPCTC0YlKpsOR0TKQ&usqp=CAU",
  ),
  ShoppingContainerData(
    index: 2,
    qty: 0,
    price: "500/-",
    tshirtName: "Men's Blue Shoes",
    url:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSgGsrREITIt0wANCWrcc7kDUrvSX4x41rqQ&usqp=CAU",
  ),
  ShoppingContainerData(
    index: 3,
    qty: 0,
    price: "600/-",
    tshirtName: "Men's Black Shoes",
    url:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6MkVoi2b3r_R_Mh24EkbO8dSFAnxu10rntA&usqp=CAU",
  ),
  ShoppingContainerData(
    index: 4,
    qty: 0,
    price: "900/-",
    tshirtName: "Men's White Shoe",
    url:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrPSQurz_lbGvn-cnWudtvIrwhCVP9GDwx1w&usqp=CAU",
  ),
];

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

class ShoppingContainerData {
  final int? index;
  final String? url;
  final String? tshirtName;
  final String? price;
  final ValueSetter<int>? onProductTAp;
  final int? qty;

  ShoppingContainerData({
    this.index,
    this.url,
    this.tshirtName,
    this.price,
    this.onProductTAp,
    this.qty,
  });
}

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

class CartContainerData {
  final int? index;

  final String? url;
  final String? tshirtName;
  final String? price;
  final ValueSetter<int>? onProductTAp;
  int? qty;

  CartContainerData({
    this.index,
    this.url,
    this.tshirtName,
    this.price,
    this.onProductTAp,
    this.qty,
  });
}
