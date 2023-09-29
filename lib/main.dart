import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:techblog/my_colors.dart';
import 'package:techblog/view/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
        headline4: TextStyle(
            fontFamily: 'iran',
            fontSize: 14,
            color: SolidColors.textTitle,
            fontWeight: FontWeight.w700),
        subtitle1: TextStyle(
            fontFamily: 'iran',
            fontSize: 14,
            color: SolidColors.posterHomePageSubTitle,
            fontWeight: FontWeight.w300),
        bodyText1: TextStyle(
            fontFamily: 'iran',
            fontSize: 20,
            color: Color.fromARGB(255, 72, 72, 72),
            fontWeight: FontWeight.w300),
      )),
      //go to the splash screen
      home: SplashScreen(),
    );
  }
}
