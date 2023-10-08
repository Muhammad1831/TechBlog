import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:techblog/my_colors.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:techblog/view/splash_screen.dart';

void main() {
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

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa'), // farsi
      ],

      theme: ThemeData(
          // Theme used in application text fields
          inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(width: 1.5)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(width: 1.5)),
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
                borderRadius: BorderRadius.all(Radius.circular(10)),
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
                      color: SolidColors.posterHomePageTitle,
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
                color: SolidColors.posterHomePageTitle,
                fontWeight: FontWeight.w700),
            headline2: TextStyle(
                fontFamily: 'iran',
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w300),
            headline3: TextStyle(
                fontFamily: 'iran',
                fontSize: 14,
                color: SolidColors.myStringClass,
                fontWeight: FontWeight.w700),
            bodyText1: TextStyle(
                fontFamily: 'iran',
                fontSize: 14,
                color: SolidColors.textTitle,
                fontWeight: FontWeight.w700),
            headline4: TextStyle(
                fontFamily: 'iran',
                fontSize: 14,
                color: SolidColors.posterHomePageSubTitle,
                fontWeight: FontWeight.w300),
            headline5: TextStyle(
                fontFamily: 'iran',
                fontSize: 14,
                color: SolidColors.hintText,
                fontWeight: FontWeight.w300),
            bodyText2: TextStyle(
                fontFamily: 'iran',
                fontSize: 20,
                color: Color.fromARGB(255, 72, 72, 72),
                fontWeight: FontWeight.w300),
          )),
      //go to the splash screen
      home: const SplashScreen(),
    );
  }
}
