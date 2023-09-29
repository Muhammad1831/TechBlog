import 'package:flutter/material.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';
import 'package:techblog/my_colors.dart';
import 'package:techblog/my_string.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  });

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(
          decelerationRate: ScrollDecelerationRate.normal),
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          children: [
            //HomePage poster cover
            homePagePoster(size: size, textTheme: textTheme),
            //List tag in the HomePage
            homePageTagList(size: size, bodyMargin: bodyMargin, textTheme: textTheme),
            //pencil icon & viewHottestPosts title
            homePageHottestPostsTitle(bodyMargin: bodyMargin, textTheme: textTheme),
            //List Hottest Posts in HomePage
            homePageHottestPostsList(size: size, bodyMargin: bodyMargin, textTheme: textTheme),
            //microphone icon & viewHottestPodcast title
            homePageHottestPodcastTitle(bodyMargin: bodyMargin, textTheme: textTheme),
            //List Hottest Podcast in HomePage
            homePageHottestPodcastList(size: size, bodyMargin: bodyMargin, textTheme: textTheme),
            //an empty space for the bottom of the podcast list from the nvigator buttons bar
            const SizedBox(
              height: 90,
            )
          ],
        ),
      ),
    );
  }
}

class homePageHottestPodcastList extends StatelessWidget {
  const homePageHottestPodcastList({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  });

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.98,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: blogList.getRange(0, 5).length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
                8, 8, index == 0 ? bodyMargin : 8, 0),
            child: Column(
              children: [
                SizedBox(
                  height: size.height / 5.5,
                  width: size.width / 2.6,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage(
                                    blogList[index].imageURL),
                                fit: BoxFit.cover)),
                        foregroundDecoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(20),
                            gradient: const LinearGradient(
                                colors: GradientColors
                                    .hottestPostsImageGradient,
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)),
                      ),
                      Positioned(
                        bottom: 8,
                        right: 0,
                        left: 0,
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              blogList[index].writer,
                              style: textTheme.headline2,
                            ),
                            Row(
                              children: [
                                Text(
                                  blogList[index].views,
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
                    blogList[index].title,
                    style: textTheme.headline4,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class homePageHottestPodcastTitle extends StatelessWidget {
  const homePageHottestPodcastTitle({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
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
}

class homePageHottestPostsList extends StatelessWidget {
  const homePageHottestPostsList({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  });

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.98,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(
            decelerationRate: ScrollDecelerationRate.normal),
        scrollDirection: Axis.horizontal,
        itemCount: blogList.getRange(0, 5).length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
                8, 8, index == 0 ? bodyMargin : 8, 0),
            child: Column(
              children: [
                SizedBox(
                  height: size.height / 5.5,
                  width: size.width / 2.6,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(
                                  blogList[index].imageURL),
                              fit: BoxFit.cover,
                            )),
                        foregroundDecoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(20),
                            gradient: const LinearGradient(
                                colors: GradientColors
                                    .hottestPostsImageGradient,
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)),
                      ),
                      Positioned(
                        bottom: 8,
                        right: 0,
                        left: 0,
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              blogList[index].writer,
                              style: textTheme.headline2,
                            ),
                            Row(
                              children: [
                                Text(
                                  blogList[index].views,
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
                    blogList[index].title,
                    style: textTheme.headline4,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class homePageHottestPostsTitle extends StatelessWidget {
  const homePageHottestPostsTitle({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 40, bodyMargin, 0),
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
    );
  }
}

class homePageTagList extends StatelessWidget {
  const homePageTagList({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  });

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: SizedBox(
        height: size.height / 22.8,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.fast),
          scrollDirection: Axis.horizontal,
          itemCount: tagList.length,
          itemBuilder: (context, index) {
            return Padding(
              /*if it was our first container, it gives bodyMargin spaces
              from the right, otherwise it gives 8 spaces*/
              padding: EdgeInsets.fromLTRB(
                  8, 0, index == 0 ? bodyMargin : 8, 0),
              child: Container(
                height: size.height / 22.8,
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(15)),
                    gradient: LinearGradient(
                        colors: GradientColors.tag,
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight)),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 12),
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
                        tagList[index].tag_name,
                        style: textTheme.headline2,
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class homePagePoster extends StatelessWidget {
  const homePagePoster({
    super.key,
    required this.size,
    required this.textTheme,
  });

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // poster cover image
        Container(
          height: size.height / 4.2,
          width: size.width / 1.19,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                  image: AssetImage(
                      homePagePosterMap["posterImage"]),
                  fit: BoxFit.cover)),
          // the gradient is placed on the HomePage poster cover image
          foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: const LinearGradient(
                  colors:
                      GradientColors.posterCoverHomePageGradient,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
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
                  mainAxisAlignment:
                      MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                        homePagePosterMap["writer"] +
                            " - " +
                            homePagePosterMap["publicationDate"],
                        style: textTheme.subtitle1),
                    Row(
                      children: [
                        Text(homePagePosterMap["views"],
                            style: textTheme.subtitle1),
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
                Text(homePagePosterMap["title"],
                    style: textTheme.headline1)
              ],
            ))
      ],
    );
  }
}