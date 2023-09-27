import 'package:SriTel/screens/bill_screen.dart';
import 'package:SriTel/screens/chat_screen.dart';
import 'package:SriTel/screens/home_page.dart';
import 'package:SriTel/screens/services_screen.dart';
import 'package:SriTel/screens/settings_screen.dart';
import 'package:SriTel/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _ComponentsScreenState();
}

class _ComponentsScreenState extends State<MainPage> {

  int _currentIndex = 2;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();

    setState(() {
      _currentIndex = 2;
      _pageController.animateToPage(
        2,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(context) {
    // final authService = Get.find<AuthService>();
    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
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
                child: Image.asset(
                  'assets/images/profile.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '+94 71 4872 852',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  'Dinuka Amarasinghe',
                  style: TextStyle(
                    fontSize: 14,
                    color: SriTelColor.grey
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      backgroundColor: SriTelColor.bgColor,
      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: PageView(
        controller: _pageController,
        children: const [
          // Add your pages here
          BillPage(),
          ServicesPage(),
          HomePage(),
          ChatPage(),
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
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        },
        items: [
          /// Bills
          SalomonBottomBarItem(
            icon: const Icon(Icons.assessment_outlined),
            title: const Text("Bills"),
            selectedColor: Colors.purple,
          ),

          /// Services
          SalomonBottomBarItem(
            icon: const Icon(Icons.amp_stories_outlined),
            title: const Text("Services"),
            selectedColor: Colors.pink,
          ),

          /// Home
          SalomonBottomBarItem(
            icon: const Icon(Icons.home_outlined),
            title: const Text("Home"),
            selectedColor: Colors.orange,
          ),

          /// Chat
          SalomonBottomBarItem(
            icon: const Icon(Icons.sms_outlined),
            title: const Text("Chat"),
            selectedColor: Colors.teal,
          ),

          /// Settings
          SalomonBottomBarItem(
            icon: const Icon(Icons.settings_outlined),
            title: const Text("Settings"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
