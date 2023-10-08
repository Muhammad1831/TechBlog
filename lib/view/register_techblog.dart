import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/my_string.dart';

class RegisterTechBlog extends StatelessWidget {
  const RegisterTechBlog({super.key});

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
              Assets.images.guideRobot.path,
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
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Container(
                          height: size.height / 2.55,
                          width: double.maxFinite,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(30)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                MyString.enterEmail,
                                style: textTheme.bodyText1,
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(50, 20, 50, 50),
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  textDirection: TextDirection.ltr,
                                  // the input decoration theme is defined in the ThemeData in the main file
                                  decoration: InputDecoration(
                                    hintText: "techblog@gmail.com",
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: () {}, child: const Text('ادامه'))
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: const Text('بزن بریم'),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
