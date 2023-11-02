import 'package:flutter/material.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';
import 'package:techblog/my_colors.dart';

// is a widget that creates a dividing line
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
      thickness: 1,
    );
  }
}

class TagContainer extends StatelessWidget {
  const TagContainer({
    super.key,
    required this.size,
    required this.textTheme,
    required this.index,
  });

  final Size size;
  final TextTheme textTheme;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 22.8,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          gradient: LinearGradient(
              colors: GradientColors.tag,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 12),
        child: Row(
          children: [
            //hash tag icon in every container
            ImageIcon(
              Assets.icons.hashTagIcon.provider(),
              color: Colors.white,
              size: 15,
            ),
            const SizedBox(
              width: 8,
            ),
            //the title written in each container
            Text(
              tagList[index].tagName,
              style: textTheme.headline2,
            )
          ],
        ),
      ),
    );
  }
}