
import 'package:flutter/material.dart';

import 'leaderboard-item.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Leaderboard',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Color(0xFF101C2D),
          ),
        ),
        SizedBox(height: 18),
        Column(
          children: [
            LeaderboardItem(position: 1, username: 'Abdulla A***', points: '11 238', isHighlighted: false),
            LeaderboardItem(position: 2, username: 'Ahmed S***', points: '10 600', isHighlighted: false),
            LeaderboardItem(position: 3, username: 'Mahamed E***', points: '9 488', isHighlighted: false),
            LeaderboardItem(position: 4, username: 'Saad H***', points: '8 789', isHighlighted: false),
            Divider(color: Colors.black26),
            LeaderboardItem(position: 45, username: 'Abdulla Gomma', points: '512', isHighlighted: true),
          ],
        ),
      ],
    );
  }
}
