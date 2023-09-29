import 'package:SriTel/dto/login/login_response.dart';
import 'package:SriTel/models/user.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends GetxService {
  Rx<User>? user;
  final RxString email = ''.obs;
  final RxBool isAuthenticated = false.obs;
  String _bearerToken = ''; // Store the bearer token

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    email.value = _prefs?.getString('email') ?? '';
    isAuthenticated.value = _prefs?.getBool('isAuthenticated') ?? false;
    _bearerToken =
        _prefs?.getString('bearerToken') ?? ''; // Initialize the bearer token
  }

  String getBearerToken() {
    return _bearerToken;
  }

  String getFullName(){
    return (user != null) ? "${user!.value.firstName} ${user!.value.lastName}" : "";
  }

  String getMobileNumber(){
    return (user != null) ? user!.value.mobileNumber.replaceFirst('0', '+94') : "";
  }

  String getProfileImage(){
    return (user != null) ? user!.value.image : "profile.png";
  }

  void updateBearerToken(String newToken) {
    _bearerToken = newToken;
    _prefs?.setString('bearerToken', newToken);
  }

  void setUserEmail(String newEmail) {
    email.value = newEmail;
    _prefs?.setString('email', newEmail);
  }

  void setUserInfo(LoginResponse loginResponse){
    user = User(
      firstName: loginResponse.firstName,
      lastName: loginResponse.lastName,
      email: loginResponse.email,
      nic: loginResponse.nic,
      mobileNumber: loginResponse.mobileNumber,
      password: "",
      image: loginResponse.image,
    ).obs;
    updateBearerToken(loginResponse.jwtToken);
  }

  void setAuthentication(bool value) {
    isAuthenticated.value = value;
    _prefs?.setBool('isAuthenticated', value);
  }

  void forceLogout() {
    // Clear stored authentication data
    _prefs?.remove('email');
    _prefs?.remove('bearerToken');
    _prefs?.remove('isAuthenticated');

    // Navigate the user to the login screen
    Get.offAllNamed('/login'); // Replace with your login route
  }
}
