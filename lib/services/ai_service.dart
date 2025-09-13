import 'dart:convert';

import 'package:fitness/models/exercise.dart';
import 'package:fitness/models/workout_plan.dart';
import 'package:uuid/uuid.dart';
import 'package:fitness/services/ai_http_client_io.dart'
    if (dart.library.html) 'package:fitness/services/ai_http_client_web.dart';

class AIService {
  final _uuid = const Uuid();
  static const String _geminiBase =
      'https://generativelanguage.googleapis.com/v1beta/models';

  Future<WorkoutPlan> generateWorkoutPlan({
    required String apiKey,
    required String planName,
    required String goal,
    required int daysPerWeek,
    required int durationWeeks,
    required String experienceLevel,
    String model = 'gemini-1.5-flash',
  }) async {
    final prompt = _buildPrompt(
      planName: planName,
      goal: goal,
      daysPerWeek: daysPerWeek,
      durationWeeks: durationWeeks,
      experienceLevel: experienceLevel,
    );

    final url = '$_geminiBase/$model:generateContent?key=$apiKey';
    final body = {
      'contents': [
        {
          'parts': [
            {'text': prompt}
          ]
        }
      ]
    };

    final responseText = await postJson(url, body);
    final Map<String, dynamic> data = jsonDecode(responseText);
      final text = _extractTextFromGemini(data);
      final Map<String, dynamic> jsonPlan = _extractJsonObject(text);

      final name = (jsonPlan['name'] as String?)?.trim();
      final description = (jsonPlan['description'] as String?)?.trim() ?? '';
      final exercisesRaw = (jsonPlan['exercises'] as List?) ?? [];

      final exercises = exercisesRaw.map((e) {
        final map = (e as Map).cast<String, dynamic>();
        return Exercise(
          id: (map['id'] as String?)?.trim().isNotEmpty == true ? map['id'] : _uuid.v4(),
          name: (map['name'] as String? ?? '').trim(),
          videoUrl: (map['videoUrl'] as String? ?? '').trim(),
          thumbnailUrl: (map['thumbnailUrl'] as String? ?? '').trim(),
          description: (map['description'] as String? ?? '').trim(),
          equipment: ((map['equipment'] as List?) ?? [])
              .map((x) => (x as String).trim())
              .where((x) => x.isNotEmpty)
              .toList(),
        );
      }).where((ex) => ex.name.isNotEmpty).toList();

      return WorkoutPlan(
        id: _uuid.v4(),
        name: name?.isNotEmpty == true ? name! : planName,
        description: description,
        exercises: exercises,
        createdAt: DateTime.now(),
      );
  }

  String _buildPrompt({
    required String planName,
    required String goal,
    required int daysPerWeek,
    required int durationWeeks,
    required String experienceLevel,
  }) {
    return '''
You are a fitness coach. Create a concise workout plan as strict JSON only (no markdown).
The JSON must match this schema:
{
  "name": string,
  "description": string,
  "exercises": [
    {
      "id": string, // unique id string
      "name": string,
      "videoUrl": string, // direct mp4 or streaming URL if known, else empty string
      "thumbnailUrl": string, // image URL, else empty string
      "description": string,
      "equipment": [string]
    }
  ]
}

Constraints:
- Goal: $goal
- Experience level: $experienceLevel
- Days per week: $daysPerWeek
- Duration (weeks): $durationWeeks
- Provide 5-12 exercises total.
- Prefer common, safe exercises.
- Keep descriptions short (1-2 sentences).
- If you are unsure of media URLs, leave videoUrl/thumbnailUrl empty.

Plan name to use if you choose: "$planName".
Return JSON ONLY.''';
  }

  String _extractTextFromGemini(Map<String, dynamic> data) {
    final candidates = data['candidates'] as List?;
    if (candidates == null || candidates.isEmpty) {
      throw const FormatException('No candidates from Gemini');
    }
    final content = candidates.first['content'] as Map<String, dynamic>?;
    final parts = content?['parts'] as List?;
    if (parts == null || parts.isEmpty) {
      throw const FormatException('No parts in Gemini response');
    }
    final text = parts.first['text'] as String?;
    if (text == null || text.trim().isEmpty) {
      throw const FormatException('Empty Gemini text');
    }
    return text;
  }

  Map<String, dynamic> _extractJsonObject(String text) {
    // If code fences are present, extract content inside the first fence
    final fenceRegex = RegExp(r"```(?:json)?\s*([\s\S]*?)\s*```", multiLine: true);
    final match = fenceRegex.firstMatch(text);
    final raw = match != null ? match.group(1)! : text;

    // Try to locate first JSON object
    final start = raw.indexOf('{');
    final end = raw.lastIndexOf('}');
    if (start == -1 || end == -1 || end <= start) {
      throw const FormatException('No JSON object found in Gemini output');
    }
    final candidate = raw.substring(start, end + 1);
    return jsonDecode(candidate) as Map<String, dynamic>;
  }
}
