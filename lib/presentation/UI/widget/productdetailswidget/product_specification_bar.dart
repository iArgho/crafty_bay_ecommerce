import 'package:flutter/material.dart';
import 'package:iargho_ecommerce_flutter/presentation/UI/widget/product_counter_widget.dart';
import 'package:iargho_ecommerce_flutter/presentation/utility/color_palette.dart';

class ProductSpecificationBar extends StatelessWidget {
  const ProductSpecificationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Happy New Year Seles',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.star, color: Colors.amber),
                SizedBox(
                  width: 4,
                ),
                Text(
                  '4.8',
                  style: TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 25,
                ),
                Text(
                  'Reviews',
                  style: TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 4,
                ),
                Icon(Icons.favorite, color: AppColor.primaryColor),
              ],
            ),
          ],
        ),
        Spacer(),
        ProductCounter(),
      ],
    );
  }
}
