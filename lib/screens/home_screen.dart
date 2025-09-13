import 'package:flutter/material.dart';

import '../constants/app_theme.dart';
import '../models/body_part.dart';
import '../services/video_service.dart';
import 'body_part_screen.dart';
import 'workout_plan_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final VideoService _videoService = VideoService();
  late List<BodyPart> _bodyParts;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _bodyParts = _videoService.getBodyParts();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Fitness Journey',
          style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.text),
        ),
        backgroundColor: AppColors.surface,
        elevation: 0,
        actions:
            _selectedIndex ==
                1 // Only show search on Exercises tab
            ? [
                IconButton(
                  icon: Icon(Icons.search, color: AppColors.textSecondary),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Search functionality coming soon!'),
                      ),
                    );
                  },
                ),
              ]
            : null,
      ),
      body: _buildCurrentScreen(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildCurrentScreen() {
    switch (_selectedIndex) {
      case 0:
        return WorkoutPlanListScreen(videoService: _videoService);
      case 1:
        return _buildBodyPartsGrid(context);
      default:
        return _buildBodyPartsGrid(context);
    }
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          label: 'My Plans',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fitness_center),
          label: 'Exercises',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textSecondary,
      backgroundColor: AppColors.surface,
      elevation: 8,
      type: BottomNavigationBarType.fixed,
      onTap: _onItemTapped,
    );
  }

  Widget _buildBodyPartsGrid(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Body Parts',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppColors.text,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Select an area to train',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 0.85,
              ),
              itemCount: _bodyParts.length,
              itemBuilder: (context, index) {
                final bodyPart = _bodyParts[index];
                return _BodyPartCard(
                  bodyPart: bodyPart,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BodyPartScreen(bodyPart: bodyPart),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _BodyPartCard extends StatelessWidget {
  final BodyPart bodyPart;
  final VoidCallback onTap;

  const _BodyPartCard({required this.bodyPart, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              // Background Image with dark overlay
              _buildImageWithOverlay(),

              // Content
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      bodyPart.name,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.text,
                        fontWeight: FontWeight.w600,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 4,
                            offset: const Offset(1, 1),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          '${bodyPart.muscleGroups.length} muscle groups',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: AppColors.textSecondary),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 16,
                          color: AppColors.primary,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageWithOverlay() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          bodyPart.imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            color: AppColors.surface,
            child: Icon(
              Icons.fitness_center,
              color: AppColors.primary,
              size: 40,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
              stops: const [0.4, 1.0],
            ),
          ),
        ),
      ],
    );
  }
}
