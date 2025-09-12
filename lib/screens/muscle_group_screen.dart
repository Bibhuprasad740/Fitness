import 'package:flutter/material.dart';
import 'package:fitness/models/body_part.dart';
import 'package:fitness/models/muscle_group.dart';
import 'package:fitness/screens/exercise_detail_screen.dart';
import 'package:fitness/constants/app_theme.dart';

class MuscleGroupScreen extends StatelessWidget {
  final BodyPart bodyPart;
  final MuscleGroup muscleGroup;

  const MuscleGroupScreen({
    super.key,
    required this.bodyPart,
    required this.muscleGroup,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${bodyPart.name} - ${muscleGroup.name}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Exercises for ${muscleGroup.name}',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(color: AppColors.text),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: muscleGroup.exercises.length,
                itemBuilder: (context, index) {
                  final exercise = muscleGroup.exercises[index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          exercise.thumbnailUrl,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                width: 60,
                                height: 60,
                                color: AppColors.surface,
                                child: const Icon(
                                  Icons.broken_image,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                        ),
                      ),
                      title: Text(
                        exercise.name,
                        style: Theme.of(context).textTheme.titleMedium
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
            ),
          ],
        ),
      ),
    );
  }
}
