import 'package:flutter/material.dart';
import 'package:fitness/models/workout_plan.dart';
import 'package:fitness/screens/exercise_detail_screen.dart';
import 'package:fitness/constants/app_theme.dart';

class WorkoutPlanDetailScreen extends StatelessWidget {
  final WorkoutPlan workoutPlan;

  const WorkoutPlanDetailScreen({super.key, required this.workoutPlan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(workoutPlan.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              workoutPlan.name,
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(color: AppColors.text),
            ),
            const SizedBox(height: 8),
            Text(
              workoutPlan.description.isNotEmpty
                  ? workoutPlan.description
                  : 'No description provided.',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 16),
            Text(
              'Created on: ${workoutPlan.createdAt.toLocal().toString().split(' ')[0]}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 24),
            Text(
              'Exercises (${workoutPlan.exercises.length}):',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(color: AppColors.text),
            ),
            const SizedBox(height: 12),
            workoutPlan.exercises.isEmpty
                ? Center(
                    child: Text(
                      'No exercises in this plan.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: workoutPlan.exercises.length,
                    itemBuilder: (context, index) {
                      final exercise = workoutPlan.exercises[index];
                      return Card(
                        elevation: 2,
                        margin: const EdgeInsets.symmetric(vertical: 6.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(6.0),
                            child: Image.network(
                              exercise.thumbnailUrl,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(
                                    width: 50,
                                    height: 50,
                                    color: AppColors.surface,
                                    child: const Icon(
                                      Icons.broken_image,
                                      color: AppColors.textSecondary,
                                      size: 30,
                                    ),
                                  ),
                            ),
                          ),
                          title: Text(
                            exercise.name,
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(color: AppColors.text),
                          ),
                          subtitle: Text(
                            exercise.equipment.join(', '),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          trailing: const Icon(
                            Icons.play_circle_fill,
                            color: AppColors.primary,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ExerciseDetailScreen(exercise: exercise),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
