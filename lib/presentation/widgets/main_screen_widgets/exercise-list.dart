
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'exercise-card.dart';

class ExerciseList extends StatelessWidget {
  const ExerciseList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              children: [
                Gap(14),
                RelaxationExerciseCard(
                  imagePath: 'assets/images/background_image.png',
                  exerciseName: " تمرين\n الاسترخاء",
                  progress: 0.8,
                ),
                 Gap(8),
                RelaxationExerciseCard(
                  imagePath: 'assets/images/background_image2.jpg',
                  exerciseName: ' تمرين \n تامل ',
                  progress: 0.8,
                ),
                 Gap(8),
                RelaxationExerciseCard(
                  imagePath: 'assets/images/background_image2.jpg',
                  exerciseName: ' تمرين \n الدراجة',
                  progress: 0.8,
                ),
                Gap(8),
                RelaxationExerciseCard(
                    imagePath: "assets/images/background_image.png",
                    exerciseName: " تمرين\n الغا",
                    progress: 0.12),
                Gap(14)
              ],
            ),
          ),
        ),
      ],
    );
  }
}

