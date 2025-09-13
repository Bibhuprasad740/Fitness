import 'dart:convert';
import 'dart:io';

Future<String> postJson(String url, Map<String, dynamic> body) async {
  final uri = Uri.parse(url);
  final client = HttpClient();
  try {
    final request = await client.postUrl(uri);
    request.headers.contentType = ContentType('application', 'json', charset: 'utf-8');
    request.add(utf8.encode(jsonEncode(body)));
    final response = await request.close();
    final responseText = await utf8.decoder.bind(response).join();
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw HttpException('HTTP ${response.statusCode}: $responseText');
    }
    return responseText;
  } finally {
    client.close(force: true);
  }
}
