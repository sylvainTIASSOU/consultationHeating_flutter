import '../widgets/bottom_reusable_row_home_screen.dart';
import '../widgets/manual_mode_modal.dart';
import '../widgets/operating_mode_container.dart';

import '../../constants.dart';

import 'package:flutter/material.dart';

import '../widgets/half_circular_progress_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController poolTemp = TextEditingController();

  final TextEditingController coolantTemp = TextEditingController();

  final TextEditingController hashRate = TextEditingController();

  final poolTempmaxValue = 40.0;
  final poolTempCurrentValue = 0.0;
  final coolantTempMaxValue=40.0;
  final coolantTempCurrentValue=0.0;

  int selectedOperatingModeIndex = 0;  // Initially no item is selected

  void updateSelectedIndex(int index) {
    setState(() {
      if (selectedOperatingModeIndex == index) {
        selectedOperatingModeIndex = -1; // Deselect if already selected
      } else {
        selectedOperatingModeIndex = index; // Select the current item
      }
    });
  }

  void _showManualModeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white.withOpacity(.1),
          content: ManualModeModal(
            onClose: () {
              setState(() {
                Navigator.pop(context); // Close the dialog and deselect the mode
                selectedOperatingModeIndex = 2;
              }); // Close the AlertDialog
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhiteColor,
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Column(
            children: [
              //Operating Mode Container
              Material(
                elevation: 10,
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Operating Mode',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 200,
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //ECO container
                            OperatingModeContainer(
                              onImagePath: 'assets/Icon=ECO, Color=on.png',
                              offImagePath: 'assets/Icon=ECO, Color=off.png',
                              text: 'ECO',
                              isSelected: selectedOperatingModeIndex == 0,
                              onTap: () => updateSelectedIndex(0),
                            ),
                            //Performance Container
                            OperatingModeContainer(
                              onImagePath:
                                  'assets/Icon=Performance, Color=on.png',
                              offImagePath:
                                  'assets/Icon=Performance, Color=off.png',
                              text: 'Performance',
                              isSelected: selectedOperatingModeIndex == 1,
                              onTap: () => updateSelectedIndex(1),
                            ),
                            //Manual Container
                            OperatingModeContainer(
                              onImagePath: 'assets/Icon=manual, Color=on.png',
                              offImagePath: 'assets/Icon=manual, Color=off.png',
                              text: 'Manual',
                              isSelected: selectedOperatingModeIndex == 2,
                              onTap: () => _showManualModeDialog(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        //pool and coolant temp container
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Material(
                              elevation: 10,
                              child: Container(
                                height: 230,
                                width:
                                    MediaQuery.of(context).size.width * 0.375,
                                margin: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Pool Temp',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    //half circular bar
                                    Center(
                                      child: HalfCircularProgressBar(
                                        minValue: 0,
                                        maxValue: poolTempmaxValue,
                                        currentValue: poolTempCurrentValue,
                                        barWidth: 30.0,
                                        backgroundColor: kLightGrayColor,
                                        progressBarColor:
                                            poolTempCurrentValue / poolTempmaxValue >
                                                    0.5
                                                ? kOrangeColor
                                                : kGreenColor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Material(
                              elevation: 10,
                              child: Container(
                                height: 230,
                                width:
                                    MediaQuery.of(context).size.width * 0.375,
                                margin: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'CoolantTemp',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    //half circular bar
                                    Center(
                                      child: HalfCircularProgressBar(
                                        minValue: 0,
                                        maxValue: coolantTempMaxValue,
                                        currentValue: coolantTempCurrentValue,
                                        barWidth: 30.0,
                                        backgroundColor: kLightGrayColor,
                                        progressBarColor: coolantTempCurrentValue / coolantTempMaxValue >
                                            0.5
                                            ? kOrangeColor
                                            : kGreenColor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        //last row. power consumption, hashrate containers ... row
                        Row(
                          children: [
                            Material(
                              elevation: 10,
                              child: Container(
                                height: 120,
                                width: MediaQuery.of(context).size.width * 0.25,
                                margin: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Power Consumption',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(),
                                    ),
                                    BottomReusableRow(
                                        icon: Icons.bolt,
                                        valueText: '4.216',
                                        unitText: 'w')
                                  ],
                                ),
                              ),
                            ),
                            Expanded(child: Container()),
                            Material(
                              elevation: 10,
                              child: Container(
                                height: 120,
                                width: MediaQuery.of(context).size.width * 0.25,
                                margin: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Hash Rate',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(),
                                    ),
                                    BottomReusableRow(
                                        icon: Icons.numbers,
                                        valueText: '87',
                                        unitText: 'TH/S')
                                  ],
                                ),
                              ),
                            ),
                            Expanded(child: Container()),
                            Material(
                              elevation: 10,
                              child: Container(
                                height: 120,
                                width: MediaQuery.of(context).size.width * 0.25,
                                margin: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Pool status',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(),
                                    ),
                                    BottomReusableRow(
                                        icon: Icons.wifi_tethering,
                                        valueText: 'On',
                                        unitText: '')
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
            ],
          )
        ],
      ),
    );
  }
}
