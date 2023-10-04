import 'package:SriTel/models/bill.dart';
import 'package:SriTel/services/api_service.dart';
import 'package:SriTel/services/auth_service.dart';
import 'package:SriTel/theme/colors.dart';
import 'package:SriTel/widgets/bill_widget.dart';
import 'package:get/get.dart';

enum BillType {data, voice}

class BillController extends GetxController{
  // services
  final ApiService _apiService = ApiService();
  final AuthService _authService = Get.find();
  // observables
  Rx<Bill>? dataBill;
  Rx<Bill>? voiceBill;
  RxList<BillEntry> dataBillEntries =  <BillEntry>[].obs;
  RxList<BillEntry> voiceBillEntries =  <BillEntry>[].obs;

  // getters
  int getBillId(BillType type){
    if(type == BillType.data){
      return dataBill == null ? -1 : dataBill!.value.id;
    }
    return voiceBill == null ? -1 : voiceBill!.value.id;
  }

  int getServiceId(BillType type){
    if(type == BillType.data){
      return dataBill == null ? -1 : dataBill!.value.serviceId;
    }
    return voiceBill == null ? -1 : voiceBill!.value.serviceId;
  }

  double getDueAmount(BillType type){
    if(type == BillType.data){
      return dataBill == null ? 0 : dataBill!.value.dueAmount;
    }
    return voiceBill == null ? 0 : voiceBill!.value.dueAmount;
  }

  double getTaxAmount(BillType type){
    if(type == BillType.data){
      return dataBill == null ? 0 : dataBill!.value.taxAmount;
    }
    return voiceBill == null ? 0 : voiceBill!.value.taxAmount;
  }

  double getPaidAmount(BillType type){
    if(type == BillType.data){
      return dataBill == null ? 0 : dataBill!.value.paidAmount;
    }
    return voiceBill == null ? 0 : voiceBill!.value.paidAmount;
  }

  // state initializer
  Future<void> initializeState() async {
    await fetchDataBill();
    await fetchVoiceBill();
  }

  Future<void> fetchDataBill() async {
    try {
      final response = await _apiService.sendGetRequest(
        true, // Authentication is not required for login
        'bill/data/${_authService.getUserId()}',
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        return;
      }

      if(response.body != null){
        final bill = Bill.fromJson(response.body);
        dataBillEntries.assignAll(bill.dataBillEntries());
        dataBill = bill.obs;
      }
      update();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> fetchVoiceBill() async {
    try {
      final response = await _apiService.sendGetRequest(
        true, // Authentication is not required for login
        'bill/voice/${_authService.getUserId()}',
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        return;
      }

      if(response.body != null){
        final bill = Bill.fromJson(response.body);
        voiceBillEntries.assignAll(bill.voiceBillEntries());
        voiceBill = bill.obs;
      }
      update();
    } catch (e) {
      rethrow;
    }
  }
}