import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/controller/article_info_controller.dart';
import 'package:techblog/controller/article_list_controller.dart';
import 'package:techblog/controller/home_screen_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';
import 'package:techblog/component/my_colors.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/component/my_string.dart';
import 'package:techblog/view/article_info_screen.dart';
import 'package:techblog/view/article_list_screen.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  });

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  ArticleInfoController articleInfoController =
      Get.put(ArticleInfoController());
  ArticleListController articleListController =
      Get.put(ArticleListController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            decelerationRate: ScrollDecelerationRate.normal),
        child: Obx(() => homeScreenController.loading.value == true
            ? const Loading()
            : Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Column(
                  children: [
                    //HomePage poster cover
                    homePagePoster(),
                    //List tag in the HomePage
                    homePageTagList(),
                    //pencil icon & viewHottestPosts title
                    homePageHottestPostsTitle(),
                    //List Hottest Posts in HomePage
                    homePageHottestPostsList(),
                    //microphone icon & viewHottestPodcast title
                    homePageHottestPodcastTitle(),
                    //List Hottest Podcast in HomePage
                    homePageHottestPodcastList(),
                    //an empty space for the bottom of the podcast list from the nvigator buttons bar
                    const SizedBox(
                      height: 90,
                    )
                  ],
                ),
              )),
      ),
    );
  }

  Widget homePagePoster() {
    return GestureDetector(
      onTap: () {
        articleInfoController.id.value =
            int.parse(homeScreenController.poster.value.id.toString());
        articleInfoController.getArticleInfo();
        Get.to(ArticleInfoScreen());
      },
      child: Stack(
        children: [
          // poster cover image
          SizedBox(
            height: size.height / 4.2,
            width: size.width / 1.19,
            child: CachedNetworkImage(
              imageUrl: homeScreenController.poster.value.image!,
              imageBuilder: (context, imageProvider) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover)),
                  foregroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: const LinearGradient(
                          colors: GradientColors.posterCoverHomePageGradient,
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
          ),
          // the gradient is placed on the HomePage poster cover image
          // Container(
          //     height: size.height / 4.2,
          //     width: size.width / 1.19,
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(25),
          //         gradient: const LinearGradient(
          //             colors:
          //                 GradientColors.posterCoverHomePageGradient,
          //             begin: Alignment.topCenter,
          //             end: Alignment.bottomCenter))),
          Positioned(
              bottom: 12,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        homePagePosterMap["writer"] +
                            " - " +
                            homePagePosterMap["publicationDate"],
                        style: textTheme.headline4,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                      Row(
                        children: [
                          Text(homePagePosterMap["views"],
                              style: textTheme.headline4),
                          const SizedBox(
                            width: 5,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 16),
                    child: Text(
                      homeScreenController.poster.value.title!,
                      style: textTheme.headline1,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }

  Widget homePageTagList() {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: SizedBox(
        height: size.height / 22.8,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.fast),
          scrollDirection: Axis.horizontal,
          itemCount: homeScreenController.tagList.length,
          itemBuilder: (context, index) {
            return Padding(
              /*if it was our first container, it gives bodyMargin spaces
              from the right, otherwise it gives 8 spaces*/
              padding:
                  EdgeInsets.fromLTRB(8, 0, index == 0 ? bodyMargin : 8, 0),
              child: GestureDetector(
                  onTap: () {
                    var tagId = homeScreenController.tagList[index].id!;
                    articleListController.getArticleListWithTagId(tagId);
                    Get.to(ArticleListScreen());
                  },
                  child: TagContainer(
                      size: size, textTheme: textTheme, index: index)),
            );
          },
        ),
      ),
    );
  }

  Widget homePageHottestPostsTitle() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 40, bodyMargin, 0),
      child: GestureDetector(
        onTap: () {
          Get.to(ArticleListScreen());
        },
        child: Row(
          children: [
            ImageIcon(
              Assets.icons.pencilIcon.provider(),
              color: SolidColors.pencilIcon,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              MyString.viewHottestPosts,
              style: textTheme.headline3,
            )
          ],
        ),
      ),
    );
  }

  Widget homePageHottestPostsList() {
    return SizedBox(
      height: size.height / 3.98,
      child: Obx(() {
        return ListView.builder(
          physics: const BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.normal),
          scrollDirection: Axis.horizontal,
          itemCount: homeScreenController.topVisitedPosts.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  EdgeInsets.fromLTRB(8, 8, index == 0 ? bodyMargin : 8, 0),
              child: GestureDetector(
                onTap: () {
                  articleInfoController.id.value = int.parse(
                      homeScreenController.topVisitedPosts[index].id
                          .toString());
                  articleInfoController.getArticleInfo();
                  Get.to(ArticleInfoScreen());
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height / 5.5,
                      width: size.width / 2.6,
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: homeScreenController
                                .topVisitedPosts[index].image!,
                            imageBuilder: (context, imageProvider) {
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: NetworkImage(homeScreenController
                                          .topVisitedPosts[index].image!),
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
                                  homeScreenController
                                      .topVisitedPosts[index].author!,
                                  style: textTheme.headline2,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      homeScreenController
                                          .topVisitedPosts[index].view!,
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
                        homeScreenController.topVisitedPosts[index].title!,
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

  Widget homePageHottestPodcastTitle() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 40, bodyMargin, 0),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.microphoneIcon.provider(),
            color: SolidColors.microphoneIcon,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            MyString.viewHottestPodcasts,
            style: textTheme.headline3,
          )
        ],
      ),
    );
  }

  Widget homePageHottestPodcastList() {
    return SizedBox(
      height: size.height / 3.98,
      child: Obx(() {
        return ListView.builder(
          physics: const BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.normal),
          scrollDirection: Axis.horizontal,
          itemCount: homeScreenController.topVisitedPodcast.length,
          itemBuilder: (context, index) {
            return Padding(
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
                          imageUrl: homeScreenController
                              .topVisitedPosts[index].image!,
                          imageBuilder: (context, imageProvider) {
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover)),
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
                                homeScreenController
                                            .topVisitedPodcast[index].author ==
                                        null
                                    ? 'NULL'
                                    : homeScreenController
                                        .topVisitedPodcast[index].author!,
                                style: textTheme.displayMedium,
                              ),
                              Row(
                                children: [
                                  Text(
                                    homeScreenController
                                        .topVisitedPodcast[index].view!,
                                    style: textTheme.displayMedium,
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
                      homeScreenController.topVisitedPodcast[index].title!,
                      style: textTheme.bodyText1,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  )
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
