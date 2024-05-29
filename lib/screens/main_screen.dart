import 'package:consultation_heating/screens/bitcoin_screen.dart';
import 'package:consultation_heating/screens/home_screen.dart';
import 'package:consultation_heating/screens/settings_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/sidebar/sidebar.dart';
import 'info_screen.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedItem = 1; // Default to Home

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBar(
            onItemTap: (itemNumber) {
              setState(() {
                selectedItem = itemNumber;
              });
            },
          ),
          Expanded(
            child: _buildSelectedWidget(),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedWidget() {
    switch (selectedItem) {
      case 1:
        return HomeScreen(); // Replace with your HomeWidget
      case 2:
        return BitcoinScreen(); // Replace with your BitcoinWidget
      case 3:
        return SettingsScreen(); // Replace with your SettingsWidget
      case 4:
        return InfoScreen(); // Replace with your AboutUsWidget
      default:
        return Container(); // Handle default case here
    }
  }
}
