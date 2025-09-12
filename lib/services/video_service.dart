import 'package:fitness/data/mock_data.dart';
import 'package:fitness/models/body_part.dart';
import 'package:fitness/models/muscle_group.dart';
import 'package:fitness/models/exercise.dart';
import 'package:fitness/models/workout_plan.dart';

class VideoService {
  List<BodyPart> getBodyParts() {
    return MockData.bodyParts;
  }

  BodyPart? getBodyPartById(String id) {
    try {
      return MockData.bodyParts.firstWhere((bp) => bp.id == id);
    } catch (e) {
      return null;
    }
  }

  MuscleGroup? getMuscleGroupById(String bodyPartId, String muscleGroupId) {
    final bodyPart = getBodyPartById(bodyPartId);
    if (bodyPart == null) return null;
    try {
      return bodyPart.muscleGroups.firstWhere((mg) => mg.id == muscleGroupId);
    } catch (e) {
      return null;
    }
  }

  Exercise? getExerciseById(
    String bodyPartId,
    String muscleGroupId,
    String exerciseId,
  ) {
    final muscleGroup = getMuscleGroupById(bodyPartId, muscleGroupId);
    if (muscleGroup == null) return null;
    try {
      return muscleGroup.exercises.firstWhere((ex) => ex.id == exerciseId);
    } catch (e) {
      return null;
    }
  }

  // In-memory storage for workout plans for demonstration
  final List<WorkoutPlan> _workoutPlans = [];

  List<WorkoutPlan> getWorkoutPlans() {
    return List.unmodifiable(_workoutPlans);
  }

  void addWorkoutPlan(WorkoutPlan plan) {
    _workoutPlans.add(plan);
  }

  void removeWorkoutPlan(String planId) {
    _workoutPlans.removeWhere((plan) => plan.id == planId);
  }
}
