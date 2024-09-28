// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/NewsModel.dart';
import 'Colors.dart';

class NewsCard extends StatefulWidget {
  final Article article;
  final int index;
  const NewsCard({super.key, required this.article, required this.index});

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  DateFormat dateFormat = DateFormat();
  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await _launchUrl(widget.article.url.toString());
      },
      child: Card(
        // margin: const EdgeInsets.only(top: 20),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Appcolor.whitecolor,
        child: Column(
          children: [
            Stack(
              children: [
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                //   child: Text(
                //     widget.article.title.toString(),
                //     style: TextStyle(
                //         fontWeight: FontWeight.w500,
                //         color: Appcolor.blackcolor,
                //         letterSpacing: 0.5),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                //   child: Text(
                //     widget.article.description.toString(),
                //     style: TextStyle(
                //         fontWeight: FontWeight.w500,
                //         color: Appcolor.blackcolor,
                //         letterSpacing: 0.5),
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    // borderRadius: BorderRadius.only(
                    //     bottomLeft: Radius.circular(20),
                    //     bottomRight: Radius.circular(20)),
                    child: Image.network(
                      widget.article.urlToImage.toString(),
                      fit: BoxFit.fill,
                      loadingBuilder: (BuildContext context, Widget child,
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
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return widget.article.source!.name == "YouTube"
                            ? Image.asset(
                                'assets/image/youtube.png',
                                fit: BoxFit.contain,
                              )
                            : Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Lottie.asset(
                                      "assets/image/nodata.json",
                                      height: 140,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "No games have been played today",
                                          style: TextStyle(
                                              color: Appcolor.secondarycolor,
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
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                //   child: Text(
                //     widget.article.title.toString(),
                //     style: TextStyle(
                //         fontWeight: FontWeight.w500,
                //         color: Appcolor.blackcolor,
                //         letterSpacing: 0.5),
                //   ),
                // ),
                Positioned(
                  bottom: 0,
                  // top: 0,
                  child: Align(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.1,
                      // height: 100,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            Text(
                              widget.article.title.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Appcolor.whitecolor,
                                  letterSpacing: 0.5),
                            ),
                            Text(
                              widget.article.description.toString(),
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
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Row(
                children: [
                  widget.article.urlToImage!.isEmpty
                      ? CircleAvatar(
                          radius: 15,
                          backgroundImage: Image.network(
                            'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                            fit: BoxFit.cover,
                            loadingBuilder: (BuildContext context, Widget child,
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
                              return widget.article.source!.name == "YouTube"
                                  ? const CircleAvatar(
                                      backgroundImage: AssetImage(
                                        'assets/image/youtube.png',
                                      ),
                                    )
                                  : const CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                                      ),
                                    );
                            },
                          ).image,
                        )
                      : CircleAvatar(
                          radius: 15,
                          backgroundImage: Image.network(
                            widget.article.urlToImage.toString(),
                            fit: BoxFit.cover,
                            loadingBuilder: (BuildContext context, Widget child,
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
                              return widget.article.source!.name == "YouTube"
                                  ? const CircleAvatar(
                                      backgroundImage: AssetImage(
                                        'assets/image/youtube.png',
                                      ),
                                    )
                                  : const CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                                      ),
                                    );
                            },
                          ).image,
                        ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.article.author!.isEmpty
                            ? "-"
                            : widget.article.author.toString(),
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Appcolor.blackcolor,
                          fontSize: 12,
                          letterSpacing: 0.5,
                        ),
                      ),
                      Text(
                        'MLS',
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Appcolor.greycolor,
                          fontSize: 12,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    Icons.navigate_next_rounded,
                    color: Appcolor.blackcolor,
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 5,
            ),
            // ListTile(
            //   contentPadding: EdgeInsets.only(
            //     left: 10,
            //     right: 10,
            //   ),
            //   leading: widget.article.urlToImage!.isEmpty
            //       ? CircleAvatar(
            //           backgroundImage: Image.network(
            //             'https://cdn-icons-png.flaticon.com/512/149/149071.png',
            //             fit: BoxFit.cover,
            //             loadingBuilder: (BuildContext context, Widget child,
            //                 ImageChunkEvent? loadingProgress) {
            //               if (loadingProgress == null) {
            //                 return child;
            //               }
            //               return Center(
            //                 child: Platform.isIOS
            //                     ? CupertinoActivityIndicator(
            //                         color: Appcolor.greycolor,
            //                       )
            //                     : CircularProgressIndicator(
            //                         value:
            //                             loadingProgress.expectedTotalBytes !=
            //                                     null
            //                                 ? loadingProgress
            //                                         .cumulativeBytesLoaded /
            //                                     loadingProgress
            //                                         .expectedTotalBytes!
            //                                 : null,
            //                       ),
            //               );
            //             },
            //             errorBuilder: (context, error, stackTrace) {
            //               return widget.article.source!.name == "YouTube"
            //                   ? const CircleAvatar(
            //                       backgroundImage: AssetImage(
            //                         'assets/image/youtube.png',
            //                       ),
            //                     )
            //                   : const CircleAvatar(
            //                       backgroundImage: NetworkImage(
            //                         'https://cdn-icons-png.flaticon.com/512/149/149071.png',
            //                       ),
            //                     );
            //             },
            //           ).image,
            //         )
            //       : CircleAvatar(
            //           radius: 20,
            //           backgroundImage: Image.network(
            //             widget.article.urlToImage.toString(),
            //             fit: BoxFit.cover,
            //             loadingBuilder: (BuildContext context, Widget child,
            //                 ImageChunkEvent? loadingProgress) {
            //               if (loadingProgress == null) {
            //                 return child;
            //               }
            //               return Center(
            //                 child: Platform.isIOS
            //                     ? CupertinoActivityIndicator(
            //                         color: Appcolor.greycolor,
            //                       )
            //                     : CircularProgressIndicator(
            //                         value:
            //                             loadingProgress.expectedTotalBytes !=
            //                                     null
            //                                 ? loadingProgress
            //                                         .cumulativeBytesLoaded /
            //                                     loadingProgress
            //                                         .expectedTotalBytes!
            //                                 : null,
            //                       ),
            //               );
            //             },
            //             errorBuilder: (context, error, stackTrace) {
            //               return widget.article.source!.name == "YouTube"
            //                   ? const CircleAvatar(
            //                       backgroundImage: AssetImage(
            //                         'assets/image/youtube.png',
            //                       ),
            //                     )
            //                   : const CircleAvatar(
            //                       backgroundImage: NetworkImage(
            //                         'https://cdn-icons-png.flaticon.com/512/149/149071.png',
            //                       ),
            //                     );
            //             },
            //           ).image,
            //         ),
            //   title: Text(
            //     widget.article.author!.isEmpty
            //         ? "-"
            //         : widget.article.author.toString(),
            //     maxLines: 1,
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       color: Appcolor.blackcolor,
            //       fontSize: 12,
            //       letterSpacing: 0.5,
            //     ),
            //   ),
            //   subtitle: Text(
            //     'MLS',
            //     maxLines: 1,
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       color: Appcolor.greycolor,
            //       fontSize: 12,
            //       letterSpacing: 0.5,
            //     ),
            //   ),
            //   trailing: Icon(
            //     Icons.navigate_next_rounded,
            //     color: Appcolor.blackcolor,
            //   ),
            // ),
          ],
        ),
      ),
    );

    // GestureDetector(
    //   onTap: () async {
    //     await _launchUrl(widget.article.url.toString());
    //   },
    //   child: Container(
    //     color: Colors.transparent,
    //     margin: widget.index == 0 ? const EdgeInsets.only(top: 10) : null,
    //     child: Column(
    //       children: [
    //         Row(children: [
    //           Container(
    //             height: 110,
    //             width: 110,
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(15),
    //               // color: Colors.black,
    //             ),
    //             child: ClipRRect(
    //               borderRadius: BorderRadius.circular(15),
    //               child: Image.network(
    //                 widget.article.urlToImage.toString(),
    //                 fit: BoxFit.cover,
    //                 loadingBuilder: (BuildContext context, Widget child,
    //                     ImageChunkEvent? loadingProgress) {
    //                   if (loadingProgress == null) {
    //                     return child;
    //                   }
    //                   return Center(
    //                     child: Platform.isIOS
    //                         ? CupertinoActivityIndicator(
    //                             color: Appcolor.greycolor,
    //                           )
    //                         : CircularProgressIndicator(
    //                             value: loadingProgress.expectedTotalBytes !=
    //                                     null
    //                                 ? loadingProgress.cumulativeBytesLoaded /
    //                                     loadingProgress.expectedTotalBytes!
    //                                 : null,
    //                           ),
    //                   );
    //                 },
    //                 errorBuilder: (context, error, stackTrace) {
    //                   return Container(
    //                     height: 110,
    //                     width: 110,
    //                     decoration: BoxDecoration(
    //                       border: Border.all(color: Appcolor.whitecolor),
    //                       borderRadius: BorderRadius.circular(15),
    //                       color: Appcolor.primaryColor,
    //                     ),
    //                     child: ClipRRect(
    //                       borderRadius: BorderRadius.circular(15),
    //                       child: Image.asset(
    //                         widget.article.source!.name == "YouTube"
    //                             ? 'assets/image/youtube.png'
    //                             : 'assets/image/nodatafound.png',
    //                         fit: BoxFit.contain,
    //                       ),
    //                     ),
    //                   );
    //                 },
    //               ),
    //             ),
    //           ),
    //           const SizedBox(
    //             width: 15,
    //           ),
    //           SizedBox(
    //             height: 110,
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //               children: [
    //                 Text(
    //                   "MLS",
    //                   style:
    //                       TextStyle(fontSize: 13, color: Colors.grey.shade400),
    //                 ),
    //                 SizedBox(
    //                   width: MediaQuery.of(context).size.width - 165,
    //                   child: Text(
    //                     widget.article.title.toString(),
    //                     maxLines: 2,
    //                     overflow: TextOverflow.ellipsis,
    //                     style: const TextStyle(
    //                         fontFamily: 'semibold', color: Colors.white),
    //                   ),
    //                 ),
    //                 Text(
    //                   dateFormat.format(widget.article.publishedAt!),
    //                   style:
    //                       TextStyle(fontSize: 13, color: Colors.grey.shade400),
    //                 ),
    //               ],
    //             ),
    //           )
    //         ]),
    //         const Divider(),
    //       ],
    //     ),
    //   ),
    // );
  }
}
