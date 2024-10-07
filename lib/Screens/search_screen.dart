import 'package:bookticket/Screens/add_flight_page.dart';
import 'package:bookticket/Screens/seat_selection_page.dart';
import 'package:bookticket/utils/app_layout.dart';
import 'package:bookticket/utils/app_styles.dart';
import 'package:bookticket/widgets/icon_text_widget.dart';
import 'package:bookticket/widgets/ticket_tabs.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/double_text_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return  Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20),
        vertical: AppLayout.getHeight(20)),
        children: [
           Gap(AppLayout.getHeight(40)),
          Text("What are\nyou looking for?", style: Styles.headLineStyle.copyWith(fontSize:AppLayout.getWidth(35))),
          Gap(AppLayout.getHeight(20)),
          const AppTicketTabs(firstTab: "Airline Tickets",secondTab: "Hotels",),
           Gap(AppLayout.getHeight(25)),
          const AppIconText(icon: Icons.flight_takeoff_rounded, text: "Departure"),
          Gap(AppLayout.getHeight(20)),
          const AppIconText(icon: Icons.flight_land_rounded, text: "Arrival"),
          Gap(AppLayout.getHeight(25)),
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SeatSelection()),
        );
      },
      child: InkWell(onTap: (){Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddFlight(),
        ),
      );},
        child: Container(
        padding: EdgeInsets.symmetric(
            vertical: AppLayout.getWidth(18),
            horizontal: AppLayout.getWidth(15)),
        decoration: BoxDecoration(
        color: Color(0xD91130CE),
        borderRadius: BorderRadius.circular(AppLayout.getWidth(15)),
        ),
        child: Center(child: Text("Find Tickets", style: Styles.textStyle.copyWith(color: Colors.white,)))
        ),
      ),
    ),
          Gap(AppLayout.getHeight(40)),
          const AppDoubleTextWidget(bigText: "Upcoming Flights",
              smallText: "View all"),
          Gap(AppLayout.getHeight(15)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
    height: AppLayout.getHeight(425),
                width: size.width*0.42,
                padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(15), vertical: AppLayout.getWidth(15)),
                decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.circular(AppLayout.getHeight(20)),
                  boxShadow: [BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 1,
                    spreadRadius: 1
                  )
                    ]
                ),
                child: Column(
                  children: [
                    Container(
                      height: AppLayout.getHeight(190),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppLayout.getHeight(12)),
                        image: const DecorationImage(
                          image: AssetImage(
                              "assets/images/sit.jpg"),
                          fit: BoxFit.fill
                        )
                      ),
                    ),
                    Gap(AppLayout.getHeight(20)),
                    Text(
                      "20% discount on the early booking of this flight. Don't miss out😉",
                      style: Styles.headLineStyle2,
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: size.width*0.44,
                        height: AppLayout.getHeight(200),
                        decoration: BoxDecoration(
                          color: Color(0xFF3AB8B8),
                          borderRadius: BorderRadius.circular(AppLayout.getHeight(18)),

                        ),
                        padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(15), horizontal: AppLayout.getHeight(15)),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Discount\nfor survey", style: Styles.headLineStyle2.copyWith(fontWeight: FontWeight.bold, color: Colors.white),),
                            Gap(AppLayout.getHeight(10)),
                            Text("Take the survey about our services and get discount", style: Styles.headLineStyle2.copyWith(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 18),),
                          ],
                        ),
                      ),
                      Positioned(
                        right: -45,
                          top: -40,
                          child: Container(
                        padding: EdgeInsets.all(AppLayout.getHeight(30)),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 18, color: Color(0xFF189999)),
                            color: Colors.transparent
                        ),
                      )
                      ),
                    ],
                  ),
                  Gap(AppLayout.getHeight(15)),
                  Container(
                    width: size.width * 0.44,
                    height: AppLayout.getHeight(210),
                    padding: EdgeInsets.symmetric(
                      vertical: AppLayout.getHeight(15),
                      horizontal: AppLayout.getHeight(15),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppLayout.getHeight(18)),
                      color: const Color(0xFFEC6545),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Take love",
                          style: Styles.headLineStyle2.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Gap(AppLayout.getHeight(5)),
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: '😍',
                                style: TextStyle(fontSize: 38),
                              ),
                              TextSpan(
                                text: '🥰',
                                style: TextStyle(fontSize: 50),
                              ),
                              TextSpan(
                                text: '😘',
                                style: TextStyle(fontSize: 38),
                              ),
                            ],
                          ),
                        ),
                        Gap(AppLayout.getHeight(40)), // Jarak sebelum teks baru
                        Text(
                          "Rate our App at Play Store",
                          style: Styles.headLineStyle3.copyWith(
                            color: Color(0xFF574D4D),
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),

                ],
              )
            ],
          )


        ],
      ),
    );
  }
}
