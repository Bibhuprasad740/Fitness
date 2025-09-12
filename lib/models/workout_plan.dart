import 'package:fitness/models/exercise.dart';

class WorkoutPlan {
  final String id;
  final String name;
  final String description;
  final List<Exercise> exercises;
  final DateTime createdAt;

  WorkoutPlan({
    required this.id,
    required this.name,
    this.description = '',
    required this.exercises,
    required this.createdAt,
  });

  factory WorkoutPlan.fromJson(Map<String, dynamic> json) {
    return WorkoutPlan(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      exercises: (json['exercises'] as List?)
              ?.map((e) => Exercise.fromJson(e as Map<String, dynamic>))
              .toList() ??
          <Exercise>[],
      createdAt: DateTime.tryParse(json['createdAt'] as String? ?? '') ??
          DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'exercises': exercises.map((e) => e.toJson()).toList(),
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
