import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';
import 'package:techblog/my_colors.dart';
import 'dart:math' as math;
import 'package:techblog/my_string.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //for easy access to textThemes
    TextTheme textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    //the distance of the body from the right side to align
    var bodyMargin = size.width / 12.5;

    return SafeArea(
      child: Scaffold(
        //HomaPage Appbar
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //menu icon in HomaPage top bar
              Icon(
                Icons.menu,
                color: SolidColors.menuIcon,
                size: size.width / 18,
              ),
              //logo image in HomaPage top bar
              Image(
                image: Assets.images.logo.provider(),
                height: size.height / 13.6,
              ),
              /* with Transform.rotate and named that angle: we can rotate
                    the widget assigned to child: */
              Transform.rotate(
                  //math.pi is equal 180°
                  angle: math.pi / 2,
                  //search icon in HomaPage top bar
                  child: IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.search,
                        color: SolidColors.searchIcon,
                        size: size.height / 31.6,
                      )))
            ],
          ),
          backgroundColor: SolidColors.scafoldBackground,
          elevation: 0,
        ),
        body: Stack(children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(
                decelerationRate: ScrollDecelerationRate.normal),
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                children: [
                  //HomePage poster cover
                  Stack(
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
                  ),
                  //List tag in the HomePage
                  Padding(
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
                  ),
                  //pencil icon & viewHottestPosts title
                  Padding(
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
                  ),
                  //List Hottest Posts in HomePage
                  SizedBox(
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
                  ),
                  //microphone icon & viewHottestPodcast title
                  Padding(
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
                  ),
                  //List Hottest Podcast in HomePage
                  SizedBox(
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
                  ),
                  //an empty space for the bottom of the podcast list from the nvigator buttons bar
                  const SizedBox(
                    height: 90,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: size.height / 10,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: GradientColors.buttonNavigationBackGroundGradient,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              child: Padding(
                padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      gradient: LinearGradient(
                          colors: GradientColors.buttonNavigationGradient)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: (() {}),
                          icon: ImageIcon(
                            Assets.icons.homeIcon.provider(),
                            color: Colors.white,
                            size: 28,
                          )),
                      IconButton(
                          onPressed: (() {}),
                          icon: ImageIcon(
                            Assets.icons.writerIcon.provider(),
                            color: Colors.white,
                            size: 28,
                          )),
                      IconButton(
                          onPressed: (() {}),
                          icon: ImageIcon(
                            Assets.icons.userIcon.provider(),
                            color: Colors.white,
                            size: 28,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
