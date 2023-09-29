import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/my_colors.dart';
import 'dart:math' as math;
import 'package:techblog/view/home_screen.dart';
import 'package:techblog/view/profile_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //for easy access to textThemes
    TextTheme textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    //the distance of the body from the right side to align
    var bodyMargin = size.width / 12.5;

    return SafeArea(
      child: Scaffold(
        //HomaPage Appbar
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //menu icon in HomaPage top bar
              Icon(
                Icons.menu,
                color: SolidColors.menuIcon,
                size: size.width / 18,
              ),
              //logo image in HomaPage top bar
              Image(
                image: Assets.images.logo.provider(),
                height: size.height / 13.6,
              ),
              /* with Transform.rotate and named that angle: we can rotate
                    the widget assigned to child: */
              Transform.rotate(
                  //math.pi is equal 180°
                  angle: math.pi / 2,
                  //search icon in HomaPage top bar
                  child: IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.search,
                        color: SolidColors.searchIcon,
                        size: size.height / 31.6,
                      )))
            ],
          ),
          backgroundColor: SolidColors.scafoldBackground,
          elevation: 0,
        ),
        body: Stack(children: [
          Positioned.fill(
              child: ProfileScreen(
                  size: size, textTheme: textTheme, bodyMargin: bodyMargin)),
          //buttons navigation bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: size.height / 10,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: GradientColors.buttonNavigationBackGroundGradient,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              child: Padding(
                padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      gradient: LinearGradient(
                          colors: GradientColors.buttonNavigationGradient)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: (() {}),
                          icon: ImageIcon(
                            Assets.icons.homeIcon.provider(),
                            color: Colors.white,
                            size: 28,
                          )),
                      IconButton(
                          onPressed: (() {}),
                          icon: ImageIcon(
                            Assets.icons.writerIcon.provider(),
                            color: Colors.white,
                            size: 28,
                          )),
                      IconButton(
                          onPressed: (() {}),
                          icon: ImageIcon(
                            Assets.icons.userIcon.provider(),
                            color: Colors.white,
                            size: 28,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}