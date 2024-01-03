import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/component/my_colors.dart';
import 'package:techblog/gen/assets.gen.dart';

class PencilBlueTitle extends StatelessWidget {
  const PencilBlueTitle({super.key, required this.title});

  final title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageIcon(
          Assets.icons.pencilIcon.provider(),
          color: SolidColors.pencilIcon,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          title,
          style: Get.textTheme.headline3,
        )
      ],
    );
  }
}
