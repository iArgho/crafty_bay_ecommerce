import 'package:crafty_bay_ecommerce_flutter/presentation/UI/widget/product_card.dart';
import 'package:flutter/material.dart';

class BottomProductScreen extends StatelessWidget {
  const BottomProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Products'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            return const ProductCard();
          },
        ),
      ),
    );
  }
}
