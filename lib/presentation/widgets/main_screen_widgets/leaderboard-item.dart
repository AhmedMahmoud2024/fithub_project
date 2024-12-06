
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/presentation/widgets/main_screen_widgets/position-indicator.dart';

class LeaderboardItem extends StatelessWidget {
  final int position;
  final String username;
  final String points;
  final bool isHighlighted;

  const LeaderboardItem({super.key, 
    required this.position,
    required this.username,
    required this.points,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: isHighlighted ? const Color(0xFFE6EFFF) : const Color(0xFFF1F4F9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
    mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            'ن',
            style: TextStyle(
              fontFamily: 'DM Sans',
              fontSize: 16,
              color: Color(0xFF101C2D),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            points,
            style: const TextStyle(
              fontFamily: 'DM Sans',
              fontSize: 16,
              color: Color(0xFF101C2D),
            ),
            textAlign: TextAlign.right,
          ),
          const SizedBox(width: 450),
          Expanded(
            child: Text(
              username,
              style: const TextStyle(
                fontFamily: 'DM Sans',
                fontSize: 28,
                color: Color(0xFF101C2D),
              ),
            ),
          ),
          PositionIndicator(position: position, isHighlighted: isHighlighted),
        ],
      ),
    );
  }
}
