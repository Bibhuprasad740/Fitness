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

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      id: json['id'] as String,
      name: json['name'] as String,
      videoUrl: json['videoUrl'] as String? ?? '',
      thumbnailUrl: json['thumbnailUrl'] as String? ?? '',
      description: json['description'] as String? ??
          'A great exercise to build strength and endurance.',
      equipment: (json['equipment'] as List?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'videoUrl': videoUrl,
      'thumbnailUrl': thumbnailUrl,
      'description': description,
      'equipment': equipment,
    };
  }
}
