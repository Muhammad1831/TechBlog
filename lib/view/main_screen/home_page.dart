import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/component/my_string.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/component/my_colors.dart';
import 'package:techblog/view/main_screen/home_screen.dart';
import 'package:techblog/view/main_screen/profile_screen.dart';
import 'dart:math' as math;
import 'package:techblog/view/register_techblog.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  var selectedPageIndex = 0.obs;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    //for easy access to textThemes
    TextTheme textTheme = Theme.of(context).textTheme;
    //for easy access to size screens
    var size = MediaQuery.of(context).size;
    //the distance of the body from the right side to align
    var bodyMargin = size.width / 12.5;

    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          backgroundColor: SolidColors.drawerBackgrounColor,
          child: Padding(
            padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin),
            child: ListView(
              children: [
                DrawerHeader(
                  child: Image.asset(
                    Assets.images.logo.path,
                    scale: 1.6,
                  ),
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                  thickness: 1,
                ),
                ListTile(
                  splashColor: SolidColors.drawerSplashColor,
                  title: Text(
                    'پروفایل کاربری',
                    style: textTheme.bodyText1,
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                  thickness: 1,
                ),
                ListTile(
                  splashColor: SolidColors.drawerSplashColor,
                  title: Text(
                    'درباره تک‌بلاگ',
                    style: textTheme.bodyText1,
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                  thickness: 1,
                ),
                ListTile(
                  splashColor: SolidColors.drawerSplashColor,
                  title: Text(
                    'اشتراک گذاری تک بلاگ',
                    style: textTheme.bodyText1,
                  ),
                  onTap: () async {
                    await Share.share(
                      MyString.shareText,
                    );
                  },
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                  thickness: 1,
                ),
                ListTile(
                  splashColor: SolidColors.drawerSplashColor,
                  title: Text(
                    'تک‌بلاگ در گیت هاب',
                    style: textTheme.bodyText1,
                  ),
                  onTap: () {
                    myLaunchUrl(MyString.techBlogGithubUrl);
                  },
                ),
              ],
            ),
          ),
        ),
        //HomaPage Appbar
        appBar: AppBar(
          // remove the default drawer button
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //drawer icon in HomaPage appbar
              InkWell(
                onTap: () {
                  _key.currentState!.openDrawer();
                },
                child: Icon(
                  Icons.menu,
                  color: SolidColors.menuIcon,
                  size: size.width / 18,
                ),
              ),
              //logo image in HomaPage appbar
              Image(
                image: Assets.images.logo.provider(),
                height: size.height / 13.6,
              ),
              /* with Transform.rotate and named that angle: we can rotate
                    the widget assigned to child: */
              Transform.rotate(
                  //math.pi is equal 180°
                  angle: math.pi / 2,
                  //search icon in HomaPage appbar
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
            child: Obx(
              () {
                return IndexedStack(index: selectedPageIndex.value, children: [
                  HomeScreen(
                      size: size,
                      textTheme: textTheme,
                      bodyMargin: bodyMargin), // index 0
                  const RegisterTechBlog(), // index 1
                  ProfileScreen(
                      size: size,
                      textTheme: textTheme,
                      bodyMargin: bodyMargin), // index 2
                ]);
              },
            ),
          ),
          //buttons navigation bar
          BottomNavigationBar(
            size: size,
            bodyMargin: bodyMargin,
            setIndexPage: (value) {
              selectedPageIndex.value = value;
            },
          ),
        ]),
      ),
    );
  }
}

class BottomNavigationBar extends StatelessWidget {
  const BottomNavigationBar(
      {super.key,
      required this.size,
      required this.bodyMargin,
      required this.setIndexPage});

  final Size size;
  final double bodyMargin;
  final Function(int) setIndexPage;

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
                    colors: GradientColors.buttonNavigationGradient,
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: (() {
                      setIndexPage(0);
                    }),
                    icon: ImageIcon(
                      Assets.icons.homeIcon.provider(),
                      color: Colors.white,
                      size: 28,
                    )),
                IconButton(
                    onPressed: (() {
                      setIndexPage(1);
                    }),
                    icon: ImageIcon(
                      Assets.icons.writerIcon.provider(),
                      color: Colors.white,
                      size: 28,
                    )),
                IconButton(
                    onPressed: (() {
                      setIndexPage(2);
                    }),
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
    );
  }
}
