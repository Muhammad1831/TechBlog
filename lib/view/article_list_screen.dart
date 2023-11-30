import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/controller/article_info_controller.dart';
import 'package:techblog/controller/article_list_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/view/article_info_screen.dart';

// ignore: must_be_immutable
class ArticleListScreen extends StatelessWidget {
  ArticleListScreen({super.key});
  ArticleListController articleListController =
      Get.put(ArticleListController());
  ArticleInfoController articleInfoController =
      Get.put(ArticleInfoController());
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: customAppBar(articleInfoController.appBarTitle.value),
      body: Obx(
        () => ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: articleListController.articleList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 12, 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                      imageUrl:
                          articleListController.articleList[index].image == null
                              ? Assets.images.singlePlaceHolder.path
                              : articleListController.articleList[index].image!,
                      imageBuilder: (context, imageProvider) {
                        return InkWell(
                          onTap: () {
                            articleInfoController.id.value = int.parse(
                                articleListController.articleList[index].id
                                    .toString());
                            articleInfoController.getArticleInfo();
                            Get.to(() => ArticleInfoScreen());
                          },
                          child: Container(
                            height: size.height / 8.5,
                            width: size.width / 4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                )),
                          ),
                        );
                      },
                      placeholder: (context, url) {
                        return const Loading();
                      },
                      errorWidget: (context, url, error) => Image.asset(
                            Assets.images.singlePlaceHolder.path,
                            fit: BoxFit.cover,
                          )),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 250,
                        child: Text(
                          articleListController.articleList[index].title!,
                          style: textTheme.bodyText1,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            articleListController.articleList[index].author ==
                                    null
                                ? 'Null'
                                : articleListController
                                    .articleList[index].author!,
                            style: textTheme.caption,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            '${articleListController.articleList[index].view!} بازدید',
                            style: textTheme.caption,
                          ),
                          const SizedBox(
                            width: 45,
                          ),
                          Text(
                            articleListController.articleList[index].catName!,
                            style: textTheme.headline3,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
