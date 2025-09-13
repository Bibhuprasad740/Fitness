import 'package:fitness/models/body_part.dart';
import 'package:fitness/models/muscle_group.dart';
import 'package:fitness/models/exercise.dart';

class MockData {
  static final List<BodyPart> bodyParts = [
    BodyPart(
      id: 'bp_legs',
      name: 'Legs',
      imageUrl:
          'https://images.unsplash.com/photo-1467818488384-3a21f2b79959?q=80&w=1074&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      muscleGroups: [
        MuscleGroup(
          id: 'mg_quads',
          name: 'Quadriceps',
          exercises: [
            Exercise(
              id: 'ex_step_up_with_knee_raise',
              name: 'Step Up With Knee Raise',
              videoUrl: 'assets/videos/step_up_with_knee_raise.mp4',
              thumbnailUrl:
                  'https://images.pexels.com/photos/4754040/pexels-photo-4754040.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              description:
                  'Targets the quads and glutes while improving balance and core activation.',
              equipment: ['Bench', 'Dumbbells (optional)'],
            ),
            Exercise(
              id: 'ex_prisoner_squats',
              name: 'Prisoner Squats',
              videoUrl: 'assets/videos/prisoner_squats.mp4',
              thumbnailUrl:
                  'https://images.pexels.com/photos/4754041/pexels-photo-4754041.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              description:
                  'Bodyweight squat variation that works the quads and core with hands behind the head.',
              equipment: ['Body Weight'],
            ),
          ],
        ),
        MuscleGroup(
          id: 'mg_glutes',
          name: 'Glutes',
          exercises: [
            Exercise(
              id: 'ex_reverse_lunges_with_front_foot_elevated',
              name: 'Reverse Lunges With Front Foot Elevated',
              videoUrl:
                  'assets/videos/reverse_lunges_with_front_foot_elevated.mp4',
              thumbnailUrl:
                  'https://images.pexels.com/photos/4754042/pexels-photo-4754042.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              description:
                  'Emphasizes the glutes and hamstrings by increasing the range of motion in reverse lunges.',
              equipment: ['Bench', 'Dumbbells (optional)'],
            ),
            Exercise(
              id: 'ex_bodyweight_bridges',
              name: 'Bodyweight Bridges',
              videoUrl: 'assets/videos/bodyweight_bridges.mp4',
              thumbnailUrl:
                  'https://images.pexels.com/photos/4754052/pexels-photo-4754052.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              description:
                  'Activates and strengthens the glutes while engaging the hamstrings and core.',
              equipment: ['Body Weight', 'Mat'],
            ),
          ],
        ),
        MuscleGroup(
          id: 'mg_hamstrings',
          name: 'Hamstrings',
          exercises: [
            Exercise(
              id: 'ex_single_leg_dumbbell_deadlifts',
              name: 'Single Leg Dumbbell Deadlifts',
              videoUrl: 'assets/videos/single_leg_dumbbell_deadlifts.mp4',
              thumbnailUrl:
                  'https://images.pexels.com/photos/4754050/pexels-photo-4754050.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              description:
                  'Unilateral movement that strengthens hamstrings, glutes, and improves balance.',
              equipment: ['Dumbbell'],
            ),
            Exercise(
              id: 'ex_dumbbell_romanian_deadlifts',
              name: 'Dumbbell Romanian Deadlifts',
              videoUrl: 'assets/videos/dumbbell_romanian_deadlifts.mp4',
              thumbnailUrl:
                  'https://images.pexels.com/photos/4754051/pexels-photo-4754051.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              description:
                  'A staple hamstring exercise that emphasizes hip hinge and posterior chain strength.',
              equipment: ['Dumbbells', 'Barbell (optional)'],
            ),
          ],
        ),
      ],
    ),
    BodyPart(
      id: 'bp_chest',
      name: 'Chest',
      imageUrl:
          'https://images.unsplash.com/photo-1626082787732-5f608cf4b91f?q=80&w=665&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      muscleGroups: [
        MuscleGroup(
          id: 'mg_pecs',
          name: 'Pectorals',
          exercises: [
            Exercise(
              id: 'ex_lever_push_ups',
              name: 'Lever Push Ups',
              videoUrl: 'assets/videos/lever_push_up.mp4',
              thumbnailUrl:
                  'https://images.pexels.com/photos/4754004/pexels-photo-4754004.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              description: 'Classic exercise for chest strength and size.',
              equipment: ['Body Weight'],
            ),
            Exercise(
              id: 'ex_single_hand_push_up',
              name: 'Single Hand Push Ups',
              videoUrl: 'assets/videos/single_hand_push_up.mp4',
              thumbnailUrl:
                  'https://images.pexels.com/photos/4754005/pexels-photo-4754005.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              description:
                  'Targets the upper chest and provides a good stretch.',
              equipment: ['Body Weight'],
            ),
            Exercise(
              id: 'ex_single_arm_dumbell_press',
              name: 'Single Arm Dumbell Press',
              videoUrl: 'assets/videos/single_arm_dumbell_press.mp4',
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
          'https://images.unsplash.com/photo-1730157464700-08647c2f2536?q=80&w=736&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      muscleGroups: [
        MuscleGroup(
          id: 'mg_lats',
          name: 'Lats',
          exercises: [
            Exercise(
              id: 'ex_dumbell_around_pullover',
              name: 'Dumbbell Around Pullover',
              videoUrl: 'assets/videos/dumbell_around_pullover.mp4',
              thumbnailUrl:
                  'https://images.pexels.com/photos/4754031/pexels-photo-4754031.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              description:
                  'Pullover that targets the lats while also engaging the chest and triceps.',
              equipment: ['Dumbbell', 'Bench'],
            ),
            Exercise(
              id: 'ex_bent_over_rows',
              name: 'Bent Over Rows',
              videoUrl: 'assets/videos/bent_over_rows.mp4',
              thumbnailUrl:
                  'https://images.pexels.com/photos/4754032/pexels-photo-4754032.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              description:
                  'Builds back thickness by targeting lats, rhomboids, and middle traps.',
              equipment: ['Barbell', 'Dumbbells'],
            ),
          ],
        ),
        MuscleGroup(
          id: 'mg_lower_back',
          name: 'Lower Back',
          exercises: [
            Exercise(
              id: 'ex_reverse_plank',
              name: 'Reverse Plank',
              videoUrl: 'assets/videos/reverse_plank.mp4',
              thumbnailUrl:
                  'https://images.pexels.com/photos/4754030/pexels-photo-4754030.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              description:
                  'Strengthens the erector spinae, glutes, and hamstrings for posterior chain stability.',
              equipment: ['Body Weight', 'Mat'],
            ),
          ],
        ),
      ],
    ),
    // BodyPart(
    //   id: 'bp_shoulders',
    //   name: 'Shoulders',
    //   imageUrl:
    //       'https://images.unsplash.com/photo-1660156049794-7f386c3013f4?q=80&w=1074&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    //   muscleGroups: [
    //     MuscleGroup(
    //       id: 'mg_deltoids',
    //       name: 'Deltoids',
    //       exercises: [
    //         Exercise(
    //           id: 'ex_overhead_press',
    //           name: 'Overhead Press',
    //           videoUrl:
    //               'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4', // Placeholder video
    //           thumbnailUrl:
    //               'https://images.pexels.com/photos/4754009/pexels-photo-4754009.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    //           description:
    //               'Compound exercise for overall shoulder development.',
    //           equipment: ['Barbell', 'Dumbbells'],
    //         ),
    //         Exercise(
    //           id: 'ex_lateral_raises',
    //           name: 'Lateral Raises',
    //           videoUrl:
    //               'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4', // Placeholder video
    //           thumbnailUrl:
    //               'https://images.pexels.com/photos/4754010/pexels-photo-4754010.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    //           description: 'Isolates the side deltoids for wider shoulders.',
    //           equipment: ['Dumbbells'],
    //         ),
    //       ],
    //     ),
    //   ],
    // ),
    BodyPart(
      id: 'bp_arms',
      name: 'Arms',
      imageUrl:
          'https://images.unsplash.com/photo-1578619740917-93f6b3612a8f?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      muscleGroups: [
        // MuscleGroup(
        //   id: 'mg_biceps',
        //   name: 'Biceps',
        //   exercises: [
        //     Exercise(
        //       id: 'ex_bicep_curls',
        //       name: 'Dumbbell Bicep Curls',
        //       videoUrl: 'assets/videos/lever_push_up.mp4',
        //       thumbnailUrl:
        //           'https://images.pexels.com/photos/4754011/pexels-photo-4754011.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        //       description: 'Classic exercise for bicep development.',
        //       equipment: ['Dumbbells'],
        //     ),
        //   ],
        // ),
        // MuscleGroup(
        //   id: 'mg_triceps',
        //   name: 'Triceps',
        //   exercises: [
        //     Exercise(
        //       id: 'ex_tricep_extensions',
        //       name: 'Overhead Tricep Extension',
        //       videoUrl:
        //           'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4', // Placeholder video
        //       thumbnailUrl:
        //           'https://images.pexels.com/photos/4754012/pexels-photo-4754012.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        //       description: 'Targets all three heads of the triceps.',
        //       equipment: ['Dumbbell'],
        //     ),
        //   ],
        // ),
        MuscleGroup(
          id: 'mg_forearms',
          name: 'Forearms',
          exercises: [
            Exercise(
              id: 'ex_seated_one_arm_wrist_curl',
              name: 'Seated One Arm Wrist Curl',
              videoUrl: 'assets/videos/seated_one_arm_wrist_curl.mp4',
              thumbnailUrl:
                  'https://images.pexels.com/photos/4754010/pexels-photo-4754010.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              description:
                  'Isolates the forearm flexors to build wrist strength.',
              equipment: ['Dumbbell', 'Bench'],
            ),
            Exercise(
              id: 'ex_standing_wrist_curl',
              name: 'Standing Wrist Curl',
              videoUrl: 'assets/videos/standing_wrist_curl.mp4',
              thumbnailUrl:
                  'https://images.pexels.com/photos/4754011/pexels-photo-4754011.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              description:
                  'Works the forearm flexors while standing, improving grip and endurance.',
              equipment: ['Barbell', 'Dumbbells'],
            ),
            Exercise(
              id: 'ex_kneeling_wrist_sinkers',
              name: 'Kneeling Wrist Sinkers',
              videoUrl: 'assets/videos/kneeling_wrist_sinkers.mp4',
              thumbnailUrl:
                  'https://images.pexels.com/photos/4754012/pexels-photo-4754012.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              description:
                  'Targets the wrist stabilizers and forearm extensors for balance and control.',
              equipment: ['Body Weight', 'Mat'],
            ),
          ],
        ),
      ],
    ),
    BodyPart(
      id: 'bp_core',
      name: 'Core',
      imageUrl:
          'https://images.unsplash.com/photo-1545346315-f4c47e3e1b55?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      muscleGroups: [
        MuscleGroup(
          id: 'mg_abs',
          name: 'Abs',
          exercises: [
            Exercise(
              id: 'ex_plank',
              name: 'Plank',
              videoUrl: 'assets/videos/plank.mp4',
              thumbnailUrl:
                  'https://images.pexels.com/photos/4754020/pexels-photo-4754020.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              description:
                  'A core stability exercise that strengthens the abs, back, and shoulders.',
              equipment: ['Body Weight', 'Mat'],
            ),
            Exercise(
              id: 'ex_bottom_ups',
              name: 'Bottom Ups',
              videoUrl: 'assets/videos/bottom_ups.mp4',
              thumbnailUrl:
                  'https://images.pexels.com/photos/4754021/pexels-photo-4754021.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              description:
                  'Targets the lower abs by lifting the hips off the ground.',
              equipment: ['Body Weight', 'Mat'],
            ),
            Exercise(
              id: 'ex_weighted_crunches',
              name: 'Weighted Crunches',
              videoUrl: 'assets/videos/weighted_crunches.mp4',
              thumbnailUrl:
                  'https://images.pexels.com/photos/4754022/pexels-photo-4754022.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              description:
                  'An advanced ab exercise that builds strength using added resistance.',
              equipment: ['Weight Plate', 'Mat'],
            ),
          ],
        ),
      ],
    ),
  ];
}
