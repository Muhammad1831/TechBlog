import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:techblog/controller/register_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/component/my_string.dart';
import 'package:validators/validators.dart';

// ignore: must_be_immutable
class RegisterTechBlog extends StatelessWidget {
  RegisterTechBlog({super.key});
  var registerController = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.images.happyGuideRobot.path,
              height: size.height / 6.7,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: MyString.welcomeTechBlog,
                    style: textTheme.bodyText1,
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height / 12),
              child: ElevatedButton(
                onPressed: () {
                  _showEmailBottomSheet(context, size, textTheme);
                },
                child: const Text('بزن بریم',
                    style: TextStyle(color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    ));
  }

  Future<dynamic> _showEmailBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2.55,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  MyString.enterEmail,
                  style: textTheme.bodyText1,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 20, 50, 50),
                  child: TextField(
                    controller: registerController.emailTextEditingController,
                    onChanged: (value) {
                      isEmail(value);
                    },
                    style: textTheme.bodyText1,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                    // the input decoration theme is defined in the ThemeData in the main file
                    decoration: const InputDecoration(
                      hintText: "techblog@gmail.com",
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      registerController.register();
                      registerController.emailTextEditingController.clear();
                      // Navigator.pop(context);
                      _activatorCodeBottomSheet(context, size, textTheme);
                    },
                    child: Text('ادامه', style: textTheme.headline1))
              ],
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> _activatorCodeBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2.55,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  MyString.enterActivatorCode,
                  style: textTheme.bodyText1,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 20, 50, 50),
                  child: TextField(
                    controller:
                        registerController.activeCodeTextEditingController,
                    style: textTheme.bodyText1,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                    // the input decoration theme is defined in the ThemeData in the main file
                    decoration: const InputDecoration(
                      hintText: "******",
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      registerController.verify();

                      // Navigator.of(context).pushReplacement(CupertinoPageRoute(
                      //   builder: (context) => const ChooseCategories(),
                      // ));
                    },
                    child: Text('ادامه', style: textTheme.headline1))
              ],
            ),
          ),
        );
      },
    );
  }
}
