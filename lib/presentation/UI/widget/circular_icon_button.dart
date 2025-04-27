import 'package:flutter/material.dart';
import 'package:iargho_ecommerce_flutter/presentation/utility/color_palette.dart';

class CircularIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const CircularIconButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(3.5),
        child: CircleAvatar(
          radius: 17,
          backgroundColor: const Color.fromARGB(31, 178, 177, 177),
          child: Icon(
            icon,
            color: AppColor.primaryColor,
          ),
        ),
      ),
    );
  }
}
