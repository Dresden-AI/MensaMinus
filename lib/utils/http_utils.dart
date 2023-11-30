import 'package:http/http.dart' as http;

class HttpUtils {
  static Future<String> getResponse(Uri uri) async {
    var response = await http.get(uri);
    return response.body;
  }
}
