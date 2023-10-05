import 'package:SriTel/controllers/addon_controller.dart';
import 'package:SriTel/controllers/auth_controller.dart';
import 'package:SriTel/controllers/balance_controller.dart';
import 'package:SriTel/controllers/bill_controller.dart';
import 'package:SriTel/controllers/package_controller.dart';
import 'package:SriTel/controllers/payment_controller.dart';
import 'package:SriTel/controllers/service_controller.dart';
import 'package:SriTel/screens/bill_page.dart';
import 'package:SriTel/screens/chat_screen.dart';
import 'package:SriTel/screens/home_page.dart';
import 'package:SriTel/screens/notifications_page.dart';
import 'package:SriTel/screens/services_page.dart';
import 'package:SriTel/screens/settings_page.dart';
import 'package:SriTel/services/auth_service.dart';
import 'package:SriTel/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _ComponentsScreenState();
}

class _ComponentsScreenState extends State<MainPage> {

  int _currentIndex = 2;
  final PageController _pageController = PageController(initialPage: 2);
  final AuthService _authService = Get.find();
  final PackageController _packageController = Get.find();
  final ServiceController _serviceController = Get.find();
  final AddOnController _addOnController = Get.find();
  final BillController _billController = Get.find();
  final PaymentController _paymentController = Get.find();
  final BalanceController _balanceController = Get.find();

  @override
  void initState() {
    super.initState();

    // Your initialization code or method invocation goes here
    _packageController.initializeState();
    _serviceController.initializeState();
    _addOnController.initializeState();
    _billController.initializeState();
    _paymentController.initializeState();
    _balanceController.initializeState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    // final authService = Get.find<AuthService>();
    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 52,
                  width: 52,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                        child: Obx(() => Image.asset(
                          'assets/images/${_authService.getProfileImage()}',
                          fit: BoxFit.cover,
                        )),
                      )
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(()=>Text(
                      _authService.getMobileNumber(),
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                      ),
                    )),
                    Obx(()=>Text(
                      _authService.getFullName(),
                      style: const TextStyle(
                          fontSize: 14,
                          color: SriTelColor.grey
                      ),
                    ))
                  ],
                )
              ],
            ),
            IconButton(
                onPressed: () => Get.to(() => ChatScreen(), transition: Transition.rightToLeft),
                icon: const Icon(Iconsax.messages_2)
            ),
          ],
        ),
      ),
      backgroundColor: SriTelColor.bgColor,
      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          // Add your pages here
          BillPage(),
          const ServicesPage(),
          const HomePage(),
          const NotificationsPage(),
          SettingsPage(),
        ],
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (index) {
            setState(() {
              _currentIndex = index;
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            });
        },
        items: [
          /// Bills
          SalomonBottomBarItem(
            icon: const Icon(Iconsax.document, weight: 5,),
            title: const Text("Bills"),
            selectedColor: SriTelColor.primaryColor,
          ),

          /// Services
          SalomonBottomBarItem(
            icon: const Icon(Iconsax.search_favorite, weight: 5,),
            title: const Text("Services"),
            selectedColor: SriTelColor.primaryColor,
          ),

          /// Home
          SalomonBottomBarItem(
            icon: const Icon(Iconsax.home_2, weight: 5,),
            title: const Text("Home"),
            selectedColor: SriTelColor.primaryColor,
          ),

          /// Chat
          SalomonBottomBarItem(
            icon: const Icon(Iconsax.notification, weight: 5,),
            title: const Text("Notifications"),
            selectedColor: SriTelColor.primaryColor,
          ),

          /// Settings
          SalomonBottomBarItem(
            icon: const Icon(Iconsax.setting_2, weight: 5,),
            title: const Text("Settings"),
            selectedColor: SriTelColor.primaryColor,
          ),
        ],
      ),
    );
  }
}
