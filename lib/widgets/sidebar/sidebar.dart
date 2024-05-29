import 'sidebar_icon.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
class SideBar extends StatefulWidget {
  const SideBar({Key? key, required this.onItemTap}) : super(key: key);

  final Function(int) onItemTap;

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  int selectedIcon = 1; // 1 for Home, 2 for Bitcoin, 3 for Settings, 4 for About Us

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kGrayColor,
      width: MediaQuery.of(context).size.height * 0.3,
      child: Column(
        children: [
          SizedBox(height: 20,),
          Image.asset(
            'assets/consultation_heating_logo.png',
            height: 50,
            width: MediaQuery.of(context).size.height * 0.25,
          ),
          SizedBox(height: 50,),
          _buildSidebarItem(Icons.home, 'Home', 1),
          SizedBox(height: 40,),
          _buildSidebarItem(Icons.currency_bitcoin, 'Bitcoin', 2),
          SizedBox(height: 40,),
          _buildSidebarItem(Icons.settings, 'Settings', 3),
          SizedBox(height: 40,),
          _buildSidebarItem(Icons.info, 'About Us', 4),
        ],
      ),
    );
  }

  Widget _buildSidebarItem(IconData icon, String text, int itemNumber) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIcon = itemNumber;
        });
        widget.onItemTap(selectedIcon);
      },
      child: SidebarIcon(
        icon: icon,
        text: text,
        color: selectedIcon == itemNumber ? kGoldenColor : Colors.white,
      ),
    );
  }
}


