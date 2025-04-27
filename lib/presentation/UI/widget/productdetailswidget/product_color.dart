import 'package:flutter/material.dart';
import 'package:iargho_ecommerce_flutter/presentation/utility/color_palette.dart';

class ProductColor extends StatelessWidget {
  const ProductColor({
    super.key,
    required ValueNotifier<int> selectedIteam,
  }) : _selectedIteam = selectedIteam;

  final ValueNotifier<int> _selectedIteam;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: ValueListenableBuilder(
        valueListenable: _selectedIteam,
        builder: (context, value, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(5, (index) {
              return GestureDetector(
                onTap: () {
                  _selectedIteam.value = index; // Update selected color
                },
                child: Container(
                  width: 24,
                  height: 24,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: value == index
                        ? AppColor.primaryColor
                        : [
                            Colors.red,
                            Colors.yellow,
                            Colors.green,
                            Colors.blue,
                            Colors.purple
                          ][index],
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
