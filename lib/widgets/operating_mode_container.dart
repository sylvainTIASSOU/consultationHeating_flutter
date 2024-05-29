// operating_mode_container.dart
import 'package:flutter/material.dart';
import '../constants.dart';

class OperatingModeContainer extends StatefulWidget {
  final String onImagePath; // Path for the "on" state
  final String offImagePath; // Path for the "off" state
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  OperatingModeContainer({
    required this.onImagePath,
    required this.offImagePath,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  _OperatingModeContainerState createState() => _OperatingModeContainerState();
}

class _OperatingModeContainerState extends State<OperatingModeContainer> {
  @override
  Widget build(BuildContext context) {
    final String currentImagePath =
    widget.isSelected ? widget.onImagePath : widget.offImagePath;

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 180,
        width: MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
          color: widget.isSelected? kGoldenColor:kWhiteColor,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: kLightGrayColor,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              currentImagePath,
              width: 100,
              height: 100,
            ),
            Text(
              widget.text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
