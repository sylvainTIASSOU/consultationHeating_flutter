class SettingsData {
  String wifiName;
  String wifiPassword;
  String btcWallet;
  String countryCode;
  String zipCode;
  String selectedUnit;

  SettingsData({
    required this.wifiName,
    required this.wifiPassword,
    required this.btcWallet,
    required this.countryCode,
    required this.zipCode,
    required this.selectedUnit,
  });

  // Create a method to convert the object to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'wifiName': wifiName,
      'wifiPassword': wifiPassword,
      'btcWallet': btcWallet,
      'countryCode': countryCode,
      'zipCode': zipCode,
      'selectedUnit': selectedUnit,
    };
  }
}
