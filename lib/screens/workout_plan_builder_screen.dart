import 'package:flutter/material.dart';
import 'package:fitness/services/video_service.dart';
import 'package:fitness/models/body_part.dart';
import 'package:fitness/models/muscle_group.dart';
import 'package:fitness/models/exercise.dart';
import 'package:fitness/models/workout_plan.dart';
import 'package:fitness/constants/app_theme.dart';
import 'package:uuid/uuid.dart'; // For generating unique IDs

class WorkoutPlanBuilderScreen extends StatefulWidget {
  final VideoService videoService;

  const WorkoutPlanBuilderScreen({super.key, required this.videoService});

  @override
  State<WorkoutPlanBuilderScreen> createState() =>
      _WorkoutPlanBuilderScreenState();
}

class _WorkoutPlanBuilderScreenState extends State<WorkoutPlanBuilderScreen> {
  final TextEditingController _planNameController = TextEditingController();
  final TextEditingController _planDescriptionController =
      TextEditingController();
  BodyPart? _selectedBodyPart;
  MuscleGroup? _selectedMuscleGroup;
  List<Exercise> _availableExercises = [];
  final List<Exercise> _selectedExercises = [];
  final Uuid _uuid = const Uuid();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _planNameController.dispose();
    _planDescriptionController.dispose();
    super.dispose();
  }

  void _onBodyPartSelected(BodyPart? bodyPart) {
    setState(() {
      _selectedBodyPart = bodyPart;
      _selectedMuscleGroup = null; // Reset muscle group when body part changes
      _availableExercises = []; // Clear exercises
    });
  }

  void _onMuscleGroupSelected(MuscleGroup? muscleGroup) {
    setState(() {
      _selectedMuscleGroup = muscleGroup;
      _availableExercises = muscleGroup?.exercises ?? [];
    });
  }

  void _toggleExerciseSelection(Exercise exercise) {
    setState(() {
      if (_selectedExercises.contains(exercise)) {
        _selectedExercises.remove(exercise);
      } else {
        _selectedExercises.add(exercise);
      }
    });
  }

  Future<void> _saveWorkoutPlan() async {
    if (_planNameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a plan name.')),
      );
      return;
    }
    if (_selectedExercises.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least one exercise.')),
      );
      return;
    }

    final newPlan = WorkoutPlan(
      id: _uuid.v4(),
      name: _planNameController.text,
      description: _planDescriptionController.text,
      exercises: List.from(_selectedExercises),
      createdAt: DateTime.now(),
    );

    await widget.videoService.addWorkoutPlan(newPlan);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${newPlan.name} created successfully!')),
    );
    Navigator.pop(
      context,
      true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Build Workout Plan')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Plan Details',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(color: AppColors.text),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _planNameController,
              decoration: const InputDecoration(
                labelText: 'Workout Plan Name',
                hintText: 'e.g., Full Body Blast, Leg Day',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _planDescriptionController,
              decoration: const InputDecoration(
                labelText: 'Description (Optional)',
                hintText: 'Briefly describe your plan',
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 24),
            Text(
              'Select Exercises',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(color: AppColors.text),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<BodyPart>(
              decoration: const InputDecoration(
                labelText: 'Body Part',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
              ),
              value: _selectedBodyPart,
              items: widget.videoService.getBodyParts().map((bp) {
                return DropdownMenuItem(value: bp, child: Text(bp.name));
              }).toList(),
              onChanged: _onBodyPartSelected,
              hint: const Text('Select a Body Part'),
              dropdownColor: AppColors.surface,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.text),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<MuscleGroup>(
              decoration: const InputDecoration(
                labelText: 'Muscle Group',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
              ),
              value: _selectedMuscleGroup,
              items:
                  _selectedBodyPart?.muscleGroups.map((mg) {
                    return DropdownMenuItem(value: mg, child: Text(mg.name));
                  }).toList() ??
                  [],
              onChanged: _onMuscleGroupSelected,
              hint: const Text('Select a Muscle Group'),
              disabledHint: const Text('Select a Body Part first'),
              dropdownColor: AppColors.surface,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.text),
            ),
            const SizedBox(height: 24),
            Text(
              'Available Exercises:',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(color: AppColors.text),
            ),
            const SizedBox(height: 12),
            _availableExercises.isEmpty
                ? Center(
                    child: Text(
                      _selectedMuscleGroup == null
                          ? 'Select a muscle group to see exercises.'
                          : 'No exercises found for this group.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _availableExercises.length,
                    itemBuilder: (context, index) {
                      final exercise = _availableExercises[index];
                      final isSelected = _selectedExercises.contains(exercise);
                      return Card(
                        elevation: 2,
                        margin: const EdgeInsets.symmetric(vertical: 6.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: isSelected
                              ? const BorderSide(
                                  color: AppColors.primary,
                                  width: 2,
                                )
                              : BorderSide.none,
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
                          trailing: Checkbox(
                            value: isSelected,
                            onChanged: (bool? value) {
                              _toggleExerciseSelection(exercise);
                            },
                            activeColor: AppColors.primary,
                            checkColor: AppColors.text,
                          ),
                          onTap: () => _toggleExerciseSelection(exercise),
                        ),
                      );
                    },
                  ),
            const SizedBox(height: 24),
            Text(
              'Selected Exercises (${_selectedExercises.length}):',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(color: AppColors.text),
            ),
            const SizedBox(height: 12),
            _selectedExercises.isEmpty
                ? Center(
                    child: Text(
                      'No exercises selected yet.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _selectedExercises.length,
                    itemBuilder: (context, index) {
                      final exercise = _selectedExercises[index];
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
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.remove_circle_outline,
                              color: AppColors.error,
                            ),
                            onPressed: () => _toggleExerciseSelection(exercise),
                          ),
                        ),
                      );
                    },
                  ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _saveWorkoutPlan,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.text,
              ),
              child: const Text('Save Workout Plan'),
            ),
          ],
        ),
      ),
    );
  }
}
