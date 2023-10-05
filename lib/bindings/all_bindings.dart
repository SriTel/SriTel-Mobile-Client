import 'package:SriTel/controllers/addon_controller.dart';
import 'package:SriTel/controllers/auth_controller.dart';
import 'package:SriTel/controllers/balance_controller.dart';
import 'package:SriTel/controllers/bill_controller.dart';
import 'package:SriTel/controllers/package_controller.dart';
import 'package:SriTel/controllers/payment_controller.dart';
import 'package:SriTel/controllers/service_controller.dart';
import 'package:SriTel/services/api_service.dart';
import 'package:SriTel/services/auth_service.dart';
import 'package:get/get.dart';

class AllBindings implements Bindings{
  @override
  void dependencies(){
    Get.put<AuthService>(AuthService());
    Get.put<AuthController>(AuthController());
    Get.put<PackageController>(PackageController());
    Get.put<ServiceController>(ServiceController());
    Get.put<AddOnController>(AddOnController());
    Get.put<BillController>(BillController());
    Get.put<PaymentController>(PaymentController());
    Get.put<BalanceController>(BalanceController());

  }
}