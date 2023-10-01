import 'package:SriTel/dto/login/login_request.dart';
import 'package:SriTel/dto/login/login_response.dart';
import 'package:SriTel/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/api_service.dart';
import '../services/auth_service.dart';

class AuthController extends GetxController {
  final ApiService _apiService = ApiService();
  final AuthService _authService = Get.find();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool isLoginLoading = false.obs;

  Future<bool> login() async {
    // check if all fields are filled
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill in all fields',
        backgroundColor: Colors.red.withOpacity(0.6),
        colorText: SriTelColor.white,
      );
      return false;
    }
    isLoginLoading.value = true;

    LoginRequest loginRequest = LoginRequest(
        email: emailController.text, password: passwordController.text);
    try {
      final response = await _apiService.sendPostRequest(
        false, // Authentication is not required for login
        'auth/login',
        data: loginRequest.toJson(),
      );
      print(response!.statusCode);
      print(response.body);
      isLoginLoading.value = false;

      if (response == null) {
        return false;
      }

      if (response.statusCode != 200) {
        return false;
      }

      if (response.statusCode == 403) {
        Get.snackbar(
          'Error',
          'Invalid email or password',
          colorText: SriTelColor.titleTextColor,
          backgroundColor: SriTelColor.white,
        );
      }
      // Assuming the response contains authentication-related data
      LoginResponse loginResponse = LoginResponse.fromJson(response.body);
      await _authService.setUserInfo(loginResponse);
      await _authService.setAuthentication(true);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  void onClose() {
    // Dispose of the controllers when the controller is closed
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
