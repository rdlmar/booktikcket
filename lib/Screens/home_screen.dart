import 'package:bookticket/Screens/add_flight_page.dart';
import 'package:bookticket/Screens/hotel_screen.dart';
import 'package:bookticket/Screens/seat_selection_page.dart';
import 'package:bookticket/Screens/ticket_view.dart';
import 'package:bookticket/utils/app_info_list.dart';
import 'package:bookticket/utils/app_styles.dart';
import 'package:bookticket/widgets/double_text_widget.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Gap(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                         Text(
                            "Good morning", style: Styles.headLineStyle3,
                        ),
                         const Gap(5),
                         Text(
                            "Book Tickets", style: Styles.headLineStyle,
                        ),
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                            image: AssetImage(
                                "assets/images/img_1.png"))
                      ),
                    )
                  ],
                ),
                const Gap(25),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFF4F6FD)
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Row(
                    children: [
                      const Icon(FluentSystemIcons.ic_fluent_search_regular,
                      color: Color(0xFFBFC205)),
                      Text("Search", style: Styles.headLineStyle4
                      )
                    ],
                  ),
                ),
                const Gap(40),
                const AppDoubleTextWidget(bigText: "Upcoming Flights",
                    smallText: "View all")
              ],
            ),
          ),
        const Gap(15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: ticketList.map((singleTicket) {
                return GestureDetector(
                  onTap: () {
                    // Navigasi ke halaman Seat Selection dengan mengirim tiket yang dipilih
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SeatSelection(),
                      ),
                    );
                  },
                  child: TicketView(ticket: singleTicket),
                );
              }).toList(),
            ),
          ),

          const Gap(15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20) ,
            child: const AppDoubleTextWidget(bigText: "Hotels",
                smallText: "View all")
          ),
          const Gap(15),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20,),
              child: Row(
                children: hotelList.map((singlehotel) => HotelScreen(hotel: singlehotel)).toList()
              ),
          )
        ],
      )
    );
  }
}
