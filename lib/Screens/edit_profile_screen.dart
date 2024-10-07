import 'package:bookticket/utils/app_layout.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/app_styles.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  void _launchWhatsApp() async {
    final String whatsappUrl = "https://wa.me/6281282763509";

    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: AppLayout.getHeight(86),
                  width: AppLayout.getHeight(86),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppLayout.getHeight(10)),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/default.jpg"),
                    ),
                  ),
                ),
                Gap(AppLayout.getHeight(10)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Radli Arief",
                      style: Styles.headLineStyle,
                    ),
                    Gap(AppLayout.getHeight(2)),
                    Text(
                      "+6281282763509",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    Gap(AppLayout.getHeight(10)),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppLayout.getHeight(100)),
                        color: const Color(0xFFFEF4F3),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: AppLayout.getHeight(3),
                        vertical: AppLayout.getHeight(3),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(3),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFF526799),
                            ),
                            child: const Icon(
                              FluentSystemIcons.ic_fluent_shield_filled,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                          Gap(AppLayout.getHeight(5)),
                          const Text(
                            "Premium Status",
                            style: const TextStyle(
                              color: Color(0xFF526799),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gap(AppLayout.getHeight(5)),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        print("You are Tapped");
                      },
                      child: Text(
                        "Edit",
                        style: Styles.textStyle.copyWith(
                          color: Styles.primaryColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Gap(AppLayout.getHeight(20)),
            Text(
              "Information",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            Gap(AppLayout.getHeight(15)),
            Row(
              children: [
                Icon(Icons.privacy_tip),
                Gap(AppLayout.getHeight(5)),
                Text(
                  "Privacy policy",
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
            Gap(AppLayout.getHeight(15)),
            Row(
              children: [
                Icon(Icons.copy),
                Gap(AppLayout.getHeight(5)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Version",
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(
                      "0.0.1",
                      style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
                    ),
                  ],
                ),
              ],
            ),
            Gap(AppLayout.getHeight(30)),
            Text(
              "Help",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            Gap(AppLayout.getHeight(15)),
            Row(
              children: [
                Icon(Icons.help_center),
                Gap(AppLayout.getHeight(5)),
                Text(
                  "Payment",
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
            Gap(AppLayout.getHeight(15)),
            Row(
              children: [
                Icon(Icons.support_agent),
                Gap(AppLayout.getHeight(5)),
                GestureDetector(
                  onTap: _launchWhatsApp,
                  child: Text(
                    "Contact us",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ],
            ),
            Gap(AppLayout.getHeight(50)),
            Row(
              children: [
                Icon(Icons.arrow_forward_outlined, color: Colors.red),
                Gap(AppLayout.getHeight(5)),
                Text(
                  "Delete account",
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}