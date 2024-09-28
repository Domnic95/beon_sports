import 'package:flutter/material.dart';
import '../widgets/Colors.dart';

class TermsOfUse extends StatelessWidget {
  const TermsOfUse({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Appcolor.whitecolor,
        padding: const EdgeInsets.all(8.0),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Terms of Use",
                  style: TextStyle(
                      color: Appcolor.secondarycolor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      wordSpacing: 1),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 5),
                      child: Text(
                        'Welcome to Mobile beon!',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Appcolor.betDarkGrey,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 5),
                      child: Text(
                        '''These terms and conditions establish the rules and regulations for your use of Mobile beon. By accessing and using this app, you acknowledge that you have read, understood, and agree to comply with all the terms and conditions outlined on this page. If you do not agree to these terms and conditions, please refrain from using Mobile beon.''',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Appcolor.betDarkGrey,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 5),
                      child: Text(
                        '''The following terms apply to these Terms and Conditions, Privacy Statement, Disclaimer Notice, and all Agreements: "Client," "You," and "Your" refer to you, the user of this website who complies with the Company's terms and conditions. "The Company," "Ourselves," "We," "Our," and "Us" refer to our Company. "Party," "Parties," or "Us" refer to both the Client and ourselves. All terms refer to the offer, acceptance, and consideration of payment necessary to provide assistance to the Client in the most appropriate manner, meeting the Client's needs in accordance with the Company's stated services and subject to the prevailing laws of the Netherlands. Any use of the above terminology or other words in the singular, plural, capitalization, and/or he/she or they is taken as interchangeable and therefore refers to the same.''',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Appcolor.betDarkGrey,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "License",
                  style: TextStyle(
                      color: Appcolor.secondarycolor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      wordSpacing: 1),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, top: 10),
                child: Text(
                  "Unless otherwise stated, Mobile beon and/or its licensors own the intellectual property rights for all materials on Mobile beon. All intellectual property rights are reserved. You may access and use the materials on Mobile beon for personal purposes, subject to the restrictions set forth in these terms and conditions. You must not:",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Appcolor.betDarkGrey,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "•	",
                    style: TextStyle(
                        color: Appcolor.betDarkGrey,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  Expanded(
                    child: Text(
                      "Republish material from Mobile beon.",
                      style: TextStyle(
                          color: Appcolor.betDarkGrey,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, top: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "•	",
                      style: TextStyle(
                          color: Appcolor.betDarkGrey,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                    Expanded(
                      child: Text(
                        "Sell, rent, or sublicense material from Mobile beon.",
                        style: TextStyle(
                            color: Appcolor.betDarkGrey,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "•	",
                    style: TextStyle(
                        color: Appcolor.betDarkGrey,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  Expanded(
                    child: Text(
                      "Reproduce, duplicate, or copy material from Mobile beon.",
                      style: TextStyle(
                          color: Appcolor.betDarkGrey,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, top: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "•	",
                      style: TextStyle(
                          color: Appcolor.betDarkGrey,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                    Expanded(
                      child: Text(
                        "Redistribute content from Mobile beon.",
                        style: TextStyle(
                            color: Appcolor.betDarkGrey,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 10),
                  child: Text(
                    'This Agreement begins on the date specified. Certain parts of this app provide users with the opportunity to post and exchange opinions and information in specific areas of the website. Mobile beon does not filter, edit, publish, or review Comments prior to their presence on the website. Comments reflect the views and opinions of the individuals who post them and do not necessarily represent the views and opinions of Mobile beon, its agents, and/or affiliates. To the extent permitted by applicable laws, Mobile beon shall not be liable for the Comments or for any liability, damages, or expenses caused and/or suffered as a result of any use of and/or posting of and/or appearance of the Comments on this website. Mobile beon reserves the right to monitor all Comments and to remove any Comments that may be considered inappropriate, offensive, or in violation of these Terms and Conditions.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Appcolor.betDarkGrey,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "By posting Comments on our app, you warrant and represent that:",
                  style: TextStyle(
                      color: Appcolor.secondarycolor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      wordSpacing: 1),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "•	",
                    style: TextStyle(
                        color: Appcolor.betDarkGrey,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  Expanded(
                    child: Text(
                      "You are entitled to post the Comments on our app and have all necessary licenses and consents to do so.",
                      style: TextStyle(
                          color: Appcolor.betDarkGrey,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "•	",
                    style: TextStyle(
                        color: Appcolor.betDarkGrey,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  Expanded(
                    child: Text(
                      "The Comments do not infringe upon any intellectual property rights, including without limitation, copyrights, patents, or trademarks of any third party.",
                      style: TextStyle(
                          color: Appcolor.betDarkGrey,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "•	",
                    style: TextStyle(
                        color: Appcolor.betDarkGrey,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  Expanded(
                    child: Text(
                      "The Comments do not contain any defamatory, libelous, offensive, indecent, or otherwise unlawful material that invades privacy.",
                      style: TextStyle(
                          color: Appcolor.betDarkGrey,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "•	",
                    style: TextStyle(
                        color: Appcolor.betDarkGrey,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  Expanded(
                    child: Text(
                      "The Comments will not be used to solicit or promote business or engage in commercial or unlawful activities.",
                      style: TextStyle(
                          color: Appcolor.betDarkGrey,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 10),
                  child: Text(
                    'You hereby grant Mobile beon a non-exclusive license to use, reproduce, edit, and authorize others to use, reproduce, and edit any of your Comments in any and all forms, formats, or media.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Appcolor.betDarkGrey,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Hyperlinking to our App",
                  style: TextStyle(
                      color: Appcolor.secondarycolor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      wordSpacing: 1),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "The following organizations may link to our app without prior written approval:",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Appcolor.betDarkGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, top: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "•	",
                      style: TextStyle(
                          color: Appcolor.betDarkGrey,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                    Expanded(
                      child: Text(
                        "Government agencies.",
                        style: TextStyle(
                            color: Appcolor.betDarkGrey,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "•	",
                    style: TextStyle(
                        color: Appcolor.betDarkGrey,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  Expanded(
                    child: Text(
                      "Search engines.",
                      style: TextStyle(
                          color: Appcolor.betDarkGrey,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "•	",
                    style: TextStyle(
                        color: Appcolor.betDarkGrey,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  Expanded(
                    child: Text(
                      "News organizations.",
                      style: TextStyle(
                          color: Appcolor.betDarkGrey,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "•	",
                    style: TextStyle(
                        color: Appcolor.betDarkGrey,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  Expanded(
                    child: Text(
                      "Online directory distributors may link to our app in the same manner as they hyperlink to the websites of other listed businesses.",
                      style: TextStyle(
                          color: Appcolor.betDarkGrey,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "•	",
                    style: TextStyle(
                        color: Appcolor.betDarkGrey,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  Expanded(
                    child: Text(
                      "System-wide Accredited Businesses, except soliciting non-profit organizations, charity",
                      style: TextStyle(
                          color: Appcolor.betDarkGrey,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
