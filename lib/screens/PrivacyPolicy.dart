import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/Colors.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Appcolor.whitecolor,
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Privacy Policy",
                  style: TextStyle(
                      color: Appcolor.secondarycolor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      wordSpacing: 1),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "At Mobile beon, ensuring the privacy of our visitors is one of our utmost priorities. This document, our Privacy Policy, provides details on the information collected and used by Mobile beon. If you have any questions or need further clarification about our PrivacyPolicy, please feel free to contact us.",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Appcolor.betDarkGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Log File",
                  style: TextStyle(
                      color: Appcolor.secondarycolor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      wordSpacing: 1),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Mobile beon follows standard procedures that involve the use of log files. These files record and store information when visitors use our app. The collected data includes internet protocol (IP) addresses, browser types, Internet Service Providers (ISPs), date and time stamps, referring/exit pages, and potentially the number of clicks. None of this information personally identifies individuals. We collect this data to analyze trends, administer the app, track user movement, and gather demographic information.",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Appcolor.betDarkGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Our Advertising Partners",
                  style: TextStyle(
                      color: Appcolor.secondarycolor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      wordSpacing: 1),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Some advertisers within our app may use cookies and web beacons. Below is a list of our advertising partners, each with their own Privacy Policy that governs user data. For easy access, we have provided hyperlinks to their respective Privacy Policies.",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Appcolor.betDarkGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              const SizedBox(
                height: 10,
              ),
              Text.rich(TextSpan(
                  text: "•	Google: ",
                  style: const TextStyle(
                      color: Appcolor.secondarycolor,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      wordSpacing: 1),
                  children: [
                    TextSpan(
                        text: "Link to Google's Privacy Policy",
                        style: const TextStyle(
                            color: Appcolor.betNavy,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _launchUrl(
                                "https://policies.google.com/technologies/ads");
                          }),
                  ])),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Privacy Policies",
                  style: TextStyle(
                      color: Appcolor.secondarycolor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      wordSpacing: 1),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "To find the Privacy Policy of each advertising partner associated with Mobile beon, please refer to the list below. Third-party ad servers or ad networks may employ technologies such as cookies, JavaScript, or Beacons in their advertisements and links displayed on Mobile beon. When you access such content, your IP address is automatically received. These technologies are used to measure the effectiveness of advertising campaigns and/or personalize the advertising content you encounter on this app or other apps and websites. Please note that Mobile beon has no access to or control over the cookies used by thirdparty advertisers.",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Appcolor.betDarkGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Third-Party Privacy Policies",
                  style: TextStyle(
                      color: Appcolor.secondarycolor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      wordSpacing: 1),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Mobile beon's Privacy Policy does not apply to other advertisers or websites. Therefore, we encourage you to consult the Privacy Policies of these third-party ad servers for more comprehensive information. These policies may include details about their practices and instructions on how to opt out of specific options.",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Appcolor.betDarkGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Children's Information",
                  style: TextStyle(
                      color: Appcolor.secondarycolor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      wordSpacing: 1),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Protecting children while they use the internet is a significant aspect of our commitment. We urge parents, guardians, and caregivers to supervise, participate in, monitor, and guide the online activities of children. Mobile beon does not knowingly collect any personally identifiable information from children under the age of 13. If you believe that your child has provided such information on our app, please contact us immediately, and we will make every effortto promptly remove such data from our records.",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Appcolor.betDarkGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Online Privacy Policy Only",
                  style: TextStyle(
                      color: Appcolor.secondarycolor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      wordSpacing: 1),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "This Privacy Policy applies exclusively to our online activities and covers the information shared and/or collected on Mobile beon. It does not apply to any offline information collection or channels other than this app. Our Privacy Policy was generated with the assistance of the App Privacy Policy Generator from App-Privacy-Policy.com.",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Appcolor.betDarkGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Consent",
                  style: TextStyle(
                      color: Appcolor.secondarycolor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      wordSpacing: 1),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "By using our app, you consent to our Privacy Policy and agree to its Terms and Conditions.",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Appcolor.betDarkGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
