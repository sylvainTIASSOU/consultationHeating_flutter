import 'dart:convert';
import 'package:http/http.dart' as http;

Future<double> fetchBitcoinLastValue() async {
  final url = Uri.parse('https://apiv2.bitcoinaverage.com/indices/global/ticker/BTCUSD');

  try {
    final response = await http.get(
      url,
      headers: {
        'x-ba-key': 'MzY4MGUyOTNlMmFiNGE1NThiMWUxZmY0OWY2NzYxNDY',
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final lastValue = jsonResponse['last'] as double;
      return lastValue;
    } else {
      throw Exception('Failed to load data');
    }
  } catch (error) {
    throw Exception('Error: $error');
  }
}
