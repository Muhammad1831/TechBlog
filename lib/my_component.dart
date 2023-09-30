import 'package:flutter/material.dart';
import 'package:techblog/my_colors.dart';

class TechBlogDivider extends StatelessWidget {
  const TechBlogDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: SolidColors.dividerColor,
      indent: size.width / 4.7,
      endIndent: size.width / 4.7,
      thickness: 0.4,
    );
  }
}