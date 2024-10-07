import 'package:bookticket/Screens/payment_screen.dart';
import 'package:bookticket/utils/app_layout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bookticket/Screens/ticket_view.dart';
import 'package:bookticket/utils/app_info_list.dart';
import 'package:gap/gap.dart';

import '../widgets/column_layout.dart';

class CheckoutPage extends StatelessWidget {
  final List<String> selectedSeats;
  final double seatPrice = 149.99;
  User? user = FirebaseAuth.instance.currentUser;

  CheckoutPage({Key? key, required this.selectedSeats}) : super(key: key);

  double calculateTotalPrice() {
    return seatPrice * selectedSeats.length;
  }

  Future<DocumentSnapshot> getUserData() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('data_user')
        .doc(user?.uid)
        .get();
    return snapshot;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(AppLayout.getHeight(20)),
              Text(
                'Order Summary',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Total Items: ${selectedSeats.length}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                itemCount: selectedSeats.length,
                itemBuilder: (context, index) {
                  final seatNumber = selectedSeats[index];
                  return OrderItemCard(
                    itemName: 'Seat $seatNumber',
                    quantity: 1,
                    price: seatPrice,
                  );
                },
              ),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$${calculateTotalPrice().toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tax (10%)',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$${(calculateTotalPrice() * 0.1).toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$${(calculateTotalPrice() * 1.1).toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Proceed to Payment',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Customer Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              FutureBuilder<DocumentSnapshot>(
                future: getUserData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Failed to load customer information');
                  }

                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      final data = snapshot.data!.data() as Map<String, dynamic>?;
                      final fullName = data?['fullname'] as String?;
                      final phoneNumber = data?['mobile'] as String?;

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppColumnLayout(
                            firstText: 'Full Name',
                            secondText: fullName ?? 'N/A',
                            alignment: CrossAxisAlignment.start,
                            isColor: true,
                          ),
                          AppColumnLayout(
                            firstText: 'Phone Number',
                            secondText: phoneNumber ?? 'N/A',
                            alignment: CrossAxisAlignment.end,
                            isColor: true,
                          ),
                        ],
                      );
                    } else {
                      return Text('No customer information found');
                    }
                  }

                  return CircularProgressIndicator();
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class OrderItemCard extends StatelessWidget {
  final String itemName;
  final int quantity;
  final double price;

  const OrderItemCard({
    required this.itemName,
    required this.quantity,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemName,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Quantity: $quantity',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            Text(
              '\$${(price * quantity).toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
