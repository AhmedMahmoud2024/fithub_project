
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/presentation/screens/exercises/_widgets/workout_plan_card.dart';

class WorkoutPlanListScreen extends StatelessWidget {
  final List<WorkoutPlan> workoutPlans;

  const WorkoutPlanListScreen({super.key, required this.workoutPlans});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: workoutPlans.length,
        itemBuilder: (context, index) {
          final workoutPlan = workoutPlans[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 0.0),
            child: WorkoutPlanCard(
              imageUrl: workoutPlan.images![0],
              title: workoutPlan.name!,
              type: workoutPlan.category!,
              difficulty: workoutPlan.level!,
              workoutPlan: workoutPlan,
            ),
          );
        },
    );
  }
}

class WorkoutPlan {
  final String? name;
  final String? force;
  final String? level;
  final String? mechanic;
  final String? equipment;
  final List<String>? primaryMuscles;
  final List<String>? secondaryMuscles;
  final List<String>? instructions;
  final String? category;
  final List<String>? images;
  final String? id;

  WorkoutPlan({
    required this.name,
    required this.force,
    required this.level,
    required this.mechanic,
    required this.equipment,
    required this.primaryMuscles,
    required this.secondaryMuscles,
    required this.instructions,
    required this.category,
    required this.images,
    required this.id,
  });

  factory WorkoutPlan.fromJson(Map<String, dynamic> json) {
    return WorkoutPlan(
      name: json['name'],
      force: json['force'],
      level: json['level'],
      mechanic: json['mechanic'],
      equipment: json['equipment'],
      primaryMuscles: json['primaryMuscles'] != null ? List<String>.from(json['primaryMuscles']) : null,
      secondaryMuscles: json['secondaryMuscles'] != null ? List<String>.from(json['secondaryMuscles']) : null,
      instructions: json['instructions'] != null ? List<String>.from(json['instructions']) : null,
      category: json['category'],
      images: json['images'] != null ? List<String>.from(json['images']) : null,
      id: json['id'],
    );
  }
}