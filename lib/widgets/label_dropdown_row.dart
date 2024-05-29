import 'package:flutter/material.dart';

import '../constants.dart';
class LabelDropdownRow extends StatefulWidget {
  final String label;
  final List<String> options;
  final String defaultValue;
  final void Function(String) onChanged;

  const LabelDropdownRow({
    Key? key,
    required this.label,
    required this.options,
    required this.defaultValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  _LabelDropdownRowState createState() => _LabelDropdownRowState();
}

class _LabelDropdownRowState extends State<LabelDropdownRow> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.defaultValue;
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
              DropdownButton<String>(
                value: dropdownValue,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                    widget.onChanged(newValue);
                  });
                },
                items: widget.options.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: TextStyle(color: kWhiteColor),),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}