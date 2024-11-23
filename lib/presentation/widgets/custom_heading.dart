import 'package:flutter/material.dart';

class CustomHeading extends StatelessWidget {
  final String step;
  final String question;
  final String subtitle;

  const CustomHeading({
    required this.step,
    required this.question,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Icon(
              Icons.arrow_back,
              color: Color(0xFF2F3A4C),
              size: 18,
            ),
            const SizedBox(width: 4),
            Text(
              'السابق',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF2F3A4C),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          step,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF919FB6),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          question,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF101C2D),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF66768E),
          ),
        ),
      ],
    );
  }
}


