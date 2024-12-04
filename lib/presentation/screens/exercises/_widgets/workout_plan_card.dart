
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp_clone/presentation/screens/exercises/_widgets/workout_info.dart';
import 'package:whatsapp_clone/presentation/screens/exercises/_widgets/workout_list.dart';

class WorkoutPlanCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String type;
  final String difficulty;

  final WorkoutPlan workoutPlan;

  const WorkoutPlanCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.type,
    required this.difficulty,
    required this.workoutPlan,
  });

  get controller => null;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showBottomSheet(context),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0), // 4 px border radius
              child: Image.network(
                'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/$imageUrl',
                width: 95,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            const Gap(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF212121),
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        type,
                        style: const TextStyle(
                          color: Color(0xFF616161),
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        '•',
                        style: TextStyle(
                          color: Color(0xFF616161),
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        difficulty,
                        style: const TextStyle(
                          color: Color(0xFF616161),
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            const Icon(Icons.arrow_forward, color: Color(0xFF616161), size: 24),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (_, controller) {
            return ListView(
              controller: controller,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              children: [
                Center(
                  child: Container(
                    height: 4,
                    width: 32,
                    color: Colors.grey.shade300,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF212121),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/$imageUrl',
                    width: double.infinity,
                    height: 172,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 24),
                WorkoutInfo(
                    equipment: workoutPlan.equipment.toString(),
                    category: workoutPlan.category.toString(),
                    level: workoutPlan.level.toString()),
                const SizedBox(height: 24),
                const Text(
                  "Instructions",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF101C2D),
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  workoutPlan.instructions!.join('\n\n-'),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2F3A4C),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  "Primary Muscles",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF101C2D),
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: workoutPlan.primaryMuscles!
                      .map((muscle) => _buildTag(muscle))
                      .toList(),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0560FD),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      "Add to my exercises list",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );

        // return Container(
        //   width: constraints.maxWidth,
        //   // This makes the bottom sheet take the full width of the screen
        //   padding: EdgeInsets.all(16.0),
        //   child: Column(
        //     mainAxisSize: MainAxisSize.min,
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text(
        //         title,
        //         style: TextStyle(
        //           color: Color(0xFF212121),
        //           fontWeight: FontWeight.w700,
        //           fontSize: 20,
        //         ),
        //       ),
        //       SizedBox(height: 16),
        //       Text(
        //         'Type: $type',
        //         style: TextStyle(
        //           color: Color(0xFF616161),
        //           fontWeight: FontWeight.w400,
        //           fontSize: 16,
        //         ),
        //       ),
        //       SizedBox(height: 8),
        //       Text(
        //         'Difficulty: $difficulty',
        //         style: TextStyle(
        //           color: Color(0xFF616161),
        //           fontWeight: FontWeight.w400,
        //           fontSize: 16,
        //         ),
        //       ),
        //       SizedBox(height: 16),
        //       ElevatedButton(
        //         onPressed: () {
        //           Navigator.pop(context);
        //         },
        //         child: Text('Close'),
        //       ),
        //     ],
        //   ),
        // );
      },
    );
  }
}

Widget _buildTag(String label) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xFFDDE4EE)),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      label,
      style: const TextStyle(
        color: Color(0xFF101C2D),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
