import 'package:flutter/material.dart';

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
