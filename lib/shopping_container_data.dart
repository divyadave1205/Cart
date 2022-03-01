import 'package:flutter/material.dart';

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
