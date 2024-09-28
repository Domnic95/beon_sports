// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import '../models/MatchesResponse.dart';
import '../providers/providers.dart';
import '../widgets/Colors.dart';
import '../widgets/FixtureCard.dart';
import '../widgets/LoadingWidget.dart';

class FixtureScreen extends ConsumerStatefulWidget {
  final String field;
  const FixtureScreen({super.key, required this.field});

  @override
  ConsumerState<FixtureScreen> createState() => _FixtureScreenState();
}

class _FixtureScreenState extends ConsumerState<FixtureScreen> {
  bool isLoading = false;
  List<List<MatchesResponseModel>> soccerFixturesList = [];
  DateFormat dateFormat = DateFormat('EEEE d MMMM');
  List<DateTime> dates = [];

  fetchData() async {
    setState(() {
      isLoading = true;
    });
    await ref.read(fixtureProvider).getScore(tabelName: widget.field);
    for (var i = 0; i < ref.read(fixtureProvider).scoreList.length; i++) {
      if (ref.read(fixtureProvider).scoreList[i].completed == "False") {
        String d = ref
            .read(fixtureProvider)
            .scoreList[i]
            .commenceTime
            .toString()
            .substring(0, 10);
        int index = dates.indexOf(DateTime.parse(d));
        if (index != -1) {
          soccerFixturesList[index].add(ref.read(fixtureProvider).scoreList[i]);
        } else {
          dates.add(DateTime.parse(d));
          soccerFixturesList.add([ref.read(fixtureProvider).scoreList[i]]);
        }
      }
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
    return Expanded(
      child: Column(
        children: [
          isLoading
              ? Expanded(child: LoadingWidget())
              : Expanded(
                  child: soccerFixturesList.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
                      : ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 10,
                            );
                          },
                          padding: EdgeInsets.zero,
                          itemCount: soccerFixturesList.length,
                          itemBuilder: (context, index) {
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: soccerFixturesList[index].length + 1,
                              itemBuilder: (context, subIndex) {
                                if (subIndex == 0) {
                                  return Container(
                                    padding: EdgeInsets.all(8),
                                    decoration:
                                        BoxDecoration(color: Appcolor.betNavy),
                                    child: Center(
                                      child: Text(
                                          DateFormat('EEEE, MMM d, yyyy')
                                              .format(dates[index]),
                                          style: TextStyle(
                                              color: Appcolor.whitecolor,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12)),
                                    ),
                                  );
                                }
                                return FixtureCard(
                                  data: soccerFixturesList[index][subIndex - 1],
                                );
                              },
                            );
                          },
                        ),
                ),
        ],
      ),
    );
  }
}
