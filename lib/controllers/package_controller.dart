import 'dart:convert';

import 'package:SriTel/models/package.dart';
import 'package:SriTel/services/api_service.dart';
import 'package:SriTel/theme/colors.dart';
import 'package:get/get.dart';

class PackageController extends GetxController{
  // services
  final ApiService _apiService = ApiService();

  // variables
  final RxBool isLoginLoading = false.obs;
  RxList<Package> packages = <Package>[].obs;
  RxList<int> activePackageIds = <int>[].obs;

  // methods
  // get of all data packages with the active/inactive status
  Future<void> fetchPackages() async {

    isLoginLoading.value = true;

    try {
      final response = await _apiService.sendGetRequest(
        false, // Authentication is not required for login
        'Package',
      );
      print(response.body);
      isLoginLoading.value = false;

      if (response.statusCode != 200 && response.statusCode != 201) {
        Get.snackbar(
          'Error',
          'An unknown error occurred. Retry again!',
          colorText: SriTelColor.titleTextColor,
          backgroundColor: SriTelColor.white,
        );
        return;
      }

      // get packages list and map them
      final List<dynamic> jsonResponse = response.body;
      packages = jsonResponse.map((data) => Package.fromJson(data)).toList().obs;

    } catch (e) {
      rethrow;
    }
  }

  // get of all voice packages with the active/inactive status

  // upgrade or downgrade a package

  // other supporting methods
  bool isAnActivePackage(int id){
    print(id);
    return activePackageIds.contains(id);
  }
}