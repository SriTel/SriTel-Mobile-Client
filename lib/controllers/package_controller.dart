import 'dart:convert';

import 'package:SriTel/models/package.dart';
import 'package:SriTel/services/api_service.dart';
import 'package:SriTel/services/auth_service.dart';
import 'package:SriTel/theme/colors.dart';
import 'package:get/get.dart';

class PackageController extends GetxController{
  // services
  final ApiService _apiService = ApiService();
  final AuthService _authService = Get.find();

  // variables
  final RxBool isLoginLoading = false.obs;
  RxList<Package> packages = <Package>[].obs;
  RxSet<int> activePackageIds = <int>{}.obs;

  // state initializer
  Future<void> initializeState() async {
    await fetchPackages();
    await getActivatedPackageIds();
  }
  // methods
  // get of all data packages with the active/inactive status
  Future<void> fetchPackages() async {

    isLoginLoading.value = true;

    try {
      final response = await _apiService.sendGetRequest(
        false, // Authentication is not required for login
        'Package',
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
      packages.assignAll(jsonResponse.map((data) => Package.fromJson(data)).toList());
      packages.sort((a, b) => a.charge.compareTo(b.charge));
      update();
    } catch (e) {
      rethrow;
    }
  }

  // get of all voice packages with the active/inactive status

  // upgrade or downgrade a package
  Future<void> changePackage(int packageId) async {
    try {
      final response = await _apiService.sendGetRequest(
        true, // Authentication is not required for login
        'package/toggle/${_authService.user!.value.id}/$packageId',
      );
      isLoginLoading.value = false;

      if (response.statusCode != 200 && response.statusCode != 201) {
        Get.snackbar(
          'Error',
          'Could\'t update. Retry again!',
          colorText: SriTelColor.titleTextColor,
        );
        return;
      }

      // if the old package id received
      if(response.body != null) {
        final responseBody = response.body;

        if (responseBody.containsKey("oldPackageId")) {
          int oldPackageId = responseBody['oldPackageId'];
          activePackageIds.remove(oldPackageId);
          activePackageIds.add(packageId);
        }
      }
      update();
    } catch (e) {
      rethrow;
    }
  }

  // get activated package ids
  Future<void> getActivatedPackageIds() async {
    try {
      final response = await _apiService.sendGetRequest(
        true, // Authentication is not required for login
        'package/activatedpackageids/${_authService.getUserId()}',
      );
      isLoginLoading.value = false;

      if (response.statusCode != 200 && response.statusCode != 201) {
        Get.snackbar(
          'Error',
          'Could\'t update. Retry again!',
          colorText: SriTelColor.titleTextColor,
        );
        return;
      }

      final dynamic responseBody = response.body;
      final List<int> jsonResponse = List<int>.from(responseBody);
      print(jsonResponse);
      activePackageIds = jsonResponse.toSet().obs;
      update();
    } catch (e) {
      rethrow;
    }
  }

  // get activated package ids
  Future<void> useDataPackage() async {
    try {
      final response = await _apiService.sendGetRequest(
        true, // Authentication is not required for login
        'package/use/data/${_authService.getUserId()}',
      );
      isLoginLoading.value = false;

      if (response.statusCode != 200 && response.statusCode != 201) {
        Get.snackbar(
          'Error',
          'Could\'t perform the task. Retry again!',
          colorText: SriTelColor.titleTextColor,
        );
        return;
      }
      update();
    } catch (e) {
      rethrow;
    }
  }

  // get activated package ids
  Future<void> useVoicePackageCalls() async {
    try {
      final response = await _apiService.sendGetRequest(
        true, // Authentication is not required for login
        'package/use/voice/call/${_authService.getUserId()}',
      );
      isLoginLoading.value = false;

      if (response.statusCode != 200 && response.statusCode != 201) {
        Get.snackbar(
          'Error',
          'Could\'t perform the task. Retry again!',
          colorText: SriTelColor.titleTextColor,
        );
        return;
      }
      update();
    } catch (e) {
      rethrow;
    }
  }

  // get activated package ids
  Future<void> useVoicePackageSms() async {
    try {
      final response = await _apiService.sendGetRequest(
        true, // Authentication is not required for login
        'package/use/voice/sms/${_authService.getUserId()}',
      );
      isLoginLoading.value = false;

      if (response.statusCode != 200 && response.statusCode != 201) {
        Get.snackbar(
          'Error',
          'Could\'t perform the task. Retry again!',
          colorText: SriTelColor.titleTextColor,
        );
        return;
      }
      update();
    } catch (e) {
      rethrow;
    }
  }

  // other supporting methods
  bool isAnActivePackage(int id) {
    return activePackageIds.contains(id);
  }
}