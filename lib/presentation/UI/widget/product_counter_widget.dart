import 'package:flutter/material.dart';
import 'package:iargho_ecommerce_flutter/presentation/utility/color_palette.dart';

class ProductCounter extends StatefulWidget {
  const ProductCounter({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
      children: [
        IconButton(
          onPressed: _decrement,
          icon: const Icon(
            Icons.remove,
            color: AppColor.primaryColor,
            size: 16,
          ),
        ),
        Text(
          '$quantity',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        IconButton(
          onPressed: _increment,
          icon: const Icon(
            Icons.add,
            color: AppColor.primaryColor,
            size: 16,
          ),
        ),
      ],
    );
  }
}
