import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/NewsModel.dart';
import '../providers/providers.dart';
import '../widgets/Colors.dart';
import '../widgets/LoadingWidget.dart';
import '../widgets/NewsCard.dart';

class NewsScreen extends ConsumerStatefulWidget {
  const NewsScreen({super.key});

  @override
  ConsumerState<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends ConsumerState<NewsScreen> {
  List<Article> mainCarosal = [];
  List<Article> secondaryCarosal = [];
  List<Article> featuredNews = [];
  int mainCarosalCount = 5;
  int secondaryCarosalCount = 5;
  bool isLoading = false;
  Gallery3DController? _controller;

  loaddata() async {
    setState(() {
      isLoading = true;
    });
    await ref.read(newsProvider).news();
    final data = ref.read(newsProvider).newsmodel;

    for (int i = 0; i < mainCarosalCount; i++) {
      mainCarosal.add(data[i]);
    }
    for (var i = mainCarosalCount;
        i < secondaryCarosalCount + mainCarosalCount;
        i++) {
      secondaryCarosal.add(data[i]);
    }
    for (var i = mainCarosalCount + secondaryCarosalCount;
        i < data.length;
        i++) {
      featuredNews.add(data[i]);
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = Gallery3DController(itemCount: 5);

    loaddata();
  }

  @override
  Widget build(BuildContext context) {
    // final newsData = ref.read(newsProvider);
    return isLoading
        ?  Expanded(child: LoadingWidget())
        : Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CarouselSlider.builder(
                        itemBuilder: (context, index, realIndex) {
                          return GestureDetector(
                            onTap: () async {
                              await _launchUrl(
                                  mainCarosal[index].url.toString());
                            },
                            child: Stack(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                  ),
                                  child: Image.network(
                                    mainCarosal[index].urlToImage.toString(),
                                    fit: BoxFit.fill,
                                    height: MediaQuery.of(context).size.height *
                                        .26,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }
                                      return Center(
                                        child: Platform.isIOS
                                            ? CupertinoActivityIndicator(
                                                color: Appcolor.greycolor,
                                              )
                                            : CircularProgressIndicator(
                                                value: loadingProgress
                                                            .expectedTotalBytes !=
                                                        null
                                                    ? loadingProgress
                                                            .cumulativeBytesLoaded /
                                                        loadingProgress
                                                            .expectedTotalBytes!
                                                    : null,
                                              ),
                                      );
                                    },
                                    errorBuilder: (context, error, stackTrace) {
                                      return mainCarosal[index].source!.name ==
                                              "YouTube"
                                          ? Image.asset(
                                              'assets/image/youtube.png',
                                              fit: BoxFit.contain,
                                            )
                                          : Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  // Lottie.asset(
                                                  //   "assets/image/nodata.json",
                                                  //   height: 140,
                                                  // ),
                                                   Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        "No games have been played today",
                                                        style: TextStyle(
                                                            color: Appcolor
                                                                .secondarycolor,
                                                            fontSize: 18),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                    },
                                  ),
                                ),
                                Positioned(
                                  bottom: 18,
                                  child: Container(
                                    color: Colors.black38,
                                    width:
                                        // MediaQuery.of(context).size.width / 1.1,
                                        MediaQuery.of(context).size.width,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            mainCarosal[index].title.toString(),
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Appcolor.whitecolor,
                                                letterSpacing: 0.5),
                                          ),
                                          Text(
                                            mainCarosal[index]
                                                .description
                                                .toString(),
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Appcolor.whitecolor,
                                                letterSpacing: 0.5),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        itemCount: mainCarosal.length,
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: MediaQuery.of(context).size.height * .28,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                        )),
                    const SizedBox(
                      height: 3,
                    ),
                    AnimatedSmoothIndicator(
                      activeIndex: _controller!.currentIndex,
                      count: 5,
                      effect: const WormEffect(
                          activeDotColor: Colors.red,
                          dotHeight: 10,
                          dotWidth: 10),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    _controller != null
                        ? Center(
                            child: Gallery3D(
                              onClickItem: (value) async {
                                print('$value');
                                await _launchUrl(
                                    secondaryCarosal[value].url.toString());
                              },
                              onItemChanged: (value) {
                                setState(() {});
                              },
                              controller: _controller!,
                              itemBuilder: (BuildContext context, int index) {
                                return Center(
                                  child: Stack(
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          await _launchUrl(
                                              secondaryCarosal[index]
                                                  .url
                                                  .toString());
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.network(
                                              secondaryCarosal[index]
                                                  .urlToImage
                                                  .toString(),
                                              fit: BoxFit.fill,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .26,
                                              loadingBuilder:
                                                  (BuildContext context,
                                                      Widget child,
                                                      ImageChunkEvent?
                                                          loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return Center(
                                                  child: Platform.isIOS
                                                      ? CupertinoActivityIndicator(
                                                          color: Appcolor
                                                              .greycolor,
                                                        )
                                                      : CircularProgressIndicator(
                                                          value: loadingProgress
                                                                      .expectedTotalBytes !=
                                                                  null
                                                              ? loadingProgress
                                                                      .cumulativeBytesLoaded /
                                                                  loadingProgress
                                                                      .expectedTotalBytes!
                                                              : null,
                                                        ),
                                                );
                                              },
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return secondaryCarosal[index]
                                                            .source!
                                                            .name ==
                                                        "YouTube"
                                                    ? Image.asset(
                                                        'assets/image/youtube.png',
                                                        fit: BoxFit.contain,
                                                      )
                                                    : Center(
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            // Lottie.asset(
                                                            //   "assets/image/nodata.json",
                                                            //   height: 140,
                                                            // ),
                                                             Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children:
                                                              const[
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  "No games have been played today",
                                                                  style: TextStyle(
                                                                      color: Appcolor
                                                                          .secondarycolor,
                                                                      fontSize:
                                                                          18),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 1,
                                        child: Container(
                                          color: Colors.black38,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 18.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  secondaryCarosal[index]
                                                      .title
                                                      .toString(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          Appcolor.whitecolor,
                                                      letterSpacing: 0.5),
                                                ),
                                                Text(
                                                  secondaryCarosal[index]
                                                      .description
                                                      .toString(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          Appcolor.whitecolor,
                                                      letterSpacing: 0.5),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                              itemConfig: GalleryItemConfig(
                                  width:
                                      MediaQuery.of(context).size.width * 0.78,
                                  height:
                                      MediaQuery.of(context).size.height * 0.2),
                              width: MediaQuery.of(context).size.width,
                            ),
                          )
                        : const SizedBox(),
                    // CarouselSlider.builder(
                    //     itemBuilder: (context, index, realIndex) {
                    //       return GestureDetector(
                    //         onTap: () async {
                    //           await _launchUrl(
                    //               secondaryCarosal[index].url.toString());
                    //         },
                    //         child: Stack(
                    //           children: [
                    //             Container(
                    //               width: MediaQuery.of(context).size.width,
                    //               decoration: BoxDecoration(
                    //                 border: Border.all(color: Colors.black),
                    //               ),
                    //               child: ClipRRect(
                    //                 borderRadius: BorderRadius.circular(20),
                    //                 child: Image.network(
                    //                   secondaryCarosal[index]
                    //                       .urlToImage
                    //                       .toString(),
                    //                   fit: BoxFit.fill,
                    //                   height:
                    //                       MediaQuery.of(context).size.height *
                    //                           .26,
                    //                   loadingBuilder: (BuildContext context,
                    //                       Widget child,
                    //                       ImageChunkEvent? loadingProgress) {
                    //                     if (loadingProgress == null) {
                    //                       return child;
                    //                     }
                    //                     return Center(
                    //                       child: Platform.isIOS
                    //                           ? CupertinoActivityIndicator(
                    //                               color: Appcolor.greycolor,
                    //                             )
                    //                           : CircularProgressIndicator(
                    //                               value: loadingProgress
                    //                                           .expectedTotalBytes !=
                    //                                       null
                    //                                   ? loadingProgress
                    //                                           .cumulativeBytesLoaded /
                    //                                       loadingProgress
                    //                                           .expectedTotalBytes!
                    //                                   : null,
                    //                             ),
                    //                     );
                    //                   },
                    //                   errorBuilder:
                    //                       (context, error, stackTrace) {
                    //                     return secondaryCarosal[index]
                    //                                 .source!
                    //                                 .name ==
                    //                             "YouTube"
                    //                         ? Image.asset(
                    //                             'assets/image/youtube.png',
                    //                             fit: BoxFit.contain,
                    //                           )
                    //                         : Center(
                    //                             child: Column(
                    //                               mainAxisAlignment:
                    //                                   MainAxisAlignment.center,
                    //                               children: [
                    //                                 Lottie.asset(
                    //                                   "assets/image/nodata.json",
                    //                                   height: 140,
                    //                                 ),
                    //                                 Row(
                    //                                   mainAxisAlignment:
                    //                                       MainAxisAlignment
                    //                                           .center,
                    //                                   children: [
                    //                                     SizedBox(
                    //                                       width: 10,
                    //                                     ),
                    //                                     Text(
                    //                                       "No games have been played today",
                    //                                       style: TextStyle(
                    //                                           color: Appcolor
                    //                                               .secondarycolor,
                    //                                           fontSize: 18),
                    //                                     ),
                    //                                   ],
                    //                                 ),
                    //                               ],
                    //                             ),
                    //                           );
                    //                   },
                    //                 ),
                    //               ),
                    //             ),
                    //             Positioned(
                    //               bottom: 10,
                    //               child: Padding(
                    //                 padding: const EdgeInsets.symmetric(
                    //                     horizontal: 12.0),
                    //                 child: SizedBox(
                    //                   width: MediaQuery.of(context).size.width /
                    //                       1.1,
                    //                   child: Column(
                    //                     crossAxisAlignment:
                    //                         CrossAxisAlignment.start,
                    //                     children: [
                    //                       Text(
                    //                         secondaryCarosal[index]
                    //                             .title
                    //                             .toString(),
                    //                         overflow: TextOverflow.ellipsis,
                    //                         style: TextStyle(
                    //                             fontWeight: FontWeight.w500,
                    //                             color: Appcolor.whitecolor,
                    //                             letterSpacing: 0.5),
                    //                       ),
                    //                       Text(
                    //                         secondaryCarosal[index]
                    //                             .description
                    //                             .toString(),
                    //                         overflow: TextOverflow.ellipsis,
                    //                         style: TextStyle(
                    //                             fontWeight: FontWeight.w500,
                    //                             color: Appcolor.whitecolor,
                    //                             letterSpacing: 0.5),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //               ),
                    //             )
                    //           ],
                    //         ),
                    //       );
                    //     },
                    //     itemCount: secondaryCarosal.length,
                    //     options: CarouselOptions(
                    //       viewportFraction: 0.8,
                    //       autoPlay: false,
                    //       autoPlayInterval: Duration(seconds: 3),
                    //       autoPlayAnimationDuration:
                    //           Duration(milliseconds: 800),
                    //       autoPlayCurve: Curves.fastOutSlowIn,
                    //       enlargeCenterPage: true,
                    //       enlargeFactor: 0.2,
                    //       scrollDirection: Axis.horizontal,
                    //     )),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return NewsCard(
                          article: featuredNews[index],
                          index: index,
                        );
                      },
                      itemCount: featuredNews.length,
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
