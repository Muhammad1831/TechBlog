import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:techblog/home_page.dart';
import 'package:techblog/main.dart';
import 'package:techblog/my_colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    //after 3 seconds, it will go to the HomePage
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomePage()));
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
