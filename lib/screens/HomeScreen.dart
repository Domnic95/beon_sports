// ignore_for_file: file_names

import 'package:beon/widgets/home_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import '../models/MatchesResponse.dart';
import '../models/OddsModel.dart';
import '../models/StringModel.dart';
import '../providers/config.dart';
import '../providers/providers.dart';
import '../widgets/Banner.dart';
import '../widgets/Colors.dart';
import 'FixtureScreen.dart';
import 'NewsScreen.dart';
import 'OddsScree.dart';
import 'PrivacyPolicy.dart';
import 'ResultsScreen.dart';
import 'TermsOfUse.dart';
import 'contact_us_page.dart';

int _currentIndex = 0;
int _selectedIndex = 1;
String title = "Fixture";
bool isFirstTime = true;
ScrollController scrollController = ScrollController();

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();
  List<List<MatchesResponseModel>> soccerFixturesList = [];
  DateFormat dateFormat = DateFormat('EEEE d MMMM');
  List<DateTime> dates = [];
  List<MatchesResponseModel> soccerResultsList = [];
  List<List<ScroreModel>> soccerOddsList = [];
  List<List<Bookmaker>> bookmaker = [];

  bool fixtureBreakCode = true;
  bool resultsBreakCode = true;
  bool oddsBreakCode = true;

  fetchDataForFixture(String value) async {
    soccerFixturesList.clear();
    await ref.read(fixtureProvider).getScore(tabelName: value);
    for (var i = 0; i < ref.read(fixtureProvider).scoreList.length; i++) {
      if (ref.read(fixtureProvider).scoreList[i].completed == "False") {
         String d = ref.read(fixtureProvider).scoreList[i].commenceTime.toString().substring(0,10);
        int index =
            dates.indexOf(DateTime.parse(d));
        if (index != -1) {
          soccerFixturesList[index].add(ref.read(fixtureProvider).scoreList[i]);
        } else {
          dates.add(DateTime.parse(d));
          soccerFixturesList.add([ref.read(fixtureProvider).scoreList[i]]);
        }
      }
    }

    setState(() {});
  }

  fetchDataResults(String value) async {
    soccerResultsList.clear();
    await ref.read(fixtureProvider).getScore(tabelName: value);
    for (var i = 0; i < ref.read(fixtureProvider).scoreList.length; i++) {
      ref.read(fixtureProvider).scoreList[i].completed == "True"
          ? soccerResultsList.add(ref.read(fixtureProvider).scoreList[i])
          : null;
    }
    setState(() {});
  }

  fetchDataOdds(String value) async {
    bookmaker.clear();
    soccerOddsList.clear();

    await ref.read(oddsProvider).getScore(tabelName: value);
    for (var i = 0; i < ref.read(oddsProvider).scoreList.length; i++) {
      for (var j = 0;
          j < ref.read(oddsProvider).scoreList[i].bookmakers!.length;
          j++) {
        if (ref.read(oddsProvider).scoreList[i].bookmakers![j].key ==
            "betonlineag") {
              String d = ref.read(oddsProvider).scoreList[i].commenceTime.toString().substring(0,10);
          int index =
              dates.indexOf(DateTime.parse(d));

          if (index != -1) {
            bookmaker[index]
                .add(ref.read(oddsProvider).scoreList[i].bookmakers![j]);
            soccerOddsList[index].add(ref.read(oddsProvider).scoreList[i]);
          } else {
            dates.add(DateTime.parse(d));
            bookmaker.add([ref.read(oddsProvider).scoreList[i].bookmakers![j]]);
            soccerOddsList.add([ref.read(oddsProvider).scoreList[i]]);
          }
        }
      }
    }
    setState(() {});
  }

  bannerDialog() {
    showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.zero,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Appcolor.primaryColor,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      isFirstTime = false;
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.cancel_outlined,
                      color: Appcolor.whitecolor,
                    ),
                  ),
                ),
                const Expanded(
                  child: HomeBanner(),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    if (isFirstTime) {
      Future.delayed(Duration.zero, () {
        bannerDialog();
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Appcolor.primaryColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0),
        child: AppBar(
          centerTitle: true,
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      key: drawerKey,
      body: SafeArea(
        child: Column(children: [
          const BannerView(),
          _selectedIndex == 0 ||
                  _selectedIndex == 4 ||
                  _selectedIndex == 5 ||
                  _selectedIndex == 6
              ? Container()
              : Container(
                  decoration: BoxDecoration(color: Appcolor.whitecolor),
                  margin: const EdgeInsets.only(top: 10),
                  height: 65,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: stringList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () => setState(() {
                                Navigator.pushReplacement(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder:
                                        (context, animation1, animation2) =>
                                            const HomeScreen(),
                                    transitionDuration: Duration.zero,
                                    reverseTransitionDuration: Duration.zero,
                                  ),
                                );
                                selectedFeild = stringList[index].apiend;
                                _currentIndex = index;
                              }),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 22,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        SizedBox(
                                          child: ClipRRect(
                                            child: SvgPicture.asset(
                                              stringList[index].assets,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Center(
                                          child: Text(
                                            stringList[index].title,
                                            style: const TextStyle(
                                                fontSize: 9,
                                                fontWeight: FontWeight.w400,
                                                color: Appcolor.blackcolor,
                                                letterSpacing: 0.5),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                      ],
                                    ),
                                  ),
                                  index != stringList.length - 1
                                      ? const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 4.0),
                                          child: SizedBox(
                                              height: double.infinity,
                                              child: VerticalDivider(
                                                width: 1,
                                                thickness: 1,
                                                color: Appcolor.betSoftGrey,
                                              )),
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                              _currentIndex == index
                                  ? Positioned(
                                      bottom: -18,
                                      child: Transform.rotate(
                                        angle: 3.14159 / 4,
                                        child: Container(
                                          height: 20,
                                          width: 20,
                                          color: Appcolor.betNavy,
                                        ),
                                      ))
                                  : const SizedBox()
                            ],
                          ));
                    },
                  ),
                ),
          if (_selectedIndex == 1) FixtureScreen(field: selectedFeild),
          if (_selectedIndex == 2)
            ResultScreen(
              field: selectedFeild,
              title: stringList[_currentIndex].title,
            ),
          if (_selectedIndex == 3) OddsScreen(field: selectedFeild),
          if (_selectedIndex == 0) const NewsScreen(),
          if (_selectedIndex == 4) const ContactUsPage(),
          if (_selectedIndex == 5) const PrivacyPolicy(),
          if (_selectedIndex == 6) const TermsOfUse(),
        ]),
      ),
      drawer: Drawer(
        backgroundColor: Appcolor.primaryColor,
        elevation: 4,
        width: size.width * 0.5,
        child: Column(
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListTile(
                onTap: () {
                  checkIndexForFixture(fixtureBreakCode);
                  _selectedIndex = 1;
                  title = "Fixtures";
                  setState(() {});
                  drawerKey.currentState!.closeDrawer();
                },
                selected: _selectedIndex == 1 ? true : false,
                selectedColor: Appcolor.greycolor,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        color: _selectedIndex == 1
                            ? Appcolor.secondarycolor
                            : Appcolor.transparentcolor)),
                title: Text(
                  'Fixtures',
                  style: TextStyle(
                      color: _selectedIndex == 1
                          ? Appcolor.whitecolor
                          : Appcolor.greycolor),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListTile(
                onTap: () {
                  checkIndexForResults(resultsBreakCode);
                  _selectedIndex = 2;
                  title = 'Results';
                  setState(() {});
                  drawerKey.currentState!.closeDrawer();
                },
                selected: _selectedIndex == 2 ? true : false,
                selectedColor: Appcolor.greycolor,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        color: _selectedIndex == 2
                            ? Appcolor.secondarycolor
                            : Appcolor.transparentcolor)),
                title: Text(
                  'Results',
                  style: TextStyle(
                      color: _selectedIndex == 2
                          ? Appcolor.secondarycolor
                          : Appcolor.greycolor),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListTile(
                onTap: () {
                  checkIndexForOdds(oddsBreakCode);

                  _selectedIndex = 3;
                  title = 'Odds';
                  setState(() {});
                  drawerKey.currentState!.closeDrawer();
                },
                selected: _selectedIndex == 3 ? true : false,
                selectedColor: Appcolor.greycolor,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        color: _selectedIndex == 3
                            ? Appcolor.secondarycolor
                            : Appcolor.transparentcolor)),
                title: Text(
                  'Odds',
                  style: TextStyle(
                      color: _selectedIndex == 3
                          ? Appcolor.secondarycolor
                          : Appcolor.greycolor),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListTile(
                onTap: () {
                  _selectedIndex = 4;
                  title = 'Contact Us';
                  setState(() {});
                  Navigator.pop(context);

                  drawerKey.currentState!.closeDrawer();
                },
                selected: _selectedIndex == 4 ? true : false,
                selectedColor: Appcolor.greycolor,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        color: _selectedIndex == 4
                            ? Appcolor.secondarycolor
                            : Appcolor.transparentcolor)),
                title: Text(
                  'Contact Us',
                  style: TextStyle(
                      color: _selectedIndex == 4
                          ? Appcolor.secondarycolor
                          : Appcolor.greycolor),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListTile(
                onTap: () {
                  _selectedIndex = 5;
                  title = 'Privacy Policy';
                  setState(() {});
                  Navigator.pop(context);

                  drawerKey.currentState!.closeDrawer();
                },
                selected: _selectedIndex == 5 ? true : false,
                selectedColor: Appcolor.greycolor,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        color: _selectedIndex == 5
                            ? Appcolor.secondarycolor
                            : Appcolor.transparentcolor)),
                title: Text(
                  'Privacy Policy',
                  style: TextStyle(
                      color: _selectedIndex == 5
                          ? Appcolor.secondarycolor
                          : Appcolor.greycolor),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListTile(
                onTap: () {
                  _selectedIndex = 6;
                  title = 'Terms Of Use';
                  setState(() {});
                  Navigator.pop(context);
                  drawerKey.currentState!.closeDrawer();
                },
                selected: _selectedIndex == 6 ? true : false,
                selectedColor: Appcolor.greycolor,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        color: _selectedIndex == 6
                            ? Appcolor.secondarycolor
                            : Appcolor.transparentcolor)),
                title: Text(
                  'Terms Of Use',
                  style: TextStyle(
                      color: _selectedIndex == 6
                          ? Appcolor.secondarycolor
                          : Appcolor.greycolor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  checkIndexForFixture(bool valueOfScreen) async {
    _currentIndex = 0;
    selectedFeild = stringList[0].apiend;

    valueOfScreen
        ? {
            await fetchDataForFixture(stringList[0].apiend),
            if (soccerFixturesList.isEmpty)
              {
                selectedFeild = stringList[1].apiend,
                await fetchDataForFixture(stringList[1].apiend),
                if (soccerFixturesList.isEmpty)
                  {
                    _currentIndex = 2,
                    selectedFeild = stringList[2].apiend,
                    await fetchDataForFixture(stringList[2].apiend),
                    if (soccerFixturesList.isEmpty)
                      {
                        _currentIndex = 3,
                        selectedFeild = stringList[3].apiend,
                        await fetchDataForFixture(stringList[3].apiend),
                        if (soccerFixturesList.isEmpty)
                          {
                            _currentIndex = 1,
                            selectedFeild = stringList[1].apiend,
                          },
                      }
                    else
                      {
                        _currentIndex = 2,
                        selectedFeild = stringList[2].apiend,
                        setState(() {}),
                      },
                  }
                else
                  {
                    _currentIndex = 1,
                    selectedFeild = stringList[1].apiend,
                    setState(() {}),
                  },
              }
            else
              {
                _currentIndex = 0,
                selectedFeild = stringList[0].apiend,
                setState(() {}),
              },
          }
        : {};
  }

  checkIndexForResults(bool valueOfScreen) async {
    _currentIndex = 0;
    selectedFeild = stringList[0].apiend;

    valueOfScreen
        ? {
            await fetchDataResults(stringList[0].apiend),
            if (soccerResultsList.isEmpty)
              {
                _currentIndex = 1,
                selectedFeild = stringList[1].apiend,
                await fetchDataResults(stringList[1].apiend),
                if (soccerResultsList.isEmpty)
                  {
                    _currentIndex = 2,
                    selectedFeild = stringList[2].apiend,
                    await fetchDataResults(stringList[2].apiend),
                    if (soccerResultsList.isEmpty)
                      {
                        _currentIndex = 3,
                        selectedFeild = stringList[3].apiend,
                        await fetchDataResults(stringList[3].apiend),
                        if (soccerResultsList.isEmpty)
                          {
                            _currentIndex = 1,
                            selectedFeild = stringList[1].apiend,
                          },
                      }
                    else
                      {
                        _currentIndex = 2,
                        selectedFeild = stringList[2].apiend,
                      },
                  }
                else
                  {
                    _currentIndex = 1,
                    selectedFeild = stringList[1].apiend,
                  },
              }
            else
              {
                _currentIndex = 0,
                selectedFeild = stringList[0].apiend,
              },
          }
        : {};
  }

  checkIndexForOdds(bool valueOfScreen) async {
    _currentIndex = 0;
    selectedFeild = stringList[0].apiend;

    valueOfScreen
        ? {
            await fetchDataOdds(stringList[0].apiend),
            if (soccerOddsList.isEmpty)
              {
                _currentIndex = 1,
                selectedFeild = stringList[1].apiend,
                await fetchDataOdds(stringList[1].apiend),
                if (soccerOddsList.isEmpty)
                  {
                    _currentIndex = 2,
                    selectedFeild = stringList[2].apiend,
                    await fetchDataOdds(stringList[2].apiend),
                    if (soccerOddsList.isEmpty)
                      {
                        _currentIndex = 3,
                        selectedFeild = stringList[3].apiend,
                        await fetchDataOdds(stringList[3].apiend),
                        if (soccerOddsList.isEmpty)
                          {
                            _currentIndex = 1,
                            selectedFeild = stringList[1].apiend,
                          },
                      }
                    else
                      {
                        _currentIndex = 2,
                        selectedFeild = stringList[2].apiend,
                      },
                  }
                else
                  {
                    _currentIndex = 1,
                    selectedFeild = stringList[1].apiend,
                  },
              }
            else
              {
                _currentIndex = 0,
                selectedFeild = stringList[0].apiend,
              },
          }
        : {};
  }
}
