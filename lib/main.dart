import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/common/binding.dart';
import 'package:techblog/component/my_colors.dart';
import 'package:techblog/common/route_page.dart';
import 'package:techblog/view/article/article_info_screen.dart';
import 'package:techblog/view/article/article_list_screen.dart';
import 'package:techblog/view/article/article_manage.dart';
import 'package:techblog/view/article/article_post_info.dart';
import 'package:techblog/view/choose_categories.dart';
import 'package:techblog/view/main_screen/home_page.dart';
import 'package:techblog/view/main_screen/home_screen.dart';
import 'package:techblog/view/main_screen/profile_screen.dart';
import 'package:techblog/view/register/register_techblog.dart';
import 'package:techblog/view/splash_screen.dart';

void main() async {
  await GetStorage.init();

  //setting the color of the icons and the background of the status bar and the navigator system
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: SolidColors.statusBarColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: SolidColors.systemNavigationBarColor,
      systemNavigationBarIconBrightness: Brightness.dark));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width / 12.5;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('fa', 'IR'),

      getPages: [
        GetPage(
            name: RoutePage.homePage,
            page: () => HomePage(),
            binding: RegisterBinding()),
        GetPage(
            name: RoutePage.homeScreen,
            page: () => HomeScreen(),
            binding: ArticleBinding()),
        GetPage(
            name: RoutePage.profileScreen,
            page: () => ProfileScreen(
                  size: size,
                  textTheme: context.textTheme,
                  bodyMargin: bodyMargin,
                )),
        GetPage(
            name: RoutePage.registerTechBlog,
            page: () => RegisterTechBlog(),
            binding: RegisterBinding()),
        GetPage(
            name: RoutePage.chooseCategories,
            page: () => const ChooseCategories()),
        GetPage(
            name: RoutePage.articleInfo,
            page: () => ArticleInfoScreen(),
            binding: ArticleBinding()),
        GetPage(
            name: RoutePage.articleList,
            page: () => ArticleListScreen(),
            binding: ArticleBinding()),
        GetPage(
            name: RoutePage.articleManage,
            page: () => ArticleManage(),
            bindings: [ManageBinding(), ArticleBinding()]),
        GetPage(
            name: RoutePage.artilcePostInfo,
            page: () => ArtilcePostInfo(),
            bindings: [ManageBinding(), FilePickerBinding()]),
      ],

      theme: lightTheme(size),
      //go to the splash screen
      home: const SplashScreen(),
    );
  }

  ThemeData lightTheme(Size size) {
    return ThemeData(
        // Theme used in application text fields
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 45, 180, 230), width: 1.5)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 45, 180, 230), width: 1.5)),
            hintStyle: const TextStyle(
                fontFamily: 'iran',
                fontSize: 14,
                color: SolidColors.hintText,
                fontWeight: FontWeight.w300),
            filled: true,
            fillColor: SolidColors.textFieldColor),
        // the Theme used in the application buttons
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            fixedSize: MaterialStatePropertyAll(
                Size(size.width / 2.5, size.height / 15.4)),
            shape: MaterialStateProperty.all(const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            )),
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.pressed)) {
                  return SolidColors.pencilIcon;
                }
                return SolidColors.primaryColor;
              },
            ),
            textStyle: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return const TextStyle(
                    fontFamily: 'iran',
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700);
              }
              return const TextStyle(
                  fontFamily: 'iran',
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w300);
            }),
          ),
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontFamily: 'iran',
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w700),
          headline2: TextStyle(
              fontFamily: 'iran',
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w300),
          headline3: TextStyle(
              fontFamily: 'iran',
              fontSize: 14,
              color: Color.fromARGB(255, 40, 107, 184),
              fontWeight: FontWeight.w700),
          bodyText1: TextStyle(
            fontFamily: 'iran',
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
          headline4: TextStyle(
              fontFamily: 'iran',
              fontSize: 14,
              color: Color.fromARGB(204, 255, 255, 255),
              fontWeight: FontWeight.w300),
          headline5: TextStyle(
              fontFamily: 'iran',
              fontSize: 14,
              color: Color.fromARGB(255, 190, 190, 190),
              fontWeight: FontWeight.w300),
          bodyText2: TextStyle(
              fontFamily: 'iran',
              fontSize: 20,
              color: Color.fromARGB(255, 72, 72, 72),
              fontWeight: FontWeight.w300),
        ));
  }
}
