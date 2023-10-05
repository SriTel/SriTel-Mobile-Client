import 'package:SriTel/models/usage.dart';
import 'package:SriTel/services/api_service.dart';
import 'package:SriTel/services/auth_service.dart';
import 'package:get/get.dart';

class BalanceController extends GetxController{
  // services
  final ApiService _apiService = ApiService();
  final AuthService _authService = Get.find();

  // observables
  RxList<Usage> dataBalanceUsageList = <Usage>[].obs;
  RxList<Usage> voiceBalanceUsageList = <Usage>[].obs;

  // state initializer
  Future<void> initializeState() async {
    await fetchDataBalance();
    await fetchVoiceBalance();
  }

  Future<void> fetchDataBalance() async {
    try {
      final response = await _apiService.sendGetRequest(
        true, // Authentication is not required for login
        'balance/data/${_authService.getUserId()}',
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        return;
      }

      if(response.body != null){
        final List<dynamic> dynamicBody = response.body;
        dataBalanceUsageList.assignAll(dynamicBody.map((jsonPayment) => Usage.fromJson(jsonPayment)).toList());
      }
      update();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> fetchVoiceBalance() async {
    try {
      final response = await _apiService.sendGetRequest(
        true, // Authentication is not required for login
        'balance/voice/${_authService.getUserId()}',
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        return;
      }

      if(response.body != null){
        final List<dynamic> dynamicBody = response.body;
        voiceBalanceUsageList.assignAll(dynamicBody.map((jsonPayment) => Usage.fromJson(jsonPayment)).toList());
      }
      update();
    } catch (e) {
      rethrow;
    }
  }
}