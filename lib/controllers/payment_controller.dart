import 'package:SriTel/dto/payment/paymentDto.dart';
import 'package:SriTel/models/payment.dart';
import 'package:SriTel/services/api_service.dart';
import 'package:SriTel/services/auth_service.dart';
import 'package:SriTel/theme/colors.dart';
import 'package:SriTel/widgets/payment_history_widget.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController{
  // services
  final ApiService _apiService = ApiService();
  final AuthService _authService = Get.find();

  // observables
  RxList<Payment> payments = <Payment>[].obs;

  // state initializer
  Future<void> initializeState() async {
    await fetchPayments();
  }

  Future<void> fetchPayments() async {
    try {
      final response = await _apiService.sendGetRequest(
        true, // Authentication is not required for login
        'payment/${_authService.getUserId()}',
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        return;
      }

      if(response.body != null){
        final List<dynamic> dynamicBody = response.body;
        payments.assignAll(dynamicBody.map((jsonPayment) => Payment.fromJson(jsonPayment)).toList());
        payments.sort((a, b) => b.id.compareTo(a.id));
      }
      update();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> makePayment(int billId, int serviceId, double payAmount, double dueAmount) async{
    DateTime dateTime = DateTime.now();
    PaymentDto paymentDto = PaymentDto(
      billId: billId,
      serviceId: serviceId,
      userId: _authService.getUserId(),
      paymentMethod: PaymentType.card,
      payDateTime: dateTime,
      payAmount: payAmount,
      outstanding: dueAmount
    );

    try {
      final response = await _apiService.sendPostRequest(
        true, // Authentication is not required for login
        'payment',
        data: paymentDto.toJson(),
      );

      if (response == null || (response.statusCode != 200 && response.statusCode != 201)) {
        return;
      }

      if(response.body != null){
        final responseBody = response.body;
        if(responseBody.containsKey("Status") && responseBody["Status"] == "Success"){
          Get.snackbar(
            'Success',
            'Payment was successful!',
            colorText: SriTelColor.titleTextColor,
          );
          await fetchPayments();
        }
      }
      update();
    } catch (e) {
      rethrow;
    }
  }
}