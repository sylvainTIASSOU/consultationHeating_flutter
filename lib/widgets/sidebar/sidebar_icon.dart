import 'package:flutter/material.dart';
class SidebarIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const SidebarIcon({
    required this.icon,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: color,
          size: 65,
        ),
        SizedBox(height: 4),
        Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 19,
          ),
        ),
      ],
    );
  }
}