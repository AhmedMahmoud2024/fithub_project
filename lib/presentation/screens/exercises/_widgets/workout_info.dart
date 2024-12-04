import 'package:flutter/material.dart';

class WorkoutInfo extends StatelessWidget {
  final String equipment;
  final String category;
  final String level;

  const WorkoutInfo({
    super.key,
    required this.equipment,
    required this.category,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFDDE4EE)),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildInfoColumn('Equipment', equipment),
          const VerticalDivider(color: Color(0xFFDDE4EE), thickness: 1),
          _buildInfoColumn('Category', category),
          const VerticalDivider(color: Color(0xFFDDE4EE), thickness: 1),
          _buildInfoColumn('Level', level),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xFF66768E),
            height: 1.33,
          ),
        ),

        const SizedBox(height: 4),

        Text(
          value,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xFF2F3A4C),
            height: 1.33,
          ),
        ),

      ],
    );
  }
}
