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
}
