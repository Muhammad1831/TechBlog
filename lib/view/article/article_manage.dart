import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:techblog/common/route_page.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/component/params.dart';
import 'package:techblog/controller/article/article_info_controller.dart';
import 'package:techblog/controller/article/article_manage_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/component/my_string.dart';

// ignore: must_be_immutable
class ArticleManage extends StatelessWidget {
  ArticleManage({super.key});
  var articleManageController = Get.find<ArticleManageController>();
  var articleInfoController = Get.find<ArticleInfoController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: customAppBar('مدیریت مقاله ها'),
      body: Obx(() => articleManageController.loading.isTrue
          ? const Loading()
          : articleManageController.articleListManage.isEmpty
              ? const EmptyState()
              : ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: articleManageController.articleListManage.length,
                  itemBuilder: (context, index) {
                    int status = int.parse(articleManageController
                        .articleListManage[index].status!);
                    String statusText;

                    switch (status) {
                      case 0:
                        statusText = 'پیش نویس';
                        break;
                      case 1:
                        statusText = 'منتشر شده';
                        break;
                      case 2:
                        statusText = 'در انتظار تایید';
                        break;
                      default:
                        statusText = 'Null';
                    }
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 12, 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CachedNetworkImage(
                              imageUrl: articleManageController
                                      .articleListManage[index].image!.isEmpty
                                  ? Assets.images.singlePlaceHolder.path
                                  : articleManageController
                                      .articleListManage[index].image!,
                              imageBuilder: (context, imageProvider) {
                                return InkWell(
                                  onTap: () {
                                    articleInfoController.id.value = int.parse(
                                        articleManageController
                                            .articleListManage[index].id
                                            .toString());
                                    articleInfoController.getArticleInfo();
                                    Get.toNamed(RoutePage.articleInfo);
                                  },
                                  child: Container(
                                    height: Params.size.height / 8.5,
                                    width: Params.size.width / 4,
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
                                  articleManageController
                                      .articleListManage[index].title!,
                                  style: Params.textTheme.bodyText1,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    articleManageController
                                                .articleListManage[index]
                                                .author ==
                                            null
                                        ? 'Null'
                                        : articleManageController
                                            .articleListManage[index].author!,
                                    style: Params.textTheme.caption,
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    '${articleManageController.articleListManage[index].view!} بازدید',
                                    style: Params.textTheme.caption,
                                  ),
                                  const SizedBox(
                                    width: 45,
                                  ),
                                  Text(
                                    statusText,
                                    style: Params.textTheme.headline3,
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                )),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 32, right: 32, bottom: Get.height / 40),
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed(RoutePage.artilcePostInfo);
          },
          style: ButtonStyle(
              shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))))),
          child: const Text('بریم برای نوشتن یه مقاله باحال',
              style: TextStyle(color: Colors.white)),
        ),
      ),
    ));
  }
}

class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Params.size.height / 4.3,
          ),
          SvgPicture.asset(
            Assets.images.sadGuideRobot.path,
            height: Params.size.height / 6.7,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: MyString.nothingArticle,
                  style: Params.textTheme.bodyText1,
                )),
          ),
          SizedBox(
            height: Params.size.height / 3.75,
          ),
        ],
      ),
    );
  }
}
