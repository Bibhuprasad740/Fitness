import 'dart:convert';

import 'package:fitness/data/mock_data.dart';
import 'package:fitness/models/body_part.dart';
import 'package:fitness/models/muscle_group.dart';
import 'package:fitness/models/exercise.dart';
import 'package:fitness/models/workout_plan.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VideoService {
  static const String _prefsKey = 'workout_plans';

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

  final List<WorkoutPlan> _workoutPlans = [];

  List<WorkoutPlan> getWorkoutPlans() {
    return List.unmodifiable(_workoutPlans);
  }

  Future<List<WorkoutPlan>> loadWorkoutPlans() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_prefsKey);
    _workoutPlans.clear();
    if (jsonString == null || jsonString.isEmpty) {
      return getWorkoutPlans();
    }
    try {
      final List<dynamic> decoded = jsonDecode(jsonString) as List<dynamic>;
      _workoutPlans.addAll(decoded
          .map((e) => WorkoutPlan.fromJson(e as Map<String, dynamic>))
          .toList());
    } catch (_) {
      // If parsing fails, start fresh
    }
    return getWorkoutPlans();
  }

  Future<void> _persistWorkoutPlans() async {
    final prefs = await SharedPreferences.getInstance();
    final data = _workoutPlans.map((e) => e.toJson()).toList();
    await prefs.setString(_prefsKey, jsonEncode(data));
  }

  Future<void> addWorkoutPlan(WorkoutPlan plan) async {
    _workoutPlans.add(plan);
    await _persistWorkoutPlans();
  }

  Future<void> removeWorkoutPlan(String planId) async {
    _workoutPlans.removeWhere((plan) => plan.id == planId);
    await _persistWorkoutPlans();
  }
}
