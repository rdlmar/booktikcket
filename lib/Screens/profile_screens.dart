import 'package:bookticket/Screens/edit_profile_screen.dart';
import 'package:bookticket/login_page.dart';
import 'package:bookticket/utils/app_layout.dart';
import 'package:bookticket/utils/app_styles.dart';
import 'package:bookticket/widgets/column_layout.dart';
import 'package:bookticket/widgets/layout_builder_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var phonenumber = "Phone number isn't registered";
  User? user = FirebaseAuth.instance.currentUser;

  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserDataStream() {
    return FirebaseFirestore.instance
        .collection('data_user')
        .doc(user?.uid)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: getUserDataStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            String? fullname = snapshot.data?.data()?['fullname'];
            String? mobile = snapshot.data?.data()?['mobile'];

            return ListView(
              padding: EdgeInsets.symmetric(
                horizontal: AppLayout.getHeight(20),
                vertical: AppLayout.getHeight(20),
              ),
              children: [
                Gap(AppLayout.getHeight(40)),
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
                          fullname ?? "",
                          style: Styles.headLineStyle,
                        ),
                        Gap(AppLayout.getHeight(2)),
                        Text(
                          mobile ?? "",
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
                        )
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => EditProfileScreen()),
                            );
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
                Gap(AppLayout.getHeight(8)),
                Divider(color: Colors.grey.shade300),
                Gap(AppLayout.getHeight(8)),
                Stack(
                  children: [
                    Container(
                      height: AppLayout.getHeight(90),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Styles.primaryColor,
                        borderRadius: BorderRadius.circular(AppLayout.getHeight(18)),
                      ),
                    ),
                    Positioned(
                      right: -45,
                      top: -40,
                      child: Container(
                        padding: EdgeInsets.all(AppLayout.getHeight(30)),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(width: 18, color: Color(0xFF264CD2)),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppLayout.getHeight(25),
                        vertical: AppLayout.getHeight(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            child: Icon(
                              FluentSystemIcons.ic_fluent_lightbulb_filament_filled,
                              color: Styles.primaryColor,
                              size: 27,
                            ),
                            maxRadius: 25,
                            backgroundColor: Colors.white,
                          ),
                          Gap(AppLayout.getHeight(12)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "You've got a new reward!",
                                style: Styles.headLineStyle2.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "You have 35 flights in a year",
                                style: Styles.headLineStyle2.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Gap(AppLayout.getHeight(25)),
                Text("Accumulated miles", style: Styles.headLineStyle2,),
                Gap(AppLayout.getHeight(20)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(15)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppLayout.getWidth(18)),
                    color: Styles.bgColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 1,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Gap(AppLayout.getHeight(15)),
                      Text(
                        "19282",
                        style: TextStyle(
                          fontSize: 45,
                          color: Styles.textColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Gap(AppLayout.getHeight(20)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Miles Accrued",
                            style: Styles.headLineStyle4.copyWith(fontSize: 16),
                          ),
                          Text(
                            "11 June 2023",
                            style: Styles.headLineStyle4.copyWith(fontSize: 16),
                          ),
                        ],
                      ),
                      Gap(AppLayout.getHeight(4)),
                      Divider(color: Colors.grey.shade300),
                      Gap(AppLayout.getHeight(4)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          AppColumnLayout(
                            firstText: "14 451",
                            secondText: "Miles",
                            alignment: CrossAxisAlignment.start,
                            isColor: false,
                          ),
                          AppColumnLayout(
                            firstText: "Air Penguin",
                            secondText: "Received from",
                            alignment: CrossAxisAlignment.end,
                            isColor: false,
                          ),
                        ],
                      ),
                      Gap(AppLayout.getHeight(12)),
                      const AppLayoutBuilderWidget(sections: 12, isColor: false),
                      Gap(AppLayout.getHeight(12)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          AppColumnLayout(
                            firstText: "2 282",
                            secondText: "Miles",
                            alignment: CrossAxisAlignment.start,
                            isColor: false,
                          ),
                          AppColumnLayout(
                            firstText: "Qatar Airways",
                            secondText: "Received from",
                            alignment: CrossAxisAlignment.end,
                            isColor: false,
                          ),
                        ],
                      ),
                      Gap(AppLayout.getHeight(12)),
                      const AppLayoutBuilderWidget(sections: 12, isColor: false),
                      Gap(AppLayout.getHeight(12)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          AppColumnLayout(
                            firstText: "2 549",
                            secondText: "Miles",
                            alignment: CrossAxisAlignment.start,
                            isColor: false,
                          ),
                          AppColumnLayout(
                            firstText: "Garuda Indonesia",
                            secondText: "Received from",
                            alignment: CrossAxisAlignment.end,
                            isColor: false,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Gap(AppLayout.getHeight(25)),
                InkWell(
                  onTap: () => print("You Are Tapped"),
                  child: Center(
                    child: Text(
                      "How to get more miles",
                      style: Styles.textStyle.copyWith(
                        color: Styles.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Gap(AppLayout.getHeight(20)),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
                  ),
                  child: Container(
                    height: AppLayout.getHeight(30),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.exit_to_app_sharp),
                          SizedBox(width: AppLayout.getWidth(8)),
                          Center(
                            child: Text(
                              "Log Out",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
