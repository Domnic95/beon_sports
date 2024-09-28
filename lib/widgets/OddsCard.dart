// ignore_for_file: file_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../models/OddsModel.dart';
import 'Colors.dart';

class OddsCard extends StatefulWidget {
  final ScroreModel data;
  final Bookmaker bookmaker;

  const OddsCard({super.key, required this.data, required this.bookmaker});

  @override
  State<OddsCard> createState() => _OddsCardState();
}

class _OddsCardState extends State<OddsCard> {
  final DateFormat dateFormat = DateFormat('EEEE, d MMMM');
  int spreadsindex = 0;
  int totalindex = 0;
  int h2hsindex = 0;

  @override
  void initState() {
    spreadsindex = widget.bookmaker.markets!
        .indexWhere((element) => element.key == "spreads");
    totalindex = widget.bookmaker.markets!
        .indexWhere((element) => element.key == "totals");
    h2hsindex =
        widget.bookmaker.markets!.indexWhere((element) => element.key == "h2h");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 0, left: 10, right: 10),
      elevation: 0,
      color: Appcolor.transparentcolor,
      child: Card(
        color: Appcolor.betSoftGrey,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      widget.data.homeTeam.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Appcolor.blackcolor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Card(
                            margin: const EdgeInsets.all(2),
                            color: Appcolor.whitecolor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Container(
                              height: 40,
                              // width: 80,
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              child: Center(
                                child: Text(
                                  widget.bookmaker.markets!.any(
                                          (element) => element.key == "spreads")
                                      ? widget.bookmaker.markets![spreadsindex]
                                          .outcomes![0].point
                                          .toString()
                                      : "",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                      color: Appcolor.blackcolor
                                      // letterSpacing: 0.5,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            margin: const EdgeInsets.all(2),
                            color: Appcolor.whitecolor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: SizedBox(
                              height: 40,
                              // width: 80,

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.bookmaker.markets!.any((element) =>
                                            element.key == "totals")
                                        ? widget.bookmaker.markets![totalindex]
                                            .outcomes![0].point
                                            .toString()
                                        : "",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        color: Appcolor.blackcolor
                                        // letterSpacing: 0.5,
                                        ),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    widget.bookmaker.markets!.any((element) =>
                                            element.key == "totals")
                                        ? widget.bookmaker.markets![totalindex]
                                            .outcomes![0].price
                                            .toString()
                                        : "",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Appcolor.secondarycolor,
                                      fontSize: 12,
                                      // letterSpacing: 0.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            margin: const EdgeInsets.all(2),
                            color: Appcolor.whitecolor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Container(
                              height: 40,
                              // width: 80,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 13),
                              child: Center(
                                child: Text(
                                  widget.bookmaker.markets!.any(
                                          (element) => element.key == "h2h")
                                      ? widget.bookmaker.markets![h2hsindex]
                                          .outcomes![0].price
                                          .toString()
                                      : "".toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                      color: Appcolor.blackcolor
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Divider(
                      color: Appcolor.whitecolor,
                      height: 1,
                      thickness: 1,
                    ),
                  ),
                  const Expanded(flex: 2, child: SizedBox())
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      widget.data.awayTeam.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Appcolor.blackcolor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        // letterSpacing: 0.5
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Card(
                            margin: const EdgeInsets.all(2),
                            color: Appcolor.whitecolor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Container(
                              height: 40,
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              child: Center(
                                child: Text(
                                  widget.bookmaker.markets!.any(
                                          (element) => element.key == "spreads")
                                      ? widget.bookmaker.markets![spreadsindex]
                                          .outcomes![1].point
                                          .toString()
                                      : "".toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                      color: Appcolor.blackcolor
                                      // letterSpacing: 0.5,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            color: Appcolor.whitecolor,
                            margin: const EdgeInsets.all(2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: SizedBox(
                              height: 40,

                              // width: 80,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.bookmaker.markets!.any((element) =>
                                            element.key == "totals")
                                        ? widget.bookmaker.markets![totalindex]
                                            .outcomes![1].point
                                            .toString()
                                        : "".toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        color: Appcolor.blackcolor
                                        // letterSpacing: 0.5,
                                        ),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    widget.bookmaker.markets!.any((element) =>
                                            element.key == "totals")
                                        ? widget.bookmaker.markets![totalindex]
                                            .outcomes![1].price
                                            .toString()
                                        : "".toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        color: Appcolor.secondarycolor
                                        // letterSpacing: 0.5,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            color: Appcolor.whitecolor,
                            margin: const EdgeInsets.all(2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Container(
                              height: 40,
                              // width: 80,
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              child: Center(
                                child: Text(
                                  widget.bookmaker.markets!.any(
                                          (element) => element.key == "h2h")
                                      ? widget.bookmaker.markets![h2hsindex]
                                          .outcomes![1].price
                                          .toString()
                                      : "".toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                      color: Appcolor.blackcolor
                                      // letterSpacing: 0.5,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
