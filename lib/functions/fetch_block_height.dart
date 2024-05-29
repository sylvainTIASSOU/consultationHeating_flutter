import 'package:http/http.dart' as http;

Future<int> fetchBlockHeightValue() async {
  final url = Uri.parse('https://blockchain.info/q/getblockcount');

  try {
    final response = await http.get(
        url
    );

    if (response.statusCode == 200) {
      // print(response.body);
      int blockHeight =int.parse(response.body) + 1;
      return blockHeight;
    } else {
      throw Exception('Failed to load data');
    }
  } catch (error) {
    throw Exception('Error: $error');
  }
}
