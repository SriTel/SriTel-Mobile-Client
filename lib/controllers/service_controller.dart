import 'package:SriTel/dto/services/ringingTone.dart';
import 'package:SriTel/models/tune.dart';
import 'package:SriTel/services/api_service.dart';
import 'package:SriTel/services/auth_service.dart';
import 'package:SriTel/theme/colors.dart';
import 'package:flutter_svg/avd.dart';
import 'package:get/get.dart';

class ServiceController extends GetxController{
  // services
  final ApiService _apiService = ApiService();
  final AuthService _authService = Get.find();

  // observable objects
  Rx<int> _isDataRoaming = 0.obs;
  Rx<int> _isVoiceRoaming = 0.obs;
  Rx<int> _isRingingTone = 0.obs;
  RxString _ringingTone = "Alone - Alan Walker".obs;
  RxList<TuneModel> tunes = <TuneModel>[].obs;

  // init method
  @override
  void onInit() {
    // Initialize the songs list with initial data
    tunes.assignAll([
      TuneModel(song: "Alone - Alan Walker", visibility: 1),
      TuneModel(song: "DarkSide - Alan Walker", visibility: 1),
      TuneModel(song: "Faded - Alan Walker", visibility: 1),
      TuneModel(song: "The Spectre - Alan Walker", visibility: 1),
      TuneModel(song: "Sing Me to Sleep - Alan Walker", visibility: 1),
      TuneModel(song: "On My Way - Alan Walker", visibility: 1),
      TuneModel(song: "All Falls Down - Alan Walker", visibility: 1),
      TuneModel(song: "Different World - Alan Walker", visibility: 1),
      TuneModel(song: "Diamond Heart - Alan Walker", visibility: 1),
      TuneModel(song: "Lost Control - Alan Walker", visibility: 1),
      // Add other songs here with visibility set to 1 initially
    ]);
    super.onInit();
  }

  // getters
  bool getIsRingingTone() => _isRingingTone.value == 1;
  bool getIsVoiceRoaming() => _isVoiceRoaming.value == 1;
  bool getIsDataRoaming() => _isDataRoaming.value == 1;
  String getRingingTone() => _ringingTone.value;

  // initialize state of the controller
  Future<void> initializeState() async {
    await fetchOtherServices();
  }

  Future<void> fetchOtherServices() async {
    try {
      final response = await _apiService.sendGetRequest(
        true, // Authentication is not required for login
        'service/other/status/${_authService.getUserId()}',
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        Get.snackbar(
          'Error',
          'Could\'t update. Retry again!',
          colorText: SriTelColor.titleTextColor,
        );
        return;
      }

      if(response.body != null) {
        final responseBody = response.body;

        if (responseBody.containsKey("dataRoamingStatus")
        && responseBody.containsKey("voiceRoamingStatus")
        && responseBody.containsKey("ringingToneStatus")
        && responseBody.containsKey("ringingTone")) {
          _isDataRoaming.value = responseBody['dataRoamingStatus'];
          _isVoiceRoaming.value = responseBody['voiceRoamingStatus'];
          _isRingingTone.value = responseBody['ringingToneStatus'];
          _ringingTone.value = responseBody['ringingTone'];
        }
      }
      update();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> toggleRingingTone(bool? state) async {
    try {
      final response = await _apiService.sendGetRequest(
        true, // Authentication is not required for login
        'service/ringingtone/toggle/${_authService.getUserId()}',
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        Get.snackbar(
          'Error',
          'Could\'t update. Retry again!',
          colorText: SriTelColor.titleTextColor,
        );
        return;
      }

      if(response.body != null) {
        final responseBody = response.body;
        if (responseBody.containsKey("status") && responseBody['status'] == "Success"){
          _isRingingTone = (1 - _isRingingTone.value).obs;
        }
      }
      update();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> toggleDataRoaming(bool? state) async {
    try {
      final response = await _apiService.sendGetRequest(
        true, // Authentication is not required for login
        'service/roaming/data/toggle/${_authService.getUserId()}',
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        Get.snackbar(
          'Error',
          'Could\'t update. Retry again!',
          colorText: SriTelColor.titleTextColor,
        );
        return;
      }

      if(response.body != null) {
        final responseBody = response.body;
        if (responseBody.containsKey("status") && responseBody['status'] == "Success"){
          _isDataRoaming = (1 - _isDataRoaming.value).obs;
        }
      }
      update();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> toggleVoiceRoaming(bool? state) async {
    try {
      final response = await _apiService.sendGetRequest(
        true, // Authentication is not required for login
        'service/roaming/voice/toggle/${_authService.getUserId()}',
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        Get.snackbar(
          'Error',
          'Could\'t update. Retry again!',
          colorText: SriTelColor.titleTextColor,
        );
        return;
      }

      if(response.body != null) {
        final responseBody = response.body;
        if (responseBody.containsKey("status") && responseBody['status'] == "Success"){
          _isVoiceRoaming = (1 - _isVoiceRoaming.value).obs;
        }
      }
      update();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> changeRingingTone(String newRingingTone) async {
    try {
      print("got called");
      RingingToneDTO ringingToneDTO = RingingToneDTO(ringingToneName: newRingingTone);
      final response = await _apiService.sendPostRequest(
        true, // Authentication is not required for login
        'service/ringingtone/change/${_authService.getUserId()}',
        data: ringingToneDTO.toJson(),
      );

      if(response == null){
        return;
      }

      if (response.statusCode != 200 && response.statusCode != 201) {
        Get.snackbar(
          'Error',
          'Could\'t update. Retry again!',
          colorText: SriTelColor.titleTextColor,
        );
        return;
      }

      if(response.body != null) {
        final responseBody = response.body;
        if (responseBody.containsKey("status") && responseBody['status'] == "Success"){
          _ringingTone = newRingingTone.obs;
        }
      }
      update();
    } catch (e) {
      rethrow;
    }
  }

  void updateSongVisibility(String searchQuery) {
    for (var tune in tunes) {
      if (tune.song.toLowerCase().contains(searchQuery.toLowerCase())) {
        tune.visibility = 1;
      } else {
        tune.visibility = 0;
      }
    }
    update();
  }

}