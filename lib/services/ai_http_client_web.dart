import 'dart:convert';
import 'dart:html' as html;

Future<String> postJson(String url, Map<String, dynamic> body) async {
  final req = await html.HttpRequest.request(
    url,
    method: 'POST',
    sendData: jsonEncode(body),
    requestHeaders: {'Content-Type': 'application/json'},
  );
  final status = req.status ?? 0;
  final text = req.responseText ?? '';
  if (status < 200 || status >= 300) {
    throw Exception('HTTP $status: $text');
  }
  return text;
}
