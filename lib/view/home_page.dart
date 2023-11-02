import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/my_colors.dart';
import 'package:techblog/view/home_screen.dart';
import 'dart:math' as math;
import 'package:techblog/view/profile_screen.dart';
import 'package:techblog/view/register_techblog.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedPageIndex = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    //for easy access to textThemes
    TextTheme textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    //the distance of the body from the right side to align
    var bodyMargin = size.width / 12.5;

    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          backgroundColor: SolidColors.scafoldBackground,
          child: Padding(
            padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin),
            child: ListView(
              children: [
                DrawerHeader(
                    child: Image.asset(
                  Assets.images.logo.path,
                  scale: 1.6,
                )),
                const Divider(
                  color: SolidColors.dividerColor,
                  thickness: 1,
                ),
                ListTile(
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
                  title: Text(
                    'اشتراک گذاری تک بلاگ',
                    style: textTheme.bodyText1,
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                  thickness: 1,
                ),
                ListTile(
                  title: Text(
                    'تک‌بلاگ در گیت هاب',
                    style: textTheme.bodyText1,
                  ),
                  onTap: () {},
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
              //menu icon in HomaPage top bar
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
            child: IndexedStack(index: selectedPageIndex, children: [
              HomeScreen(
                  size: size,
                  textTheme: textTheme,
                  bodyMargin: bodyMargin), // index 0
              const RegisterTechBlog(), // index 1
              ProfileScreen(
                  size: size,
                  textTheme: textTheme,
                  bodyMargin: bodyMargin), // index 2
            ]),
          ),
          //buttons navigation bar
          BottomNavigationBar(
            size: size,
            bodyMargin: bodyMargin,
            setIndexPage: (value) {
              setState(() {
                selectedPageIndex = value;
              });
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
                    colors: GradientColors.buttonNavigationGradient)),
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
                      Navigator.of(context).pushReplacement(CupertinoPageRoute(
                          builder: (context) => const RegisterTechBlog()));
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
