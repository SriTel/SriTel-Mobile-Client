import 'dart:convert';

import 'package:SriTel/models/addon.dart';
import 'package:SriTel/models/package.dart';
import 'package:SriTel/services/api_service.dart';
import 'package:SriTel/services/auth_service.dart';
import 'package:SriTel/theme/colors.dart';
import 'package:get/get.dart';


class AddOnController extends GetxController{
  // services
  final ApiService _apiService = ApiService();
  final AuthService _authService = Get.find();

  // variables
  final RxBool isLoginLoading = false.obs;
  RxList<Addon> addOns = <Addon>[].obs;

  // state initializer
  Future<void> initializeState() async {
    await fetchAddOns();
  }
  // methods
  // get of all data packages with the active/inactive status
  Future<void> fetchAddOns() async {

    isLoginLoading.value = true;

    try {
      final response = await _apiService.sendGetRequest(
        false, // Authentication is not required for login
        'addon',
      );
      isLoginLoading.value = false;

      if (response.statusCode != 200 && response.statusCode != 201) {
        Get.snackbar(
          'Error',
          'An unknown error occurred. Retry again!',
          colorText: SriTelColor.titleTextColor,
        );
        return;
      }

      // get packages list and map them
      final List<dynamic> jsonResponse = response.body;
      addOns = jsonResponse.map((data) => Addon.fromJson(data)).toList().obs;
      addOns.sort((a, b) => a.dataAmount.compareTo(b.dataAmount));
      update();
    } catch (e) {
      rethrow;
    }
  }

  // add an addon
  Future<void> addAddOn(int addOnId) async {
    try {
      final response = await _apiService.sendGetRequest(
        true, // Authentication is not required for login
        'addon/${_authService.getUserId()}/$addOnId',
      );
      isLoginLoading.value = false;

      if (response.statusCode != 200 && response.statusCode != 201) {
        Get.snackbar(
          'Error',
          'Could\'t update. Retry again!',
          colorText: SriTelColor.titleTextColor,
        );
        return;
      }else{
        print("Success");
      }
      update();
    } catch (e) {
      rethrow;
    }
  }
}