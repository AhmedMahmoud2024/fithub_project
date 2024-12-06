
import 'package:flutter/material.dart';

import 'leaderboard-item.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'لوحة الصداره',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Color(0xFF101C2D),
          ),
        ),
        SizedBox(height: 18),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            LeaderboardItem(position: 1, username: '***محمود ع', points: '11 238', isHighlighted: false),
            LeaderboardItem(position: 2, username: '***سعيد م', points: '10 600', isHighlighted: false),
            LeaderboardItem(position: 3, username: '***أحمد م', points: '9 488', isHighlighted: false),
            LeaderboardItem(position: 4, username: '***رنا ', points: '8 789', isHighlighted: false),
            Divider(color: Colors.black26),
            LeaderboardItem(position: 45, username: '***محمد ', points: '512', isHighlighted: true),

          ],
        ),
      ],
    );
  }
}
