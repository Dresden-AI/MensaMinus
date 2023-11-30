import 'package:http/http.dart' as http;

class HttpUtils {
  /// Creates a GET request to the provided URI and returns the response asynchronously
  static Future<String> getResponse(Uri uri) async {
    var response = await http.get(uri);
    return response.body;
  }
}
