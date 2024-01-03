import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:techblog/component/my_colors.dart';
import 'package:techblog/common/route_page.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    //after 2 seconds, it will go to the HomePage
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Get.offAndToNamed(RoutePage.homePage);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //splash screen logo
            Image(
              image: Assets.images.logo.provider(),
              height: 80,
            ),
            const SizedBox(
              height: 30,
            ),
            //splash screen loading animation
            const SpinKitFadingCube(
              color: SolidColors.primaryColor,
              size: 32.0,
            ),
          ],
        ),
      ),
    );
  }
}
