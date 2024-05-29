import 'package:consultation_heating/data/settings_data.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../functions/save_settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String selectedUnit = '°C'; // Default selected unit
  String selectedCountry = 'United States'; // Default selected country

  late TextEditingController wifiNameController;
  late TextEditingController wifiPasswordController;
  late TextEditingController btcWalletController;
  late TextEditingController countryCodeController;
  late TextEditingController zipCodeController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Initialize controllers and load initial settings from JSON file
    wifiNameController = TextEditingController();
    wifiPasswordController = TextEditingController();
    btcWalletController = TextEditingController();
    countryCodeController = TextEditingController();
    zipCodeController = TextEditingController();

    // Load initial settings from SharedPreferences and set them in the TextEditingControllers
    loadInitialSettings();

  }

  // Function to load initial settings from SharedPreferences
  void loadInitialSettings() async {
    final settings = await getSettings();
    setState(() {
      wifiNameController.text = settings.wifiName;
      wifiPasswordController.text = settings.wifiPassword;
      btcWalletController.text = settings.btcWallet;
      selectedCountry = settings.countryCode;
      zipCodeController.text = settings.zipCode;
      selectedUnit = settings.selectedUnit;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // Dispose of controllers to prevent memory leaks
    wifiNameController.dispose();
    wifiPasswordController.dispose();
    btcWalletController.dispose();
    countryCodeController.dispose();
    zipCodeController.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
        color: kWhiteColor,
        margin: EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20),
        child: Material(
          elevation: 10,
          child: Container(
            padding: EdgeInsets.only(left: 30,right: 30,bottom: 10,top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //settings text
                Text(
                  'Settings',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15.0),
                //textfields
                buildTextField(kController: wifiNameController,label: 'WIFI Name', hintText: 'wifi_123',inputType: TextInputType.text),
                buildTextField(kController: wifiPasswordController,label: 'Wifi Password', hintText: '*******',inputType: TextInputType.visiblePassword,kobscureText: true),
                buildTextField(kController: btcWalletController,label: 'BTC Wallet', hintText: '1a1923WeQ2HgY6TY58I9K1Ha',inputType: TextInputType.text),

                //Country dropdown
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Country',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: kTextGrayColor),
                    ),
                    SizedBox(height: 2,),
                    DropdownButtonFormField<String>(
                      value: selectedCountry,
                      items: [
                        DropdownMenuItem(
                          value: 'United States',
                          child: Text('United States'),
                        ),
                        DropdownMenuItem(
                          value: 'Canada',
                          child: Text('Canada'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedCountry = value!;
                        });
                      },
                      decoration: const InputDecoration(
                        // labelText: 'Country',
                        labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: kTextGrayColor),
                        hintText: 'Select a country',
                        hintStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: kTextGrayColor),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: kTextGrayColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: kGoldenColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0),
                  ],
                ),

                buildTextField(kController: zipCodeController,label: 'Zip Code', hintText: '22490',inputType: TextInputType.number),

                // Radio group for Units
                Text(
                  'Units:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: kTextGrayColor),
                ),
                Row(
                  children: [
                    Radio(
                      value: '°C',
                      activeColor: kGoldenColor,
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
                      value: '°F',
                      activeColor: kGoldenColor,
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

                    SizedBox(height: 15.0),

                    // Save Settings button
                    ElevatedButton(
                      onPressed: () async {
                        // Implement the action to save settings here
                        // Saving settings
                        final settingsToSave = SettingsData(
                          wifiName: wifiNameController.text,
                          wifiPassword: wifiPasswordController.text,
                          btcWallet: btcWalletController.text,
                          countryCode: selectedCountry,
                          zipCode: zipCodeController.text,
                          selectedUnit: selectedUnit,
                        );
                        await saveSettings(settingsToSave);

                        // Retrieving settings
                        final savedSettings = await getSettings();
                        print('WiFi Name: ${savedSettings.wifiName}');
                        print('WiFi Password: ${savedSettings.wifiPassword}');

                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(20),
                        backgroundColor: kGoldenColor, // Yellow background color
                      ),
                      child: Text('Save Settings',style: TextStyle(color: kBlackColor),),
                    ),

              ],
            ),
          ),
        )
    );
  }
}

Widget buildTextField({required TextEditingController kController,required String label, required String hintText,required TextInputType inputType,bool kobscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: kTextGrayColor),
      ),
      SizedBox(height: 2,),
      TextField(
        controller: kController,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400,color: kTextGrayColor),
        obscureText: kobscureText,
        obscuringCharacter: '*',
        keyboardType: inputType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w400,color: kTextGrayColor),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: kTextGrayColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: kGoldenColor), // kGolden border on focus
          ),
        ),
      ),
      SizedBox(height: 15.0),
    ],
  );
}
