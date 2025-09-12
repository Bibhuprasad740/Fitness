class Exercise {
  final String id;
  final String name;
  final String videoUrl; // URL to the 7-15 second video
  final String thumbnailUrl; // Pexels URL for the video thumbnail
  final String description;
  final List<String> equipment; // e.g., "Dumbbells", "Barbell", "Bodyweight"

  Exercise({
    required this.id,
    required this.name,
    required this.videoUrl,
    required this.thumbnailUrl,
    this.description = 'A great exercise to build strength and endurance.',
    this.equipment = const [],
  });
}
