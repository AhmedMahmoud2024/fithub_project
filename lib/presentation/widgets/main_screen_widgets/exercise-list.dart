
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'custom_bottom_sheet.dart';
import 'exercise-card.dart';
import 'exercise_buttom_sheet.dart';

class ExerciseList extends StatelessWidget {
   ExerciseList({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
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
                  onPressed: () {
                    _showCustomModalBottomSheet(context);
                  }
                  ,
                ),
                 Gap(8),
                RelaxationExerciseCard(
                  imagePath: 'assets/images/background_image2.jpg',
                  exerciseName: ' تمرين \n تامل ',
                  progress: 0.8, onPressed: () {
                  _showCustomModalBottomSheet(context);
                },
                ),
                 Gap(8),
                RelaxationExerciseCard(
                  imagePath: 'assets/images/background_image2.jpg',
                  exerciseName: ' تمرين \n الدراجة',
                  progress: 0.8, onPressed: () {
                  _showCustomModalBottomSheet(context);
                },
                ),
                Gap(8),
                RelaxationExerciseCard(
                    imagePath: "assets/images/background_image.png",
                    exerciseName: " تمرين\n الغا",
                    progress: 0.12, onPressed: () {
                  _showCustomModalBottomSheet(context);
                },),
                Gap(14)
              ],
            ),
          ),
        ),
      ],
    );
  }
}

void _showCustomModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return CustomModalBottomSheet();
    },
  );
}


