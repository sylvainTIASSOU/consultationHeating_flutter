import 'package:consultation_heating/constants.dart';
import 'package:flutter/material.dart';

class ManualModeModal extends StatefulWidget {
  final VoidCallback onClose;
  const ManualModeModal({super.key, required this.onClose});

  @override
  _ManualModeModalState createState() => _ManualModeModalState();
}

class _ManualModeModalState extends State<ManualModeModal> {
  double temperatureValue = 20.0; // Initial temperature value
  String selectedUnit = '°C'; // Initial temperature unit

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 4.0,
      backgroundColor: Colors.white,
      child: Container(
        height: 250,
        width: 300,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Modal Heading
            Text(
              'Set Temperature',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            // temp inc, dec container
            Container(
              height: 70,
              decoration: BoxDecoration(
                border: Border.all(color: kLightGrayColor)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // + icon
                  Container(
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                        border: Border.all(color: kLightGrayColor),
                      color: kGoldenColor
                    ),
                    child: IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          temperatureValue--;
                        });
                      },
                    ),
                  ),
                  //Temp Value
                  Text(
                    '$temperatureValue',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // + icon
                  Container(
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                        border: Border.all(color: kLightGrayColor),
                      color: kGoldenColor,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          temperatureValue++;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            // F and C radio buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio(
                  activeColor: kGoldenColor,
                  value: '°C',
                  groupValue: selectedUnit,
                  onChanged: (value) {
                    setState(() {
                      selectedUnit = value.toString();
                    });
                  },
                ),
                Text('°C'),
                SizedBox(width: 20,),
                Radio(
                  activeColor: kGoldenColor,
                  value: '°F',
                  groupValue: selectedUnit,
                  onChanged: (value) {
                    setState(() {
                      selectedUnit = value.toString();
                    });
                  },
                ),
                Text('°F'),
              ],
            ),
            SizedBox(height: 16),
            // Save Button
            Center(
              child: Container(
                width: double.maxFinite,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kGoldenColor,
                  ),
                  onPressed: widget.onClose,
                  child: Text('Save and Update',style: TextStyle(color: Colors.black),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
