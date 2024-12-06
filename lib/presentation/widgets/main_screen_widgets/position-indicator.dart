import 'package:flutter/material.dart';

class PositionIndicator extends StatelessWidget {
  final int position;
  final bool isHighlighted;

  const PositionIndicator({super.key, 
    required this.position,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: isHighlighted ? Colors.blue : Colors.black,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          '$position',
          style: const TextStyle(
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Color(0xFFF1F4F9),
          ),
        ),
      ),
    );
  }
}

