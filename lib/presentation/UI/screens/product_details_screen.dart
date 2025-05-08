import 'package:crafty_bay_ecommerce_flutter/presentation/ui/widget/productdetailswidget/product_color.dart';
import 'package:crafty_bay_ecommerce_flutter/presentation/ui/widget/productdetailswidget/product_details_slider.dart';
import 'package:crafty_bay_ecommerce_flutter/presentation/ui/widget/productdetailswidget/product_size.dart';
import 'package:crafty_bay_ecommerce_flutter/presentation/ui/widget/productdetailswidget/product_specification_bar.dart';
import 'package:crafty_bay_ecommerce_flutter/presentation/utility/color_palette.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key});

  final ValueNotifier<int> _selectedSlider = ValueNotifier(0);
  final ValueNotifier<int> _selectedIteam = ValueNotifier(0);
  final ValueNotifier<int> _selectedSize = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    final List<String> sizes = ['X', 'XL', '2L', 'XXL'];

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text(
              'Product Details',
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductDetailsSlider(selectedSlider: _selectedSlider),
                    const ProductSpecificationBar(),
                    const SizedBox(height: 6),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Color',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    ProductColor(selectedIteam: _selectedIteam),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                      child: Text(
                        'Size',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    ProductSize(selectedSize: _selectedSize, sizes: sizes),
                    const SizedBox(height: 14),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Description',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptat.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: AppColor.primaryColor.withOpacity(0.1),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Price'),
                        Text(
                          '\$100',
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        // Add your tap handling logic here
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Add To Cart',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
