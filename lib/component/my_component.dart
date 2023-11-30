import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:techblog/controller/home_screen_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/component/my_colors.dart';
import 'package:url_launcher/url_launcher.dart';

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

// ignore: must_be_immutable
class TagContainer extends StatelessWidget {
  TagContainer({
    super.key,
    required this.size,
    required this.textTheme,
    required this.index,
  });

  final Size size;
  final TextTheme textTheme;
  final int index;

  HomeScreenController homeScreenController = Get.put(HomeScreenController());

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
              homeScreenController.tagList[index].title!,
              style: textTheme.headline2,
            )
          ],
        ),
      ),
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SpinKitFadingCube(
      color: SolidColors.primaryColor,
      size: 32.0,
    );
  }
}

myLaunchUrl(String url) async {
  var uri = Uri.parse(url);
  await launchUrl(uri);

  // if (await canLaunchUrl(uri)) {
  //   await launchUrl(uri);
  // }
  // else{
  //   print('Could not');
  // }
}

PreferredSize customAppBar(String title) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(80),
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                    fontFamily: 'iran',
                    fontSize: 18,
                    color: SolidColors.primaryColor,
                    fontWeight: FontWeight.w700),
              ),
            ),
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: InkWell(
            onTap: (){
              Get.back();
            },
            child: Opacity(
              opacity: 0.5,
              child: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                      color: SolidColors.primaryColor, shape: BoxShape.circle),
                  child: const Icon(
                    CupertinoIcons.arrow_right,
                    color: Colors.white,
                    size: 25,
                  )),
            ),
          ),
        ),
      ),
    ),
  );
}
