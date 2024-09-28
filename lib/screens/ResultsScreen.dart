// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../models/MatchesResponse.dart';
import '../providers/providers.dart';
import '../widgets/Colors.dart';
import '../widgets/LoadingWidget.dart';
import '../widgets/ResultsCard.dart';

class ResultScreen extends ConsumerStatefulWidget {
  final String field;
  final String title;
  const ResultScreen({super.key, required this.field, required this.title});

  @override
  ConsumerState<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends ConsumerState<ResultScreen> {
  bool isLoading = false;
  List<MatchesResponseModel> soccerResultsList = [];
  DateFormat dateFormat = DateFormat('EEEE d MMMM');

  fetchData() async {
    setState(() {
      isLoading = true;
    });
    await ref.read(fixtureProvider).getScore(tabelName: widget.field);
    for (var i = 0; i < ref.read(fixtureProvider).scoreList.length; i++) {
      ref.read(fixtureProvider).scoreList[i].completed == "True"
          ? soccerResultsList.add(ref.read(fixtureProvider).scoreList[i])
          : null;
      setState(() {});
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Column(
        children: [
          Container(
            width: size.width,
            decoration: BoxDecoration(color: Appcolor.betNavy),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.title,
                  style: TextStyle(
                      color: Appcolor.whitecolor,
                      fontWeight: FontWeight.w700,
                      fontSize: 10)),
            ),
          ),
          isLoading
              ?  Expanded(child: LoadingWidget())
              : Expanded(
                  child: soccerResultsList.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Lottie.asset(
                              //   "assets/image/nodata.json",
                              //   height: 140,
                              // ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "No games have been played today",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      // Image.asset('assets/image/nodatafound.png')
                      : ListView.separated(
                          separatorBuilder: (context, index) {
                            return SizedBox();
                          },
                          padding: EdgeInsets.zero,
                          itemCount: soccerResultsList.length,
                          itemBuilder: (context, index) {
                            return ResultsCard(
                              data: soccerResultsList[index],
                            );
                          },
                        ),
                ),
        ],
      ),
    );
  }
}
