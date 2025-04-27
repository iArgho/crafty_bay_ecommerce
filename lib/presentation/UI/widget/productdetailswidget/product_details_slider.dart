import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay_ecommerce_flutter/presentation/utility/color_palette.dart';
import 'package:flutter/material.dart';

class ProductDetailsSlider extends StatelessWidget {
  const ProductDetailsSlider({
    super.key,
    required ValueNotifier<int> selectedSlider,
  }) : _selectedSlider = selectedSlider;

  final ValueNotifier<int> _selectedSlider;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
         options: CarouselOptions(
          height: 200.0,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
             onPageChanged: (int page, _) {
            _selectedSlider.value = page;
          },
        ),
          items: [1, 2, 3, 4].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 224, 223, 223),
                        Colors.white,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: const Center(
                    child: Icon(
                      Icons.flutter_dash,
                      size: 120.0,
                      color: AppColor.primaryColor,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
         Padding(
     padding: const EdgeInsets.only(top: 180.0),
           child: ValueListenableBuilder(
                         valueListenable: _selectedSlider,
                         builder: (context, value, _) {
            List<Widget> list = [];
            for (int i = 0; i < 4; i++) {
              list.add(
                Container(
                  width: 11,
                  height: 11,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: value == i ? AppColor.primaryColor : Colors.white),
                ),
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: list,
            );
                     },
                       ),
         ),
      ],
    );
  }
}
