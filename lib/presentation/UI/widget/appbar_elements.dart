import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iargho_ecommerce_flutter/presentation/UI/widget/circular_icon_button.dart';
import 'package:iargho_ecommerce_flutter/presentation/utility/path_util.dart';

class AppbarElements extends StatelessWidget {
  const AppbarElements({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(ImagePath().logoNav),
        const Spacer(),
        CircularIconButton(
          icon: Icons.person_outlined,
          onTap: () {},
        ),
        const SizedBox(width: 8),
        CircularIconButton(
          icon: Icons.phone_iphone_outlined,
          onTap: () {},
        ),
        const SizedBox(width: 8),
        CircularIconButton(
          icon: Icons.notification_add_outlined,
          onTap: () {},
        ),
      ],
    );
  }
}
