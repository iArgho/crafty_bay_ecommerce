import 'package:crafty_bay_ecommerce_flutter/presentation/utility/color_palette.dart';
import 'package:flutter/material.dart';

class ProductCounter extends StatefulWidget {
  const ProductCounter({super.key});

  @override
  _ProductCounterState createState() => _ProductCounterState();
}

class _ProductCounterState extends State<ProductCounter> {
  int quantity = 1;

  void _increment() {
    setState(() {
      quantity++;
    });
  }

  void _decrement() {
    setState(() {
      if (quantity > 1) quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: _decrement,
          icon: const Icon(Icons.remove, color: AppColor.primaryColor, size: 16,),
        ),
        Text(
          '$quantity',
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        IconButton(
          onPressed: _increment,
          icon: const Icon(Icons.add, color: AppColor.primaryColor, size: 16,),
        ),
      ],
    );
  }
}