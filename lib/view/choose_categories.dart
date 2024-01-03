import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:techblog/controller/home_screen_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/component/my_colors.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/component/my_string.dart';
import 'package:techblog/view/main_screen/home_page.dart';

class ChooseCategories extends StatefulWidget {
  const ChooseCategories({super.key});

  @override
  State<ChooseCategories> createState() => _ChooseCategoriesState();
}

class _ChooseCategoriesState extends State<ChooseCategories> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double bodyMargin = size.width / 10;

    RxList chooseCategoriesLike = RxList();

    var homeScreenController = Get.find<HomeScreenController>();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.normal),
          child: Padding(
            padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  SvgPicture.asset(Assets.images.happyGuideRobot.path,
                      height: size.height / 6.7),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    MyString.completeRegisteration,
                    style: textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const TextField(
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      hintText: "نام و نام خانوادگی",
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    MyString.chooseCategoriesLike,
                    style: textTheme.bodyText1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: SizedBox(
                      width: double.infinity,
                      height: 100,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: homeScreenController.tagList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                childAspectRatio: 0.3),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              if (!chooseCategoriesLike.contains(
                                  homeScreenController.tagList[index].title)) {
                                chooseCategoriesLike.add(
                                    homeScreenController.tagList[index].title!);
                              }
                            },
                            child: TagContainer(
                                size: size, textTheme: textTheme, index: index),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Image.asset(
                    Assets.images.flashDown.path,
                    scale: 2.2,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: chooseCategoriesLike.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Container(
                            height: size.height / 22.5,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                color: SolidColors.surface),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    chooseCategoriesLike[index].value,
                                    style: textTheme.bodyText1,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        chooseCategoriesLike.removeAt(index);
                                      });
                                    },
                                    child: const Icon(
                                      CupertinoIcons.delete,
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 45),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacement(CupertinoPageRoute(
                            builder: (context) => HomePage(),
                          ));
                        },
                        child: Text(
                          'ادامه',
                          style: textTheme.headline1,
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
