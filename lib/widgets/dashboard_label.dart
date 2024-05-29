import 'package:consultation_heating/constants.dart';
import 'package:flutter/material.dart';

class DashboardLabel extends StatelessWidget {
  final String text;
  final String value;
  final String trailingText;

  const DashboardLabel({Key? key, required this.text, required this.value, required this.trailingText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      width: 200,
      child: Card(
        color: kBlackColor,
        elevation: 32.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: TextStyle(fontSize: 13.0, color: kWhiteColor ),
              ),
              SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    value,
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: kWhiteColor),
                  ),
                  SizedBox(width: 4.0),
                  Text(
                    trailingText,
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: kWhiteColor),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}