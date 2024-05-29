import 'package:http/http.dart' as http;

Future<String> fetchNetworkDifficultyValue() async {
  final url = Uri.parse('https://blockchain.info/q/getdifficulty');

  try {
    final response = await http.get(
        url
    );

    if (response.statusCode == 200) {
      // print(response.body);
      String networkDifficulty =response.body.substring(0,5);
      double decimalFix = double.parse(networkDifficulty)*10;
      String result = decimalFix.toStringAsFixed(2);
      return result;
    } else {
      throw Exception('Failed to load data');
    }
  } catch (error) {
    throw Exception('Error: $error');
  }
}
