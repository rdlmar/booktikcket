import 'package:flutter/material.dart';
import 'checkout_page.dart';
import 'collection_order.dart';

class SeatSelection extends StatefulWidget {
  @override
  _SeatSelectionState createState() => _SeatSelectionState();
}

class _SeatSelectionState extends State<SeatSelection> {
  CollectionOrder collectionOrder = CollectionOrder(); // Tambahkan ini

  List<List<bool>> seatStatus = List.generate(
    11,
        (_) => List.generate(4, (_) => false),
  );

  void _navigateToCheckout() {
    List<String> selectedSeats = [];
    for (int row = 0; row < seatStatus.length; row++) {
      for (int col = 0; col < seatStatus[row].length; col++) {
        if (seatStatus[row][col]) {
          String seatNumber = '${row + 1}${String.fromCharCode(65 + col)}';
          selectedSeats.add(seatNumber);
        }
      }
    }

    if (selectedSeats.isEmpty) {
      final snackBar = SnackBar(
        content: Text('Choose your seat before checking out!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      collectionOrder.saveOrderToFirebase(selectedSeats); // Panggil saveOrderToFirebase dari CollectionOrder
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CheckoutPage(selectedSeats: selectedSeats),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Flight'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Select a seat:',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                Container(
                  width: 300,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    itemCount: 44,
                    itemBuilder: (context, index) {
                      final row = index ~/ 4;
                      final col = index % 4;
                      final seatNumber = '${row + 1}${String.fromCharCode(65 + col)}';
                      final isSelected = seatStatus[row][col];

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            seatStatus[row][col] = !seatStatus[row][col];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.green : Colors.grey,
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              seatNumber,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: isSelected ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _navigateToCheckout,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Proceed',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}