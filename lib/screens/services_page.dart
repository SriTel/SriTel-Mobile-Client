import 'package:SriTel/controllers/addon_controller.dart';
import 'package:SriTel/controllers/package_controller.dart';
import 'package:SriTel/controllers/service_controller.dart';
import 'package:SriTel/screens/add_on_tab.dart';
import 'package:SriTel/screens/other_services_tab.dart';
import 'package:SriTel/screens/package_tab.dart';
import 'package:SriTel/widgets/panel_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  int _activeTab = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _activeTab);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabSelected(int index) {
    Get.find<PackageController>().initializeState();
    Get.find<AddOnController>().initializeState();
    Get.find<ServiceController>().initializeState();
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 0.0, right: 0.0, bottom: 0.0, top: 16.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                PanelButton(
                  buttonText: "Package",
                  isActive: _activeTab==0,
                  onPressed: () => _onTabSelected(0),
                ),
                const SizedBox(width: 5),
                PanelButton(
                  buttonText: "Add-Ons",
                  isActive: _activeTab==1,
                  onPressed: () => _onTabSelected(1),
                ),
                const SizedBox(width: 5),
                PanelButton(
                  buttonText: "Other",
                  isActive: _activeTab==2,
                  onPressed: () => _onTabSelected(2),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  _activeTab = index;
                });
              },
              children: [
                PackageTab(),
                AddOnTab(),
                const OtherServicesTab(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
