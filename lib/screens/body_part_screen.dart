import 'package:flutter/material.dart';
import 'package:fitness/models/body_part.dart';
import 'package:fitness/screens/muscle_group_screen.dart';
import 'package:fitness/constants/app_theme.dart';

class BodyPartScreen extends StatelessWidget {
  final BodyPart bodyPart;

  const BodyPartScreen({super.key, required this.bodyPart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(bodyPart.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Muscle Groups for ${bodyPart.name}',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(color: AppColors.text),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: bodyPart.muscleGroups.length,
                itemBuilder: (context, index) {
                  final muscleGroup = bodyPart.muscleGroups[index];
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
                      title: Text(
                        muscleGroup.name,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(color: AppColors.text),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.textSecondary,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MuscleGroupScreen(
                              bodyPart: bodyPart,
                              muscleGroup: muscleGroup,
                            ),
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
