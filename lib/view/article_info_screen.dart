import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:techblog/component/my_colors.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/component/my_string.dart';
import 'package:techblog/controller/article_info_controller.dart';
import 'package:techblog/controller/article_list_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/view/article_list_screen.dart';

// ignore: must_be_immutable
class ArticleInfoScreen extends StatelessWidget {
  ArticleInfoScreen({super.key});

  ArticleInfoController articleInfoController =
      Get.put(ArticleInfoController());
  ArticleListController articleListController =
      Get.put(ArticleListController());

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width / 12.5;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Obx(
              () => articleInfoController.loading.value == true
                  ? const Loading()
                  : Column(
                      children: [
                        Stack(
                          children: [
                            CachedNetworkImage(
                                imageUrl: articleInfoController
                                    .articleInfoModel.value.image!,
                                imageBuilder: (context, imageProvider) {
                                  return Container(
                                    height: size.height / 3.1,
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover)),
                                  );
                                },
                                placeholder: (context, url) {
                                  return const Loading();
                                },
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                      Assets.images.singlePlaceHolder.path,
                                      fit: BoxFit.cover,
                                    )),
                            Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 80,
                                  decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: GradientColors
                                              .posterSingleArticleScreen,
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter)),
                                )),
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
                            const Positioned(
                              left: 54,
                              top: 8,
                              child: Icon(
                                Icons.bookmark_outline,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                            const Positioned(
                              left: 12,
                              top: 8,
                              child: Icon(
                                Icons.share,
                                color: Colors.white,
                                size: 25,
                              ),
                            )
                          ],
                        ),
                        // title
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 16, 12, 16),
                          child: Text(
                            articleInfoController.articleInfoModel.value.title!,
                            style: const TextStyle(
                              fontFamily: 'iran',
                              fontSize: 18,
                              color: SolidColors.textTitle,
                              fontWeight: FontWeight.w700,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 2,
                          ),
                        ),
                        // author image, author name and createdAt
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Row(
                            children: [
                              Container(
                                height: 36,
                                width: 36,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            Assets.images.profileAvatar.path))),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Text(
                                articleInfoController
                                    .articleInfoModel.value.author!,
                                style: textTheme.bodyText1,
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Text(
                                articleInfoController
                                    .articleInfoModel.value.createdAt!,
                                style: textTheme.headline5,
                              ),
                            ],
                          ),
                        ),
                        // content
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                          child: HtmlWidget(
                            '''<h3>${articleInfoController.articleInfoModel.value.content!}</h3>''',
                            textStyle: textTheme.bodyText1,
                            enableCaching: true,
                            onLoadingBuilder:
                                (context, element, loadingProgress) =>
                                    const Loading(),
                          ),
                        ),
                        // tags list
                        tagsList(size, bodyMargin, textTheme),

                        const SizedBox(
                          height: 48,
                        ),
                        // title of relatedPosts
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: bodyMargin),
                            child: Text(
                              MyString.relatedPosts,
                              style: textTheme.headline3,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        // posts list
                        homePageHottestPostsList(context),
                        const SizedBox(
                          height: 24,
                        )
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Padding tagsList(Size size, double bodyMargin, TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: SizedBox(
        height: size.height / 22.8,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.fast),
          scrollDirection: Axis.horizontal,
          itemCount: articleInfoController.tagsInfo.length,
          itemBuilder: (context, index) {
            return Padding(
                padding:
                    EdgeInsets.fromLTRB(8, 0, index == 0 ? bodyMargin : 8, 0),
                child: GestureDetector(
                  onTap: () async {
                    var tagId = articleInfoController.tagsInfo[index].id!;
                    articleInfoController.appBarTitle.value =
                        articleInfoController.tagsInfo[index].title!;
                    await articleListController.getArticleListWithTagId(tagId);
                    Get.to(ArticleListScreen());
                  },
                  child: Container(
                    height: size.height / 22.8,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        gradient: LinearGradient(
                            colors: GradientColors.tag,
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 12),
                      child: Row(
                        children: [
                          //hash tag icon in every container
                          ImageIcon(
                            Assets.icons.hashTagIcon.provider(),
                            color: Colors.white,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          //the title written in each container
                          Text(
                            articleInfoController.tagsInfo[index].title!,
                            style: textTheme.headline2,
                          )
                        ],
                      ),
                    ),
                  ),
                ));
          },
        ),
      ),
    );
  }

  Widget homePageHottestPostsList(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width / 12.5;

    return SizedBox(
      height: size.height / 3.98,
      child: Obx(() {
        return ListView.builder(
          physics: const BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.normal),
          scrollDirection: Axis.horizontal,
          itemCount: articleInfoController.relatedInfo.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                articleInfoController.id.value =
                    int.parse(articleInfoController.relatedInfo[index].id!);
                articleInfoController.getArticleInfo();
                Get.to(ArticleInfoScreen());
              },
              child: Padding(
                padding:
                    EdgeInsets.fromLTRB(8, 8, index == 0 ? bodyMargin : 8, 0),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height / 5.5,
                      width: size.width / 2.6,
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                articleInfoController.relatedInfo[index].image!,
                            imageBuilder: (context, imageProvider) {
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    )),
                                foregroundDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: const LinearGradient(
                                        colors: GradientColors
                                            .hottestPostsImageGradient,
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter)),
                              );
                            },
                            placeholder: (context, url) {
                              return const Loading();
                            },
                            errorWidget: (context, url, error) => Image.asset(
                              Assets.images.singlePlaceHolder.path,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 8,
                            right: 0,
                            left: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  articleInfoController
                                              .relatedInfo[index].author ==
                                          null
                                      ? 'Null'
                                      : articleInfoController
                                          .relatedInfo[index].author!,
                                  style: textTheme.headline2,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      articleInfoController
                                          .relatedInfo[index].view!,
                                      style: textTheme.headline2,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    const Icon(
                                      Icons.remove_red_eye,
                                      color: Colors.white,
                                      size: 16,
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width / 2.6,
                      child: Text(
                        articleInfoController.relatedInfo[index].title!,
                        style: textTheme.bodyText1,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
