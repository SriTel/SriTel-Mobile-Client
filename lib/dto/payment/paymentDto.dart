import 'package:SriTel/widgets/payment_history_widget.dart';
import 'package:intl/intl.dart';

class PaymentDto{
  final int billId;
  final int serviceId;
  final int userId;
  final PaymentType paymentMethod;
  final DateTime payDateTime;
  final double payAmount;
  final double outstanding;

  PaymentDto({
    required this.billId,
    required this.serviceId,
    required this.userId,
    required this.paymentMethod,
    required this.payDateTime,
    required this.payAmount,
    required this.outstanding
});

  // conversion methods
  Map<String, dynamic> toJson() {
    return {
      'billId': billId,
      'serviceId': serviceId,
      'userId': userId,
      'paymentMethod': _paymentTypeMapping[paymentMethod],
      'payDateTime': DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(payDateTime), // Convert DateTime to ISO 8601 format
      'payAmount': payAmount,
      'dueAmount': outstanding,
    };
  }

  static const Map<PaymentType, int> _paymentTypeMapping = {
    PaymentType.card : 0,
    PaymentType.bank : 1,
  };
}