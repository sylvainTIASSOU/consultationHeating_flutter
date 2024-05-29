import 'package:consultation_heating/constants.dart';
import 'package:flutter/material.dart';
class LabelIncrementField extends StatefulWidget {
  final String label;

  const LabelIncrementField({Key? key, required this.label}) : super(key: key);

  @override
  _LabelIncrementFieldState createState() => _LabelIncrementFieldState();
}

class _LabelIncrementFieldState extends State<LabelIncrementField> {
  int value = 20;

  void increment() {
    setState(() {
      value++;
    });
  }

  void decrement() {
    setState(() {
      if (value > 0) {
        value--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      child: Material(
        color: kBlackColor,
        elevation: 32.0,
        borderRadius: BorderRadius.circular(8.0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                widget.label,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: kWhiteColor),
              ),
              SizedBox(width: 100.0),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_upward, color: kWhiteColor),
                    onPressed: increment,
                  ),
                  SizedBox(width: 10,),
                  Text(
                    value.toString(),
                    style: TextStyle(fontSize: 16.0, color: kWhiteColor),
                  ),
                  SizedBox(width: 10,),
                  IconButton(
                    icon: Icon(Icons.arrow_downward,  color: kWhiteColor),
                    onPressed: decrement,
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