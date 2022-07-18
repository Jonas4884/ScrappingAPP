import 'dart:developer';

import 'package:http/http.dart' as http;

const String joburl =
    "https://www.portaljob-madagascar.com/emploi/liste/secteur/informatique-web/page/1";

class HttpService {
  static Future<String?> get() async {
    try {
      final response = await http.get(Uri.parse(joburl));

      if (response.statusCode == 200) return response.body;
    } catch (e) {
      log('HttpService $e');
    }
    return null;
  }
}
