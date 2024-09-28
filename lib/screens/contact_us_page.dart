import 'package:flutter/material.dart';

import '../widgets/Colors.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Appcolor.whitecolor,
        padding: const EdgeInsets.all(8.0),
        child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  listTileConst(
                      icon: Icons.email_sharp,
                      title: "Email us:",
                      subTitle: "roofbitprest@gmail.com"),
                  // listTileConst(
                  //     icon: Icons.phone,
                  //     title: "Speak to us:",
                  //     subTitle: "+11-888-426-3661"),
                ],
              ),
            )),
      ),
    );
  }

  Widget listTileConst({IconData? icon, title, subTitle}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Card(
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Icon(icon),
          ),
          title: Text(
            title,
            style: const TextStyle(
                color: Appcolor.secondarycolor,
                fontWeight: FontWeight.w500,
                fontSize: 18,
                wordSpacing: 1),
          ),
          subtitle: Text(
            subTitle,
            style: const TextStyle(
                color: Appcolor.primaryColor,
                fontWeight: FontWeight.w700,
                fontSize: 15,
                wordSpacing: 1),
          ),
        ),
      ),
    );
  }
// Widget columnConst(title,subTitle) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children:  [
//       Text(
//         title,
//         style:const TextStyle(
//             color: Appcolor.secondarycolor,
//             fontWeight: FontWeight.w500,
//             fontSize: 18,
//             wordSpacing: 1),
//       ),
//       SizedBox(
//         height: 3,
//       ),
//       Text(
//         subTitle,
//         style:const TextStyle(
//             color: Appcolor.primaryColor,
//             fontWeight: FontWeight.w700,
//             fontSize: 15,
//             wordSpacing: 1),
//       )
//     ],
//   );
// }
}
