import 'package:fitness/models/muscle_group.dart';

class BodyPart {
  final String id;
  final String name;
  final String imageUrl; // Pexels URL for the body part
  final List<MuscleGroup> muscleGroups;

  BodyPart({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.muscleGroups,
  });
}
