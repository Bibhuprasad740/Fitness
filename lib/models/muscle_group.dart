import 'package:fitness/models/exercise.dart';

class MuscleGroup {
  final String id;
  final String name;
  final List<Exercise> exercises;

  MuscleGroup({required this.id, required this.name, required this.exercises});
}
