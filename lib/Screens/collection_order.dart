import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bookticket/utils/app_info_list.dart';
class CollectionOrder {
  final List<Map<String, dynamic>> ticketList = [
    // Data tiket dari app_info_list.dart
  ];

  void saveOrderToFirebase(List<String> selectedSeats) {
    final orderData = {
      'tickets': ticketList.where((ticket) {
        final fromCode = ticket['from']['code'];
        final toCode = ticket['to']['code'];
        return selectedSeats.contains('$fromCode$toCode');
      }).toList(),
      'selectedSeats': selectedSeats,
      'createdAt': FieldValue.serverTimestamp(),
    };

    FirebaseFirestore.instance
        .collection('orders')
        .add(orderData)
        .then((value) {
      print('Order saved to Firebase: $value');
    }).catchError((error) {
      print('Failed to save order: $error');
    });
  }
}