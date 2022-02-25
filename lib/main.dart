import 'package:cart/cart2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Cart2(),
      debugShowCheckedModeBanner: false,
    );
  }
}
