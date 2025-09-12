import 'package:flutter/material.dart';
import 'package:fitness/services/video_service.dart';
import 'package:fitness/models/workout_plan.dart';
import 'package:fitness/screens/workout_plan_builder_screen.dart';
import 'package:fitness/screens/workout_plan_detail_screen.dart';
import 'package:fitness/constants/app_theme.dart';

class WorkoutPlanListScreen extends StatefulWidget {
  final VideoService videoService;

  const WorkoutPlanListScreen({super.key, required this.videoService});

  @override
  State<WorkoutPlanListScreen> createState() => _WorkoutPlanListScreenState();
}

class _WorkoutPlanListScreenState extends State<WorkoutPlanListScreen> {
  List<WorkoutPlan> _workoutPlans = [];

  @override
  void initState() {
    super.initState();
    _loadWorkoutPlans();
  }

  Future<void> _loadWorkoutPlans() async {
    await widget.videoService.loadWorkoutPlans();
    if (!mounted) return;
    setState(() {
      _workoutPlans = widget.videoService.getWorkoutPlans();
    });
  }

  void _navigateToWorkoutPlanBuilder() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            WorkoutPlanBuilderScreen(videoService: widget.videoService),
      ),
    );
    if (result == true) {
      _loadWorkoutPlans(); // Refresh list if a new plan was created
    }
  }

  Future<void> _deleteWorkoutPlan(String planId) async {
    await widget.videoService.removeWorkoutPlan(planId);
    await _loadWorkoutPlans();
    if (!mounted) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Workout plan deleted!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _workoutPlans.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.assignment_outlined,
                            size: 80,
                            color: AppColors.textSecondary.withOpacity(0.5),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No workout plans yet!',
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(color: AppColors.textSecondary),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Start building your first plan.',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: AppColors.textSecondary),
                          ),
                          const SizedBox(height: 24),
                          ElevatedButton.icon(
                            onPressed: _navigateToWorkoutPlanBuilder,
                            icon: const Icon(Icons.add),
                            label: const Text('Create New Plan'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.accent,
                              foregroundColor: AppColors.text,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: _workoutPlans.length,
                      itemBuilder: (context, index) {
                        final plan = _workoutPlans[index];
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
                              plan.name,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(color: AppColors.text),
                            ),
                            subtitle: Text(
                              '${plan.exercises.length} exercises',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: AppColors.error,
                              ),
                              onPressed: () => _deleteWorkoutPlan(plan.id),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WorkoutPlanDetailScreen(
                                    workoutPlan: plan,
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
      floatingActionButton: _workoutPlans.isNotEmpty
          ? FloatingActionButton(
              onPressed: _navigateToWorkoutPlanBuilder,
              backgroundColor: AppColors.accent,
              child: const Icon(Icons.add),
            )
          : null, // Hide FAB if no plans and the "Create New Plan" button is shown
    );
  }
}
