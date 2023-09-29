import 'package:SriTel/screens/bill_history.dart';
import 'package:SriTel/screens/bill_tab.dart';
import 'package:SriTel/widgets/panel_button.dart';
import 'package:flutter/material.dart';

class BillPage extends StatefulWidget {
  @override
  State<BillPage> createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  int _activeTab = 0;
  //
  late PageController _pageController;
  //
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
  //
  void _onTabSelected(int index) {
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
          left: 24.0, right: 24.0, bottom: 0.0, top: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              PanelButton(
                buttonText: "Bill Summary",
                isActive: _activeTab==0,
                onPressed: () => _onTabSelected(0),
              ),
              const SizedBox(width: 5),
              PanelButton(
                buttonText: "Payment History",
                isActive: _activeTab==1,
                onPressed: () => _onTabSelected(1),
              ),
            ],
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
                BillTab(),
                BillHistoryTab(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
