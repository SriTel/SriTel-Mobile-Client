import 'package:SriTel/widgets/bill_widget.dart';
import 'package:SriTel/widgets/payment_history_widget.dart';

class Payment{
  final int id;
  final int billId;
  final int userId;
  final int serviceId;
  final DateTime payDatetime;
  final PaymentType payMethod;
  final double payAmount;
  final double outstanding;


  Payment({
    required this.id,
    required this.billId,
    required this.userId,
    required this.serviceId,
    required this.payDatetime,
    required this.payMethod,
    required this.payAmount,
    required this.outstanding
});

  // conversion methods
  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'],
      billId: json['billId'],
      userId: json['userId'],
        serviceId: json['serviceId'],
        payDatetime: DateTime.parse(json['payDateTime'].toString().substring(0, 26)),
        payMethod: _paymentTypeMapping[json['payMethod']] ?? PaymentType.card,
        payAmount: _jsonToDouble(json['payAmount']),
        outstanding: _jsonToDouble(json['outstanding']));
  }

  static const Map<int, PaymentType> _paymentTypeMapping = {
    0: PaymentType.card,
    1: PaymentType.bank,
  };

  static double _jsonToDouble(dynamic value) {
    if (value is int) {
      return value.toDouble();
    } else if (value is double) {
      return value;
    } else {
      // Handle other types or null as needed
      return 0.0;
    }
  }
}