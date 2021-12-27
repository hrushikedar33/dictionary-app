import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class DictionaryApi {
  static const baseUrl = "https://owlbot.info/api/v4/dictionary/";

  static Future<http.Response> getRequest(endpoint) async {
    http.Response response;

    final url = Uri.parse("$baseUrl$endpoint");
    final String? _token = dotenv.env['token'];

    try {
      response =
          await http.get(url, headers: {"Authorization": "Token " + _token!});
    } on Exception catch (e) {
      throw e;
    }

    return response;
  }
}
