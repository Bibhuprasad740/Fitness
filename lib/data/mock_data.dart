import 'package:fitness/models/body_part.dart';
import 'package:fitness/models/muscle_group.dart';
import 'package:fitness/models/exercise.dart';

class MockData {
  static final List<BodyPart> bodyParts = [
    BodyPart(
      id: 'bp_legs',
      name: 'Legs',
      imageUrl:
          'https://images.pexels.com/photos/416778/pexels-photo-416778.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', // Pexels image for Legs
      muscleGroups: [
        MuscleGroup(
          id: 'mg_hamstrings',
          name: 'Hamstrings',
          exercises: [
            Exercise(
              id: 'ex_romanian_deadlift',
              name: 'Romanian Deadlift',
              videoUrl:
                  'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4', // Placeholder video
              thumbnailUrl:
                  'https://images.pexels.com/photos/4753996/pexels-photo-4753996.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              description:
                  'Targets hamstrings and glutes, focusing on hip hinge movement.',
              equipment: ['Barbell', 'Dumbbells'],
            ),
            Exercise(
              id: 'ex_leg_curl',
              name: 'Leg Curl',
              videoUrl:
                  'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4', // Placeholder video
              thumbnailUrl:
                  'https://images.pexels.com/photos/4754000/pexels-photo-4754000.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              description: 'Isolates the hamstrings for muscle growth.',
              equipment: ['Leg Curl Machine'],
            ),
          ],
        ),
        MuscleGroup(
          id: 'mg_quads',
          name: 'Quadriceps',
          exercises: [
            Exercise(
              id: 'ex_squats',
              name: 'Barbell Squats',
              videoUrl:
                  'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4', // Placeholder video
              thumbnailUrl:
                  'https://images.pexels.com/photos/4754001/pexels-photo-4754001.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              description:
                  'A fundamental exercise for overall leg development.',
              equipment: ['Barbell'],
            ),
            Exercise(
              id: 'ex_leg_extension',
              name: 'Leg Extension',
              videoUrl:
                  'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4', // Placeholder video
              thumbnailUrl:
                  'https://images.pexels.com/photos/4754002/pexels-photo-4754002.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              description: 'Targets the quadriceps in isolation.',
              equipment: ['Leg Extension Machine'],
            ),
          ],
        ),
        MuscleGroup(
          id: 'mg_calves',
          name: 'Calves',
          exercises: [
            Exercise(
              id: 'ex_calf_raises',
              name: 'Standing Calf Raises',
              videoUrl:
                  'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4', // Placeholder video
              thumbnailUrl:
                  'https://images.pexels.com/photos/4754003/pexels-photo-4754003.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              description: 'Strengthens the calf muscles.',
              equipment: ['Bodyweight', 'Dumbbells'],
            ),
          ],
        ),
      ],
    ),
    BodyPart(
      id: 'bp_chest',
      name: 'Chest',
      imageUrl:
          'https://images.pexels.com/photos/416778/pexels-photo-416778.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', // Pexels image for Chest
      muscleGroups: [
        MuscleGroup(
          id: 'mg_pecs',
          name: 'Pectorals',
          exercises: [
            Exercise(
              id: 'ex_bench_press',
              name: 'Barbell Bench Press',
              videoUrl:
                  'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4', // Placeholder video
              thumbnailUrl:
                  'https://images.pexels.com/photos/4754004/pexels-photo-4754004.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              description: 'Classic exercise for chest strength and size.',
              equipment: ['Barbell', 'Bench'],
            ),
            Exercise(
              id: 'ex_dumbbell_fly',
              name: 'Dumbbell Fly',
              videoUrl:
                  'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4', // Placeholder video
              thumbnailUrl:
                  'https://images.pexels.com/photos/4754005/pexels-photo-4754005.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              description:
                  'Targets the outer chest and provides a good stretch.',
              equipment: ['Dumbbells', 'Bench'],
            ),
          ],
        ),
      ],
    ),
    BodyPart(
      id: 'bp_back',
      name: 'Back',
      imageUrl:
          'https://images.pexels.com/photos/416778/pexels-photo-416778.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', // Pexels image for Back
      muscleGroups: [
        MuscleGroup(
          id: 'mg_lats',
          name: 'Lats',
          exercises: [
            Exercise(
              id: 'ex_pull_ups',
              name: 'Pull-ups',
              videoUrl:
                  'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4', // Placeholder video
              thumbnailUrl:
                  'https://images.pexels.com/photos/4754006/pexels-photo-4754006.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              description: 'Excellent bodyweight exercise for back width.',
              equipment: ['Pull-up Bar'],
            ),
            Exercise(
              id: 'ex_lat_pulldown',
              name: 'Lat Pulldown',
              videoUrl:
                  'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4', // Placeholder video
              thumbnailUrl:
                  'https://images.pexels.com/photos/4754007/pexels-photo-4754007.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              description: 'Machine-based exercise to target the lats.',
              equipment: ['Lat Pulldown Machine'],
            ),
          ],
        ),
        MuscleGroup(
          id: 'mg_traps',
          name: 'Traps',
          exercises: [
            Exercise(
              id: 'ex_shrugs',
              name: 'Barbell Shrugs',
              videoUrl:
                  'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4', // Placeholder video
              thumbnailUrl:
                  'https://images.pexels.com/photos/4754008/pexels-photo-4754008.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              description: 'Builds upper trap thickness.',
              equipment: ['Barbell'],
            ),
          ],
        ),
      ],
    ),
    BodyPart(
      id: 'bp_shoulders',
      name: 'Shoulders',
      imageUrl:
          'https://images.pexels.com/photos/416778/pexels-photo-416778.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', // Pexels image for Shoulders
      muscleGroups: [
        MuscleGroup(
          id: 'mg_deltoids',
          name: 'Deltoids',
          exercises: [
            Exercise(
              id: 'ex_overhead_press',
              name: 'Overhead Press',
              videoUrl:
                  'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4', // Placeholder video
              thumbnailUrl:
                  'https://images.pexels.com/photos/4754009/pexels-photo-4754009.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              description:
                  'Compound exercise for overall shoulder development.',
              equipment: ['Barbell', 'Dumbbells'],
            ),
            Exercise(
              id: 'ex_lateral_raises',
              name: 'Lateral Raises',
              videoUrl:
                  'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4', // Placeholder video
              thumbnailUrl:
                  'https://images.pexels.com/photos/4754010/pexels-photo-4754010.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              description: 'Isolates the side deltoids for wider shoulders.',
              equipment: ['Dumbbells'],
            ),
          ],
        ),
      ],
    ),
    BodyPart(
      id: 'bp_arms',
      name: 'Arms',
      imageUrl:
          'https://images.pexels.com/photos/416778/pexels-photo-416778.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', // Pexels image for Arms
      muscleGroups: [
        MuscleGroup(
          id: 'mg_biceps',
          name: 'Biceps',
          exercises: [
            Exercise(
              id: 'ex_bicep_curls',
              name: 'Dumbbell Bicep Curls',
              videoUrl:
                  'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4', // Placeholder video
              thumbnailUrl:
                  'https://images.pexels.com/photos/4754011/pexels-photo-4754011.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              description: 'Classic exercise for bicep development.',
              equipment: ['Dumbbells'],
            ),
          ],
        ),
        MuscleGroup(
          id: 'mg_triceps',
          name: 'Triceps',
          exercises: [
            Exercise(
              id: 'ex_tricep_extensions',
              name: 'Overhead Tricep Extension',
              videoUrl:
                  'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4', // Placeholder video
              thumbnailUrl:
                  'https://images.pexels.com/photos/4754012/pexels-photo-4754012.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              description: 'Targets all three heads of the triceps.',
              equipment: ['Dumbbell'],
            ),
          ],
        ),
      ],
    ),
    BodyPart(
      id: 'bp_core',
      name: 'Core',
      imageUrl:
          'https://images.pexels.com/photos/416778/pexels-photo-416778.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', // Pexels image for Core
      muscleGroups: [
        MuscleGroup(
          id: 'mg_abs',
          name: 'Abs',
          exercises: [
            Exercise(
              id: 'ex_crunches',
              name: 'Crunches',
              videoUrl:
                  'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4', // Placeholder video
              thumbnailUrl:
                  'https://images.pexels.com/photos/4754013/pexels-photo-4754013.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              description: 'Basic exercise for abdominal muscles.',
              equipment: ['Bodyweight'],
            ),
            Exercise(
              id: 'ex_plank',
              name: 'Plank',
              videoUrl:
                  'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4', // Placeholder video
              thumbnailUrl:
                  'https://images.pexels.com/photos/4754014/pexels-photo-4754014.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              description: 'Strengthens the entire core.',
              equipment: ['Bodyweight'],
            ),
          ],
        ),
      ],
    ),
  ];
}
