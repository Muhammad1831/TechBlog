import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:techblog/component/my_colors.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/component/params.dart';
import 'package:techblog/component/pencil_blue_title.dart';
import 'package:techblog/controller/article/article_manage_controller.dart';
import 'package:techblog/controller/file_picker_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/services/file_picker.dart';

// ignore: must_be_immutable
class ArtilcePostInfo extends StatelessWidget {
  ArtilcePostInfo({super.key});
  TextEditingController titleTextEditingController = TextEditingController();

  var articleManageController = Get.find<ArticleManageController>();
  var filePickerController = Get.find<FilePickerController>();
  RxString baseTitle =
      'اینجا عنوان مقاله قرار میگیره ، یه عنوان جذاب انتخاب کن'.obs;
  var baseContent =
      '''من متن و بدنه اصلی مقاله هستم ، اگه میخوای من رو ویرایش کنی و یه مقاله جذاب بنویسی ، نوشته آبی رنگ بالا که نوشته "ویرایش متن اصلی مقاله" رو با انگشتت لمس کن تا وارد ویرایشگر بشی''';

  updataTitle() {
    articleManageController.articleInfoModel.update((val) {
      val!.title = titleTextEditingController.text;
      baseTitle.value = titleTextEditingController.text;
    });
  }

  getTitle() {
    Get.dialog(
        Center(
          child: Container(
            height: Params.size.height / 4,
            width: Params.size.width / 1.2,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white),
            child: Padding(
              padding: EdgeInsets.only(
                  right: Params.halfBodyMargin, left: Params.halfBodyMargin),
              child: Column(
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        Assets.images.happyGuideRobot.path,
                        height: Params.size.height / 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Text(
                          'لطفا یه عنوان پر معنا و کوتاه انتخاب کن',
                          style: Params.textTheme.bodyText1,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Material(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: Params.size.height / 16,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          controller: titleTextEditingController,
                          style: Params.textTheme.bodyText1,
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                borderSide: BorderSide(
                                    color: SolidColors.primaryColor)),
                            fillColor: Color.fromARGB(255, 250, 250, 250),
                            filled: true,
                            hintText: "عنوان را وارد کنید",
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          updataTitle();
                          Get.back();
                        },
                        child: Container(
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              'تایید',
                              style: Params.textTheme.bodyText1,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              'بعدا',
                              style: Params.textTheme.bodyText1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        barrierDismissible: true,
        useSafeArea: true);
  }

  getContent() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: [
                Stack(
                  children: [
                    filePickerController.fileImage.value.name == 'nothing'
                        ? Image.asset(Assets.images.singlePlaceHolder.path)
                        : Image.file(
                            File(filePickerController.fileImage.value.path!),
                            fit: BoxFit.cover),
                    //  Container(
                    //     height: Params.size.height / 3.1,
                    //     width: double.maxFinite,
                    //     decoration: BoxDecoration(
                    //       gradient: const LinearGradient(
                    //           colors:
                    //               GradientColors.posterSingleArticleScreen,
                    //           begin: Alignment.topCenter,
                    //           end: Alignment.bottomCenter),
                    //       image: DecorationImage(
                    //           image: NetworkImage(articleManageController
                    //               .articleInfoModel.value.image!)),
                    //     )),
                    Positioned(
                      right: 12,
                      top: 8,
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: ImageIcon(
                          Assets.icons.rightArrow.provider(),
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              filePicker();
                            },
                            child: Container(
                              height: Params.size.height / 24,
                              width: Params.size.width / 3,
                              decoration: const BoxDecoration(
                                  color: SolidColors.primaryColor,
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(8))),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 12, right: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'انتخاب تصویر',
                                      style: Params.textTheme.headline2,
                                    ),
                                    const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 20,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    getTitle();
                    titleTextEditingController.clear();
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.fromLTRB(0, 45, Params.halfBodyMargin, 0),
                    child: const PencilBlueTitle(title: 'ویرایش عنوان مقاله'),
                  ),
                ),
                // title
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 12, Params.halfBodyMargin, 0),
                  child: Text(
                    baseTitle.value,
                    style: const TextStyle(
                      fontFamily: 'iran',
                      fontSize: 16,
                      color: SolidColors.textTitle,
                      fontWeight: FontWeight.w700,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getContent();
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.fromLTRB(0, 35, Params.halfBodyMargin, 0),
                    child:
                        const PencilBlueTitle(title: 'ویرایش متن اصلی مقاله'),
                  ),
                ),
                // content
                Padding(
                  padding:
                      EdgeInsets.fromLTRB(16, 12, Params.halfBodyMargin, 0),
                  child: HtmlWidget(
                    '''<h4>$baseContent</h4>''',
                    textStyle: Params.textTheme.bodyText1,
                    enableCaching: true,
                    onLoadingBuilder: (context, element, loadingProgress) =>
                        const Loading(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 60, Params.halfBodyMargin, 0),
                  child: const PencilBlueTitle(title: 'انتخاب دسته بندی '),
                ),
                // tags list
                // tagsList(size, halfBodyMargin, textTheme),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Padding tagsList(Size size, double halfBodyMargin, TextTheme textTheme) {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 50),
  //     child: SizedBox(
  //       height: size.height / 22.8,
  //       child: ListView.builder(
  //         physics: const BouncingScrollPhysics(
  //             decelerationRate: ScrollDecelerationRate.fast),
  //         scrollDirection: Axis.horizontal,
  //         itemCount: articleManageController.tagsInfo.length,
  //         itemBuilder: (context, index) {
  //           return Padding(
  //               padding:
  //                   EdgeInsets.fromLTRB(8, 0, index == 0 ? halfBodyMargin : 8, 0),
  //               child: GestureDetector(
  //                 onTap: () async {
  //                   var tagId = articleManageController.tagsInfo[index].id!;
  //                   articleManageController.appBarTitle.value =
  //                       articleManageController.tagsInfo[index].title!;
  //                   await articleListController.getArticleListWithTagId(tagId);
  //                   Get.toNamed(RoutePage.articleList);
  //                 },
  //                 child: Container(
  //                   height: size.height / 22.8,
  //                   decoration: const BoxDecoration(
  //                       borderRadius: BorderRadius.all(Radius.circular(25)),
  //                       gradient: LinearGradient(
  //                           colors: GradientColors.tag,
  //                           begin: Alignment.centerLeft,
  //                           end: Alignment.centerRight)),
  //                   child: Padding(
  //                     padding: const EdgeInsets.only(left: 20, right: 12),
  //                     child: Row(
  //                       children: [
  //                         //hash tag icon in every container
  //                         ImageIcon(
  //                           Assets.icons.hashTagIcon.provider(),
  //                           color: Colors.white,
  //                           size: 15,
  //                         ),
  //                         const SizedBox(
  //                           width: 8,
  //                         ),
  //                         //the title written in each container
  //                         Text(
  //                           articleManageController.tagsInfo[index].title!,
  //                           style: textTheme.headline2,
  //                         )
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ));
  //         },
  //       ),
  //     ),
  //   );
  // }
}
