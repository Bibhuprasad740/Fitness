import 'package:flutter/material.dart';
import 'package:fitness/services/video_service.dart';
import 'package:fitness/services/ai_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fitness/models/workout_plan.dart';
import 'package:fitness/screens/workout_plan_builder_screen.dart';
import 'package:fitness/screens/workout_plan_detail_screen.dart';
import 'package:fitness/constants/app_theme.dart';
import 'package:uuid/uuid.dart' show Uuid;

class WorkoutPlanListScreen extends StatefulWidget {
  final VideoService videoService;

  const WorkoutPlanListScreen({super.key, required this.videoService});

  @override
  State<WorkoutPlanListScreen> createState() => _WorkoutPlanListScreenState();
}

class _WorkoutPlanListScreenState extends State<WorkoutPlanListScreen> {
  final AIService _aiService = AIService();
  final _uuid = const Uuid();
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
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Workout plan deleted!')));
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
                          const SizedBox(height: 12),
                          OutlinedButton.icon(
                            onPressed: _showGeminiDialog,
                            icon: const Icon(Icons.auto_awesome),
                            label: const Text('Create with AI'),
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
              onPressed: _showCreateOptions,
              backgroundColor: AppColors.accent,
              child: const Icon(Icons.add),
            )
          : null,
    );
  }

  void _showCreateOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.build, color: AppColors.text),
                title: const Text('Build Manually'),
                onTap: () {
                  Navigator.pop(ctx);
                  _navigateToWorkoutPlanBuilder();
                },
              ),
              ListTile(
                leading: const Icon(Icons.auto_awesome, color: AppColors.text),
                title: const Text('Create with AI (Gemini)'),
                onTap: () {
                  Navigator.pop(ctx);
                  _showGeminiDialog();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showGeminiDialog() async {
    final prefs = await SharedPreferences.getInstance();
    String apiKey = prefs.getString('gemini_api_key') ?? '';
    bool remember = apiKey.isNotEmpty;

    final planNameController = TextEditingController(
      text: 'AI Plan ${DateTime.now().toLocal().toString().split(' ').first}',
    );
    final goalController = TextEditingController(
      text: 'Build muscle and strength',
    );
    final daysController = TextEditingController(text: '3');
    final weeksController = TextEditingController(text: '6');
    final apiKeyController = TextEditingController(text: apiKey);
    String experience = 'Beginner';

    await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Create Plan with AI'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: planNameController,
                      decoration: const InputDecoration(labelText: 'Plan Name'),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: goalController,
                      decoration: const InputDecoration(labelText: 'Goal'),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: daysController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Days/Week',
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            controller: weeksController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Duration (weeks)',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<String>(
                      value: experience,
                      items: const [
                        DropdownMenuItem(
                          value: 'Beginner',
                          child: Text('Beginner'),
                        ),
                        DropdownMenuItem(
                          value: 'Intermediate',
                          child: Text('Intermediate'),
                        ),
                        DropdownMenuItem(
                          value: 'Advanced',
                          child: Text('Advanced'),
                        ),
                      ],
                      onChanged: (v) =>
                          setState(() => experience = v ?? 'Beginner'),
                      decoration: const InputDecoration(
                        labelText: 'Experience Level',
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: apiKeyController,
                      onChanged: (v) => apiKey = v,
                      decoration: const InputDecoration(
                        labelText: 'Gemini API Key',
                        hintText: 'Enter your Google Gemini API key',
                      ),
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                    ),
                    const SizedBox(height: 8),
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Remember API Key on this device'),
                      value: remember,
                      onChanged: (v) => setState(() => remember = v),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    if (apiKey.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter your Gemini API key.'),
                        ),
                      );
                      return;
                    }
                    final days = int.tryParse(daysController.text.trim()) ?? 3;
                    final weeks =
                        int.tryParse(weeksController.text.trim()) ?? 6;

                    Navigator.pop(context);

                    try {
                      final plan = await _aiService.generateWorkoutPlan(
                        apiKey: apiKey.trim(),
                        planName: planNameController.text.trim(),
                        goal: goalController.text.trim(),
                        daysPerWeek: days,
                        durationWeeks: weeks,
                        experienceLevel: experience,
                      );
                      await widget.videoService.addWorkoutPlan(plan);
                      if (remember) {
                        await prefs.setString('gemini_api_key', apiKey.trim());
                      }
                      await _loadWorkoutPlans();
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${plan.name} created with AI.'),
                        ),
                      );
                    } catch (e) {
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Failed to create plan: $e')),
                      );
                    }
                  },
                  icon: const Icon(Icons.auto_awesome),
                  label: const Text('Generate'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
