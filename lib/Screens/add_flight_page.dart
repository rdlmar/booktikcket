import 'package:flutter/material.dart';
import 'package:bookticket/Screens/seat_selection_page.dart';
import 'package:bookticket/Screens/ticket_view.dart';
import 'package:bookticket/utils/app_info_list.dart';
import 'package:flutter/material.dart';

import '../utils/app_layout.dart';

class AddFlight extends StatefulWidget {
  const AddFlight({Key? key}) : super(key: key);

  @override
  State<AddFlight> createState() => _AddFlightState();
}

class _AddFlightState extends State<AddFlight> {
  List<int> selectedTicketIndexes = []; // Menyimpan indeks tiket yang dipilih

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add flight'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                _selectTicket(0);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SeatSelection(),

                  ),
                ); // Memilih tiket dengan indeks 0
              },
              child: Container(
                padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
                child: TicketView(ticket: ticketList[0], isColor: true,),
              ),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                _selectTicket(1);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SeatSelection(),
                  ),
                ); // Memilih tiket dengan indeks 1
              },
              child: Container(
                padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
                child: TicketView(ticket: ticketList[1], isColor: true,),
              ),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                _selectTicket(2);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SeatSelection()
                  ),
                ); // Memilih tiket dengan indeks 2
              },
              child: Container(
                padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
                child: TicketView(ticket: ticketList[2], isColor: true,),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _selectTicket(int ticketIndex) {
    setState(() {
      if (selectedTicketIndexes.contains(ticketIndex)) {
        selectedTicketIndexes.remove(ticketIndex); // Jika tiket sudah dipilih sebelumnya, maka hapus dari daftar tiket yang dipilih
      } else {
        selectedTicketIndexes.add(ticketIndex); // Jika tiket belum dipilih sebelumnya, maka tambahkan ke daftar tiket yang dipilih
      }
    });
  }
}
