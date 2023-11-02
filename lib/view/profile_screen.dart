import 'package:flutter/material.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/my_colors.dart';
import 'package:techblog/my_component.dart';
import 'package:techblog/my_string.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  });

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            decelerationRate: ScrollDecelerationRate.normal),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height / 13.5,
            ),
            Image(
              image: Assets.images.profileAvatar.provider(),
              height: 100,
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  Assets.icons.pencilIcon.provider(),
                  color: SolidColors.pencilIcon,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  MyString.editProfileImage,
                  style: textTheme.headline3,
                )
              ],
            ),
            SizedBox(
              height: size.height / 13.5,
            ),
            Text(
              "فاطمه امیری",
              style: textTheme.bodyText1,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "fatemeamiri@gmail.com",
              style: textTheme.bodyText1,
            ),
            SizedBox(
              height: size.height / 17.2,
            ),
            TechBlogDivider(size: size),
            SizedBox(
              height: 45,
              child: InkWell(
                onTap: () {},
                splashColor: SolidColors.primaryColor,
                child: Center(
                  child: Text(
                    MyString.myFavoriteBlog,
                    style: textTheme.bodyText1,
                  ),
                ),
              ),
            ),
            TechBlogDivider(size: size),
            SizedBox(
              height: 45,
              child: InkWell(
                onTap: () {},
                splashColor: SolidColors.primaryColor,
                child: Center(
                  child: Text(
                    MyString.myFavoritePodcast,
                    style: textTheme.bodyText1,
                  ),
                ),
              ),
            ),
            TechBlogDivider(size: size),
            SizedBox(
              height: 45,
              child: InkWell(
                onTap: () {},
                splashColor: SolidColors.primaryColor,
                child: Center(
                  child: Text(
                    MyString.exitFromAccount,
                    style: textTheme.bodyText1,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
