
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../models/MatchesResponse.dart';
import 'Colors.dart';

class ResultsCard extends StatefulWidget {
  final MatchesResponseModel data;

  const ResultsCard({super.key, required this.data});

  @override
  State<ResultsCard> createState() => _ResultsCardState();
}

class _ResultsCardState extends State<ResultsCard> {
  bool islike = false;

  final DateFormat dateFormat = DateFormat('EEEE d MMMM');

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return
        // SizedBox(
        //   height: MediaQuery.of(context).size.height * 0.64,
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
        //           const SizedBox(
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
        //                   /*  GestureDetector(
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
        //                   /* Text(
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
        //                   /* Icon(
        //                     Icons.share,
        //                     color: Appcolor.whitecolor,
        //                   ),*/
        //                   SizedBox(
        //                     height: 5,
        //                   ),
        //                   /* Text(
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
        //           SizedBox(
        //             height: 70,
        //             child: Stack(
        //               alignment: Alignment.bottomCenter,
        //               children: [
        //                 Card(
        //                   margin: EdgeInsets.only(right: 0.25),
        //                   color: Appcolor.whitecolor,
        //                   elevation: 2,
        //                   // shape: RoundedRectangleBorder(
        //                   //   borderRadius: BorderRadius.only(
        //                   //     topLeft: Radius.circular(8),
        //                   //     bottomLeft: Radius.circular(8),
        //                   //   ),
        //                   // ),
        //                   child: Padding(
        //                     padding: const EdgeInsets.symmetric(
        //                         vertical: 5.0, horizontal: 10),
        //                     child: Row(
        //                       children: [
        //                         CircleAvatar(
        //                           radius: 15,
        //                           backgroundImage: NetworkImage(
        //                               "http://games.ioio.ca${widget.data.homeTeamLogo}"),
        //                         ),
        //                         SizedBox(
        //                           width: 5,
        //                         ),
        //                         Text(
        //                           widget.data.homeTeamScore.toString(),
        //                           style: TextStyle(
        //                               fontWeight: FontWeight.bold,
        //                               color: Appcolor.blackcolor,
        //                               letterSpacing: 1),
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                 ),
        //                 int.parse(widget.data.homeTeamScore.toString()) >
        //                         int.parse(widget.data.awayTeamScore.toString())
        //                     ? Positioned(
        //                         top: -20,
        //                         child: SizedBox(
        //                             height: 70,
        //                             width: 80,
        //                             child: Image.asset(
        //                               'assets/image/crown.png',
        //                             )))
        //                     : SizedBox(),
        //               ],
        //             ),
        //           ),
        //           SizedBox(
        //             height: 70,
        //             child: Stack(
        //               alignment: Alignment.bottomCenter,
        //               children: [
        //                 Card(
        //                   margin: EdgeInsets.only(left: 0.25),
        //                   color: Appcolor.whitecolor,
        //                   elevation: 2,
        //                   // shape: RoundedRectangleBorder(
        //                   //   borderRadius: BorderRadius.only(
        //                   //     topRight: Radius.circular(8),
        //                   //     bottomRight: Radius.circular(8),
        //                   //   ),
        //                   // ),
        //                   child: Padding(
        //                     padding: const EdgeInsets.symmetric(
        //                         vertical: 5.0, horizontal: 10),
        //                     child: Row(
        //                       children: [
        //                         CircleAvatar(
        //                           radius: 15,
        //                           backgroundImage: NetworkImage(
        //                               "http://games.ioio.ca${widget.data.awayTeamLogo}"),
        //                         ),
        //                         SizedBox(
        //                           width: 5,
        //                         ),
        //                         Text(
        //                           widget.data.awayTeamScore.toString(),
        //                           style: TextStyle(
        //                               fontWeight: FontWeight.bold,
        //                               color: Appcolor.blackcolor,
        //                               letterSpacing: 1),
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                 ),
        //                 int.parse(widget.data.homeTeamScore.toString()) <
        //                         int.parse(widget.data.awayTeamScore.toString())
        //                     ? Positioned(
        //                         top: -20,
        //                         child: SizedBox(
        //                             height: 70,
        //                             width: 80,
        //                             child: Image.asset(
        //                               'assets/image/crown.png',
        //                             )))
        //                     : SizedBox(),
        //               ],
        //             ),
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // );

        Card(
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 2,
      color: Appcolor.whitecolor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat('EEEE, MMM d, yyyy')
                      .format(widget.data.commenceTime!)
                      .toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Appcolor.blackcolor),
                ),
                Text(
                  "${DateFormat('h:mm a').format(widget.data.commenceTime!).toString().toLowerCase()} ET",
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Appcolor.blackcolor),
                ),
                // Icon(Icons.more_horiz),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
              thickness: 1,
              color: Appcolor.betSoftGrey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 70,
                  child: Column(
                    children: [
                      Image.network(
                        'http://games.ioio.ca${widget.data.homeTeamLogo}',
                        height: 60,
                        width: 60,
                      ),
                      Text(
                        widget.data.homeTeam.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Appcolor.blackcolor,
                            fontWeight: FontWeight.w700,
                            fontSize: 12),
                      )
                    ],
                  ),
                ),
                // SizedBox(
                //   width: MediaQuery.of(context).size.width * 0.5 - 56,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       // Card(
                //       //   elevation: 0,
                //       //   margin: EdgeInsets.zero,
                //       //   shape: const BeveledRectangleBorder(
                //       //     borderRadius: BorderRadius.only(
                //       //       topLeft: Radius.circular(100),
                //       //       bottomLeft: Radius.circular(100),
                //       //     ),
                //       //   ),
                //       //   color: Appcolor.blackcolor,
                //       //   child: const SizedBox(
                //       //     // color: Appcolor.blackcolor,
                //       //     height: 4,
                //       //     width: 30,
                //       //   ),
                //       // ),
                //       // CircleAvatar(
                //       //   backgroundColor: Appcolor.blackcolor,
                //       //   child: Text(
                //       //     "VS",
                //       //     style: TextStyle(
                //       //         fontSize: 13,
                //       //         fontWeight: FontWeight.bold,
                //       //         color: Appcolor.whitecolor,
                //       //         fontFamily: GoogleFonts.pressStart2p().fontFamily),
                //       //   ),
                //       // ),
                //       // Card(
                //       //   elevation: 0,
                //       //   margin: EdgeInsets.zero,
                //       //   shape: const BeveledRectangleBorder(
                //       //     borderRadius: BorderRadius.only(
                //       //       topRight: Radius.circular(100),
                //       //       bottomRight: Radius.circular(100),
                //       //     ),
                //       //   ),
                //       //   color: Appcolor.blackcolor,
                //       //   child: const SizedBox(
                //       //     // color: Appcolor.blackcolor,
                //       //     height: 4,
                //       //     width: 30,
                //       //   ),
                //       // ),
                //     ],
                //   ),
                // ),
                Text(
                  widget.data.homeTeamScore.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Appcolor.blackcolor,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 40,
                      letterSpacing: 1),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: size.height * 0.1,
                        child: const VerticalDivider(
                          thickness: 1,
                          color: Appcolor.betRama,
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Appcolor.betRama,
                        ),
                        child: Center(
                          child: Text(
                            "Vs.",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: Appcolor.whitecolor),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  widget.data.awayTeamScore.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      overflow: TextOverflow.ellipsis,
                      color: Appcolor.blackcolor,
                      fontSize: 40,
                      letterSpacing: 1),
                ),

                SizedBox(
                  width: 70,
                  child: Column(
                    children: [
                      Image.network(
                        'http://games.ioio.ca${widget.data.awayTeamLogo}',
                        height: 60,
                        width: 60,
                      ),
                      Text(
                        widget.data.awayTeam.toString(),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Appcolor.blackcolor,
                            fontWeight: FontWeight.w700,
                            fontSize: 12),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(
          //   height: 15,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Card(
          //       margin: EdgeInsets.only(right: 0.25),
          //       color: Appcolor.primaryColor,
          //       elevation: 2,
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.only(
          //           topLeft: Radius.circular(8),
          //           bottomLeft: Radius.circular(8),
          //         ),
          //       ),
          //       child: Padding(
          //         padding:
          //             const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
          //         child: Text(
          //           widget.data.homeTeamScore.toString(),
          //           style: TextStyle(
          //               fontWeight: FontWeight.bold,
          //               color: Appcolor.whitecolor,
          //               letterSpacing: 1),
          //         ),
          //       ),
          //     ),
          //     Card(
          //       margin: EdgeInsets.only(left: 0.25),
          //       color: Appcolor.primaryColor,
          //       elevation: 2,
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.only(
          //           topRight: Radius.circular(8),
          //           bottomRight: Radius.circular(8),
          //         ),
          //       ),
          //       child: Padding(
          //         padding:
          //             const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
          //         child: Text(
          //           widget.data.awayTeamScore.toString(),
          //           style: TextStyle(
          //               fontWeight: FontWeight.bold,
          //               color: Appcolor.whitecolor,
          //               letterSpacing: 1),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),

          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );

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
    //             width: MediaQuery.of(context).size.width * 0.31,
    //             padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
    //             child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                 children: [
    //                   Container(
    //                       padding: const EdgeInsets.symmetric(
    //                           horizontal: 8, vertical: 5),
    //                       decoration: const BoxDecoration(
    //                         color: Appcolor.secondarycolor,
    //                       ),
    //                       child: Row(
    //                         mainAxisSize: MainAxisSize.min,
    //                         children: [
    //                           Text(
    //                             data.homeTeamScore ?? "0",
    //                             style: const TextStyle(
    //                               fontSize: 13,
    //                               fontWeight: FontWeight.bold,
    //                               color: Colors.white,
    //                             ),
    //                           ),
    //                           const SizedBox(
    //                             width: 10,
    //                           ),
    //                           Container(
    //                             height: 15,
    //                             width: 0.5,
    //                             color: Colors.white,
    //                           ),
    //                           const SizedBox(
    //                             width: 10,
    //                           ),
    //                           Text(
    //                             data.awayTeamScore ?? "0",
    //                             style: const TextStyle(
    //                               fontSize: 13,
    //                               fontWeight: FontWeight.bold,
    //                               color: Colors.white,
    //                             ),
    //                           ),
    //                         ],
    //                       )),
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
    //       //        Container(
    //       //   margin: const EdgeInsets.all(5),
    //       //   decoration: BoxDecoration(
    //       //       border: Border.all(width: 1, color: const Color(0xffEEEDED)),
    //       //       borderRadius: BorderRadius.circular(15)),
    //       //   child: Card(
    //       //     margin: EdgeInsets.zero,
    //       //     elevation: 0,
    //       //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    //       //     child: SizedBox(
    //       //       height: 100,
    //       //       width: MediaQuery.of(context).size.width,
    //       //       child: Row(
    //       //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //       //         children: [
    //       //           SizedBox(
    //       //             width: MediaQuery.of(context).size.width * 0.3,
    //       //             child: Column(
    //       //               mainAxisSize: MainAxisSize.min,
    //       //               children: [
    //       //                 CircleAvatar(
    //       //                   backgroundColor: Colors.white,
    //       //                   radius: 25,
    //       //                   backgroundImage: NetworkImage(
    //       //                       'http://games.ioio.ca/${data.homeTeamLogo}'),
    //       //                 ),
    //       //                 Padding(
    //       //                   padding: const EdgeInsets.only(top: 5),
    //       //                   child: Text(
    //       //                     data.homeTeam!,
    //       //                     textAlign: TextAlign.center,
    //       //                     maxLines: 1,
    //       //                     style: TextStyle(
    //       //                         fontSize: 13,
    //       //                         color: Colors.grey.shade700,
    //       //                         fontFamily: 'semibold'),
    //       //                   ),
    //       //                 ),
    //       //               ],
    //       //             ),
    //       //           ),
    //       //           Container(
    //       //               padding:
    //       //                   const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
    //       //               decoration: const BoxDecoration(
    //       //                 color: Colors.black,
    //       //               ),
    //       //               child: Row(
    //       //                 children: [
    //       //                   Text(
    //       //                     data.homeTeamScore ?? "0",
    //       //                     style: const TextStyle(
    //       //                       fontSize: 15,
    //       //                       fontWeight: FontWeight.bold,
    //       //                       color: Colors.white,
    //       //                     ),
    //       //                   ),
    //       //                   const SizedBox(
    //       //                     width: 10,
    //       //                   ),
    //       //                   Container(
    //       //                     height: 15,
    //       //                     width: 0.5,
    //       //                     color: Colors.white,
    //       //                   ),
    //       //                   const SizedBox(
    //       //                     width: 10,
    //       //                   ),
    //       //                   Text(
    //       //                     data.awayTeamScore ?? "0",
    //       //                     style: const TextStyle(
    //       //                       fontSize: 15,
    //       //                       fontWeight: FontWeight.bold,
    //       //                       color: Colors.white,
    //       //                     ),
    //       //                   ),
    //       //                 ],
    //       //               )),
    //       //           SizedBox(
    //       //             width: MediaQuery.of(context).size.width * 0.3,
    //       //             child: Column(
    //       //               mainAxisSize: MainAxisSize.min,
    //       //               children: [
    //       //                 CircleAvatar(
    //       //                   backgroundColor: Colors.white,
    //       //                   radius: 25,
    //       //                   backgroundImage: NetworkImage(
    //       //                       'http://games.ioio.ca/${data.awayTeamLogo}'),
    //       //                 ),
    //       //                 Padding(
    //       //                   padding: const EdgeInsets.only(top: 5),
    //       //                   child: Text(
    //       //                     data.awayTeam!,
    //       //                     textAlign: TextAlign.center,
    //       //                     maxLines: 1,
    //       //                     style: TextStyle(
    //       //                         fontSize: 13,
    //       //                         color: Colors.grey.shade700,
    //       //                         fontFamily: 'semibold'),
    //       //                   ),
    //       //                 ),
    //       //               ],
    //       //             ),
    //       //           ),
    //       //         ],
    //       //       ),
    //       //     ),
    //       //   ),
    //       // );
    //     ),
    //   ),
    // );
  }
}
