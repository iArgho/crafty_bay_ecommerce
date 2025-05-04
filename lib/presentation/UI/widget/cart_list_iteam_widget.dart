import 'package:crafty_bay_ecommerce_flutter/presentation/utility/color_palette.dart';
import 'package:flutter/material.dart';
import 'product_counter_widget.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),  // Rounded corners
          
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              leading: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.shopping_cart, color: AppColor.primaryColor),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left Column (Item Details)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Item Name',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Color: Red, Size: X',
                        style: TextStyle(fontSize: 10),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '\$99.99',
                        style: TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  // Right Column (Actions)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 14.0),
                        child: Icon(Icons.delete, size: 16, color: Colors.red),
                      ),
                      ProductCounter(),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey.withOpacity(0.4), 
             
            ),
          ],
        ),
      ),
    );
  }
}