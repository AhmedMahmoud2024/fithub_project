import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


class RelaxationExerciseCard extends StatelessWidget {
  final String imagePath;
  final String exerciseName;
  final double progress;
  final VoidCallback onPressed;
   RelaxationExerciseCard({
    super.key,
     required this.onPressed,
    required this.imagePath,
    required this.exerciseName,
    required this.progress,

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPressed ,
      child: Container(
        width: 190,
        height: 230,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              right: 0,
              width: 190,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CircularPercentIndicator(
                        radius: 19.5,
                        lineWidth: 5.0,
                        percent: progress,
                        center: Text(
                          "${(progress * 100).toInt()}%",
                          style: const TextStyle(
                            fontSize: 10.0,
                            color: Color(0xFFE6EFFF),
                            height: 0.8,
                          ),
                        ),
                        backgroundColor: Colors.grey,
                        progressColor: Colors.blue,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        exerciseName,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
