import 'package:bookticket/utils/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:bookticket/Screens/tickets_screen.dart';
class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String selectedPaymentMethod = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(AppLayout.getHeight(20)),
            Text(
              'Select Payment Method',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              title: Text('Cash on Airport'),
              leading: Radio<String>(
                value: 'Cash on Airport',
                groupValue: selectedPaymentMethod,
                onChanged: (String? value) {
                  setState(() {
                    selectedPaymentMethod = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Visa'),
              leading: Radio<String>(
                value: 'Visa',
                groupValue: selectedPaymentMethod,
                onChanged: (String? value) {
                  setState(() {
                    selectedPaymentMethod = value!;
                  });
                },
              ),
              trailing: selectedPaymentMethod == 'Visa'
                  ? Text(
                'Temporary unavailable',
                style: TextStyle(color: Colors.red),
              )
                  : null,
            ),
            ListTile(
              title: Text('Mastercard'),
              leading: Radio<String>(
                value: 'Mastercard',
                groupValue: selectedPaymentMethod,
                onChanged: (String? value) {
                  setState(() {
                    selectedPaymentMethod = value!;
                  });
                },
              ),
              trailing: selectedPaymentMethod == 'Mastercard'
                  ? Text(
                'Temporary unavailable',
                style: TextStyle(color: Colors.red),
              )
                  : null,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                if (selectedPaymentMethod == 'Cash on Airport') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TicketScreen(),
                    ),
                  ); // Pergi ke TicketScreen jika metode pembayaran "Cash on Airport" dipilih
                } else if (selectedPaymentMethod.isNotEmpty) {
                  // Lakukan tindakan sesuai metode pembayaran yang dipilih
                  switch (selectedPaymentMethod) {
                    case 'Visa':
                    // Lakukan tindakan pembayaran dengan Visa
                      break;
                    case 'Mastercard':
                    // Lakukan tindakan pembayaran dengan Mastercard
                      break;
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Pay Now',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}