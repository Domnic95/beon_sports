
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/Colors.dart';
import 'PrivacyPolicy.dart';
import 'TermsOfUse.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Divider(
            thickness: 1,
            color: Appcolor.primaryColor,
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  // PageRouteBuilder(
                  //   pageBuilder: (context, animation1, animation2) =>
                  //       const PrivacyPolicy(),
                  //   transitionDuration: Duration(microseconds: 500),
                  //   reverseTransitionDuration: Duration(microseconds: 500),
                  // )
                  MaterialPageRoute(
                    builder: (context) => PrivacyPolicy(),
                  ));
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Appcolor.secondarycolor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Privacy Policy",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Appcolor.whitecolor,
                        letterSpacing: 0.5),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Appcolor.whitecolor,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TermsOfUse(),
                  ));
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Appcolor.secondarycolor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Terms of Use",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Appcolor.whitecolor,
                        letterSpacing: 0.5),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Appcolor.whitecolor,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // InkWell(
          //   onTap: () async {
          //     Share.share(
          //         'https://play.google.com/store/apps/details?id=com.gamedata.BovadaOdds',
          //         subject: 'BetUsOdds');
          //   },
          //   child: Container(
          //     padding: EdgeInsets.all(10),
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10),
          //         color: Appcolor.secondarycolor),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Text(
          //           "Share App",
          //           style: TextStyle(
          //               fontWeight: FontWeight.bold,
          //               color: Appcolor.whitecolor,
          //               letterSpacing: 0.5),
          //         ),
          //         Icon(
          //           Icons.arrow_forward_ios,
          //           color: Appcolor.whitecolor,
          //         )
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
