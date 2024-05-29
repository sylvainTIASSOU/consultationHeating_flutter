import 'dart:convert';
import 'package:http/http.dart' as http;

Future<double> fetchBitcoinValue() async {
  final url = Uri.parse('https://api.blockchain.com/v3/exchange/tickers/BTC-USD');

  try {
    final response = await http.get(
      url
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final lastValue = jsonResponse['last_trade_price'] as double;
      return lastValue;
    } else {
      throw Exception('Failed to load data');
    }
  } catch (error) {
    throw Exception('Error: $error');
  }
}
