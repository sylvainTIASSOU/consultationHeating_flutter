import 'dart:convert';
import 'dart:io';

import '../data/settings_data.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<void> saveSettings(SettingsData settings) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.setString('wifiName', settings.wifiName);
  await sharedPreferences.setString('wifiPassword', settings.wifiPassword);
  await sharedPreferences.setString('btcWallet', settings.btcWallet);
  await sharedPreferences.setString('countryCode', settings.countryCode);
  await sharedPreferences.setString('zipCode', settings.zipCode);
  await sharedPreferences.setString('selectedUnit', settings.selectedUnit);
  print('Settings saved successfully.');
}
Future<SettingsData> getSettings() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  return SettingsData(
    wifiName: sharedPreferences.getString('wifiName') ?? '',
    wifiPassword: sharedPreferences.getString('wifiPassword') ?? '',
    btcWallet: sharedPreferences.getString('btcWallet') ?? '',
    countryCode: sharedPreferences.getString('countryCode') ?? 'United States',
    zipCode: sharedPreferences.getString('zipCode') ?? '',
    selectedUnit: sharedPreferences.getString('selectedUnit') ?? '°C',
  );
}

