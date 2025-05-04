import 'package:crafty_bay_ecommerce_flutter/presentation/utility/color_palette.dart';
import 'package:flutter/material.dart';

class ProductSize extends StatelessWidget {
  const ProductSize({
    super.key,
    required ValueNotifier<int> selectedSize,
    required this.sizes,
  }) : _selectedSize = selectedSize;

  final ValueNotifier<int> _selectedSize;
  final List<String> sizes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ValueListenableBuilder(
        valueListenable: _selectedSize,
        builder: (context, value, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(sizes.length, (index) {
              return GestureDetector(
                onTap: () {
                  _selectedSize.value = index;
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: value == index ? AppColor.primaryColor : Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(6),
                    color: value == index ? AppColor.primaryColor : Colors.white,
                  ),
                  child: Text(
                    sizes[index],
                    style: TextStyle(
                      color: value == index ? Colors.white : Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}

