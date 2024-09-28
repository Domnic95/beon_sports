
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../models/MatchesResponse.dart';
import 'Colors.dart';

class FixtureCard extends StatefulWidget {
  final MatchesResponseModel data;
  FixtureCard({super.key, required this.data});

  @override
  State<FixtureCard> createState() => _FixtureCardState();
}

class _FixtureCardState extends State<FixtureCard> {
  final DateFormat dateFormat = DateFormat('EEEE d MMMM');
  bool islike = false;
  @override
  Widget build(BuildContext context) {
    int timelength = widget.data.commenceTime
            .toString()
            .split(' ')
            .last
            .split(":")
            .first
            .characters
            .length +
        widget.data.commenceTime
            .toString()
            .split(' ')
            .last
            .split(":")[1]
            .characters
            .length;
    return
        // Container(
        //   height: MediaQuery.of(context).size.height * 0.54,
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Column(
        //         children: [
        //           Container(
        //             height: 120,
        //             width: 120,
        //             decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(10),
        //                 image: DecorationImage(
        //                     fit: BoxFit.cover,
        //                     image: NetworkImage(
        //                       'http://games.ioio.ca${widget.data.homeTeamLogo}',
        //                     ))),
        //           ),
        //           SizedBox(
        //             height: 10,
        //           ),
        //           Text(
        //             widget.data.homeTeam.toString(),
        //             maxLines: 1,
        //             textAlign: TextAlign.center,
        //             style: const TextStyle(
        //                 color: Colors.white,
        //                 fontWeight: FontWeight.bold,
        //                 fontSize: 13),
        //           ),
        //         ],
        //       ),
        //       SizedBox(
        //         // width: MediaQuery.of(context).size.width * 0.28,
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Card(
        //               elevation: 0,
        //               margin: EdgeInsets.zero,
        //               shape: const BeveledRectangleBorder(
        //                 borderRadius: BorderRadius.only(
        //                   topLeft: Radius.circular(100),
        //                   bottomLeft: Radius.circular(100),
        //                 ),
        //               ),
        //               color: Appcolor.whitecolor,
        //               child: const SizedBox(
        //                 // color: Appcolor.blackcolor,
        //                 height: 4,
        //                 width: 50,
        //               ),
        //             ),
        //             CircleAvatar(
        //               radius: 25,
        //               backgroundColor: Appcolor.whitecolor,
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   Text(
        //                     "VS",
        //                     style: TextStyle(
        //                         fontSize: 18,
        //                         fontWeight: FontWeight.bold,
        //                         color: Appcolor.blackcolor,
        //                         fontFamily: GoogleFonts.pressStart2p().fontFamily),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //             Card(
        //               elevation: 0,
        //               margin: EdgeInsets.zero,
        //               shape: const BeveledRectangleBorder(
        //                 borderRadius: BorderRadius.only(
        //                   topRight: Radius.circular(100),
        //                   bottomRight: Radius.circular(100),
        //                 ),
        //               ),
        //               color: Appcolor.whitecolor,
        //               child: const SizedBox(
        //                 // color: Appcolor.blackcolor,
        //                 height: 4,
        //                 width: 50,
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //       Column(
        //         children: [
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               // SizedBox(
        //               //   width: 38,
        //               // ),
        //               Container(
        //                 height: 120,
        //                 width: 120,
        //                 decoration: BoxDecoration(
        //                     borderRadius: BorderRadius.circular(10),
        //                     image: DecorationImage(
        //                         fit: BoxFit.cover,
        //                         image: NetworkImage(
        //                           'http://games.ioio.ca${widget.data.awayTeamLogo}',
        //                         ))),
        //               ),
        //               Column(
        //                 children: [
        //                   /* GestureDetector(
        //                     onTap: () {
        //                       setState(() {
        //                         islike = !islike;
        //                       });
        //                     },
        //                     child: Icon(
        //                       islike ? Icons.favorite : Icons.favorite_border,
        //                       color: islike ? Colors.red : Appcolor.whitecolor,
        //                     ),
        //                   ),*/
        //                   SizedBox(
        //                     height: 5,
        //                   ),
        //                   /*Text(
        //                     "Like",
        //                     style: TextStyle(
        //                       fontSize: 14,
        //                       fontWeight: FontWeight.bold,
        //                       color: Appcolor.whitecolor,
        //                     ),
        //                   ),*/
        //                   SizedBox(
        //                     height: 10,
        //                   ),
        //                   /*Icon(
        //                     Icons.share,
        //                     color: Appcolor.whitecolor,
        //                   ),*/
        //                   SizedBox(
        //                     height: 5,
        //                   ),
        //                   /*Text(
        //                     "Share",
        //                     style: TextStyle(
        //                       fontSize: 14,
        //                       fontWeight: FontWeight.bold,
        //                       color: Appcolor.whitecolor,
        //                     ),
        //                   ),*/
        //                 ],
        //               ),
        //             ],
        //           ),
        //           SizedBox(
        //             height: 10,
        //           ),
        //           Text(
        //             widget.data.awayTeam.toString(),
        //             maxLines: 1,
        //             textAlign: TextAlign.center,
        //             style: const TextStyle(
        //                 color: Colors.white,
        //                 fontWeight: FontWeight.bold,
        //                 fontSize: 13),
        //           ),
        //         ],
        //       ),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Card(
        //             margin: EdgeInsets.only(right: 0.25),
        //             color: Appcolor.whitecolor,
        //             elevation: 2,
        //             // shape: RoundedRectangleBorder(
        //             //   borderRadius: BorderRadius.only(
        //             //     topLeft: Radius.circular(8),
        //             //     bottomLeft: Radius.circular(8),
        //             //   ),
        //             // ),
        //             child: Padding(
        //               padding: const EdgeInsets.symmetric(
        //                   vertical: 5.0, horizontal: 10),
        //               child: Text(
        //                 DateFormat.Hm()
        //                     .format(widget.data.commenceTime!)
        //                     .toString(),
        //                 style: const TextStyle(
        //                     fontSize: 16,
        //                     color: Appcolor.blackcolor,
        //                     fontWeight: FontWeight.w900),
        //               ),
        //             ),
        //           ),
        //           Card(
        //             margin: EdgeInsets.only(left: 0.25),
        //             color: Appcolor.whitecolor,
        //             elevation: 2,
        //             // shape: RoundedRectangleBorder(
        //             //   borderRadius: BorderRadius.only(
        //             //     topRight: Radius.circular(8),
        //             //     bottomRight: Radius.circular(8),
        //             //   ),
        //             // ),
        //             child: Padding(
        //               padding:
        //                   const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
        //               child: Text(
        //                 DateFormat('dd MMM')
        //                     .format(widget.data.commenceTime!)
        //                     .toString(),
        //                 style: TextStyle(
        //                     fontSize: 16,
        //                     color: Appcolor.blackcolor,
        //                     fontWeight: FontWeight.normal),
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // );

        Card(
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 2,
      shadowColor: Appcolor.greycolor,
      color: Appcolor.whitecolor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: const [
            //       Text(
            //         "Upcoming Match",
            //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            //       ),
            //       // Icon(Icons.more_horiz),
            //     ],
            //   ),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: CachedNetworkImage(
                    height: 60,
                    width: 60,
                    imageUrl: "http://games.ioio.ca${widget.data.homeTeamLogo}",
                    // placeholder: (context, url) =>
                    //     CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.groups_outlined, size: 50),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Column(
                    children: [
                      Text(
                        widget.data.homeTeam.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Column(
                    children: [
                      Container(
                        width: 18,
                        height: 18,
                        decoration: const BoxDecoration(
                            color: Appcolor.betNavy, shape: BoxShape.circle),
                        child: Center(
                          child: Text(
                            "Vs.",
                            style: TextStyle(
                                color: Appcolor.whitecolor,
                                fontSize: 9,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      // Text(
                      //   DateFormat.Hm()
                      //       .format(widget.data.commenceTime!)
                      //       .toString(),
                      //   style: const TextStyle(
                      //       fontSize: 16,
                      //       color: Appcolor.secondarycolor,
                      //       fontWeight: FontWeight.w900),
                      // ),

                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "${DateFormat('h:mm a').format(widget.data.commenceTime!).toString().toLowerCase()} ET",
                        style: const TextStyle(
                            fontSize: 10,
                            color: Appcolor.blackcolor,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  child: CachedNetworkImage(
                    height: 60,
                    width: 60,
                    imageUrl: "http://games.ioio.ca${widget.data.awayTeamLogo}",
                    // placeholder: (context, url) =>
                    //     CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.groups_outlined, size: 50),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Column(
                    children: [
                      Text(
                        widget.data.awayTeam.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
    // return Card(
    //   margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(20),
    //   ),
    //   elevation: 2,
    //   color: Appcolor.whitecolor,
    //   child: Column(
    //     children: [
    //       Padding(
    //         padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: const [
    //             Text(
    //               "Upcoming Match",
    //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    //             ),
    //             // Icon(Icons.more_horiz),
    //           ],
    //         ),
    //       ),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           SizedBox(
    //             width: MediaQuery.of(context).size.width * 0.25,
    //             child: Column(
    //               children: [
    //                 CachedNetworkImage(
    //                   height: 70,
    //                   width: 70,
    //                   imageUrl: "http://games.ioio.ca${data.homeTeamLogo}",
    //                   // placeholder: (context, url) =>
    //                   //     CircularProgressIndicator(),
    //                   errorWidget: (context, url, error) =>
    //                       Icon(Icons.groups_outlined, size: 50),
    //                 ),
    //                 // Image.network(
    //                 //   'http://games.ioio.ca${data.homeTeamLogo}',
    //                 //   height: 80,
    //                 //   width: 80,
    //                 // ),
    //                 Text(
    //                   data.homeTeam.toString(),
    //                   maxLines: 1,
    //                   textAlign: TextAlign.center,
    //                   style: const TextStyle(
    //                       fontWeight: FontWeight.bold, fontSize: 13),
    //                 )
    //               ],
    //             ),
    //           ),
    //           SizedBox(
    //             // width: MediaQuery.of(context).size.width * 0.28,
    //             child: Row(
    //               children: [
    //                 Card(
    //                   elevation: 0,
    //                   margin: EdgeInsets.zero,
    //                   shape: const BeveledRectangleBorder(
    //                     borderRadius: BorderRadius.only(
    //                       topLeft: Radius.circular(100),
    //                       bottomLeft: Radius.circular(100),
    //                     ),
    //                   ),
    //                   color: Appcolor.blackcolor,
    //                   child: const SizedBox(
    //                     // color: Appcolor.blackcolor,
    //                     height: 4,
    //                     width: 30,
    //                   ),
    //                 ),
    //                 CircleAvatar(
    //                   backgroundColor: Appcolor.blackcolor,
    //                   child: Text(
    //                     "VS",
    //                     style: TextStyle(
    //                         fontSize: 13,
    //                         fontWeight: FontWeight.bold,
    //                         color: Appcolor.whitecolor,
    //                         fontFamily: GoogleFonts.pressStart2p().fontFamily),
    //                   ),
    //                 ),
    //                 Card(
    //                   elevation: 0,
    //                   margin: EdgeInsets.zero,
    //                   shape: const BeveledRectangleBorder(
    //                     borderRadius: BorderRadius.only(
    //                       topRight: Radius.circular(100),
    //                       bottomRight: Radius.circular(100),
    //                     ),
    //                   ),
    //                   color: Appcolor.blackcolor,
    //                   child: const SizedBox(
    //                     // color: Appcolor.blackcolor,
    //                     height: 4,
    //                     width: 30,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           SizedBox(
    //             width: MediaQuery.of(context).size.width * 0.25,
    //             child: Column(
    //               children: [
    //                 CachedNetworkImage(
    //                   height: 80,
    //                   width: 80,
    //                   imageUrl: "http://games.ioio.ca${data.awayTeamLogo}",
    //                   // placeholder: (context, url) =>
    //                   //     CircularProgressIndicator(),
    //                   errorWidget: (context, url, error) =>
    //                       Icon(Icons.groups_outlined, size: 50),
    //                 ),
    //                 // Image.network(
    //                 //   'http://games.ioio.ca${data.awayTeamLogo}',
    //                 //   height: 80,
    //                 //   width: 80,
    //                 // ),
    //                 Text(
    //                   data.awayTeam.toString(),
    //                   maxLines: 1,
    //                   textAlign: TextAlign.center,
    //                   style: const TextStyle(
    //                       fontWeight: FontWeight.bold, fontSize: 13),
    //                 )
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //       const SizedBox(
    //         height: 10,
    //       ),
    //     ],
    //   ),
    // );
    // Container(
    //   margin: const EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 5.0),
    //   decoration: BoxDecoration(
    //       border: Border.all(width: 1, color: const Color(0xff505050)),
    //       borderRadius: BorderRadius.circular(15)),
    //   child: Card(
    //     color: const Color(0xff505050),
    //     margin: EdgeInsets.zero,
    //     elevation: 0,
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    //     child: SizedBox(
    //       height: 100,
    //       width: MediaQuery.of(context).size.width,
    //       child: Row(
    //         children: [
    //           Container(
    //             width: MediaQuery.of(context).size.width * 0.6,
    //             padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 8.0),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.start,
    //                   children: [
    //                     CircleAvatar(
    //                         radius: 18,
    //                         backgroundImage: NetworkImage(
    //                             'http://games.ioio.ca${data.homeTeamLogo}')),
    //                     const SizedBox(
    //                       width: 5,
    //                     ),
    //                     SizedBox(
    //                       width: MediaQuery.of(context).size.width * 0.45,
    //                       child: Text(
    //                         data.homeTeam!,
    //                         textAlign: TextAlign.start,
    //                         maxLines: 1,
    //                         overflow: TextOverflow.ellipsis,
    //                         style: const TextStyle(
    //                             fontSize: 14,
    //                             color: Colors.white,
    //                             fontFamily: 'semibold'),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 Row(
    //                   children: [
    //                     CircleAvatar(
    //                         radius: 18,
    //                         backgroundImage: NetworkImage(
    //                             'http://games.ioio.ca${data.awayTeamLogo}')),
    //                     const SizedBox(
    //                       width: 5,
    //                     ),
    //                     SizedBox(
    //                       width: MediaQuery.of(context).size.width * 0.45,
    //                       child: Text(
    //                         data.awayTeam!,
    //                         textAlign: TextAlign.start,
    //                         maxLines: 1,
    //                         overflow: TextOverflow.ellipsis,
    //                         style: const TextStyle(
    //                             fontSize: 14,
    //                             color: Colors.white,
    //                             fontFamily: 'semibold'),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ),
    //           Container(
    //             width: MediaQuery.of(context).size.width * 0.35,
    //             padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
    //             child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                 children: [
    //                   Container(
    //                     padding: const EdgeInsets.symmetric(
    //                         horizontal: 10, vertical: 3),
    //                     decoration: BoxDecoration(
    //                         border: Border.all(width: 1, color: Colors.white),
    //                         borderRadius: BorderRadius.circular(20)),
    //                     child: Text(
    //                       "${data.commenceTime.toString().split(' ').last.split(":").first}:${data.commenceTime.toString().split(' ').last.split(":")[1]}${timelength == 4 ? '' : ":00"}",
    //                       //2023-04-13T01:51:54Z
    //                       // "${data.commenceTime.toString().split(" ").last.split(":00").first}${timelength == 5 ? '' : ":00"}",
    //                       style: const TextStyle(
    //                         fontSize: 15,
    //                         color: Colors.white,
    //                       ),
    //                     ),
    //                   ),
    //                   Text(
    //                     dateFormat.format(data.commenceTime!),
    //                     maxLines: 1,
    //                     overflow: TextOverflow.ellipsis,
    //                     style: const TextStyle(
    //                       fontSize: 12,
    //                       color: Colors.white,
    //                     ),
    //                   ),
    //                 ]),
    //           ),
    //         ],
    //       ),
    //       // child:
    //       //  Row(
    //       //   mainAxisAlignment: MainAxisAlignment.spaceAround,
    //       //   children: [
    //       //     SizedBox(
    //       //       width: MediaQuery.of(context).size.width * 0.3,
    //       //       child: Column(
    //       //         mainAxisSize: MainAxisSize.min,
    //       //         children: [
    //       //           CircleAvatar(
    //       //             backgroundColor: Colors.white,
    //       //             radius: 25,
    //       //             backgroundImage: NetworkImage(
    //       //                 'http://games.ioio.ca${data.homeTeamLogo}'),
    //       //           ),
    //       //           Padding(
    //       //             padding: const EdgeInsets.only(top: 5),
    //       //             child: Text(
    //       //               data.homeTeam!,
    //       //               textAlign: TextAlign.center,
    //       //               maxLines: 1,
    //       //               style: TextStyle(
    //       //                   fontSize: 13,
    //       //                   color: Colors.grey.shade700,
    //       //                   fontFamily: 'semibold'),
    //       //             ),
    //       //           ),
    //       //         ],
    //       //       ),
    //       //     ),
    //       //     Container(
    //       //       padding:
    //       //           const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
    //       //       decoration: BoxDecoration(
    //       //           border: Border.all(width: 1, color: Colors.grey.shade200),
    //       //           borderRadius: BorderRadius.circular(5)),
    //       //       child: Text(
    //       //         "${data.commenceTime.toString().split(" ").last.split(":00").first}${timelength == 5 ? '' : ":00"}",
    //       //         style: const TextStyle(
    //       //           fontSize: 15,
    //       //           color: Colors.grey,
    //       //         ),
    //       //       ),
    //       //     ),
    //       //     SizedBox(
    //       //       width: MediaQuery.of(context).size.width * 0.3,
    //       //       child: Column(
    //       //         mainAxisSize: MainAxisSize.min,
    //       //         children: [
    //       //           CircleAvatar(
    //       //             backgroundColor: Colors.white,
    //       //             radius: 25,
    //       //             backgroundImage: NetworkImage(
    //       //                 'http://games.ioio.ca/${data.awayTeamLogo}'),
    //       //           ),
    //       //           Padding(
    //       //             padding: const EdgeInsets.only(top: 5),
    //       //             child: Text(
    //       //               data.awayTeam!,
    //       //               textAlign: TextAlign.center,
    //       //               maxLines: 1,
    //       //               style: TextStyle(
    //       //                   fontSize: 13,
    //       //                   color: Colors.grey.shade700,
    //       //                   fontFamily: 'semibold'),
    //       //             ),
    //       //           ),
    //       //         ],
    //       //       ),
    //       //     ),
    //       //   ],
    //       // ),
    //     ),
    //   ),
    // );
  }
}
