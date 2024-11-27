import 'package:flutter/material.dart';

class BodyStatusCard extends StatelessWidget {
  final String status;
  final bool isSelected;
  final Function(String) onSelect;
  final Color backgroundColor;

  const BodyStatusCard({
    required this.status,
    required this.isSelected,
    required this.onSelect,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelect(status),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFE6EFFB) : backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xFFDDE4EE)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
        child: Center(
          child: Text(
            status,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF101C2D),
            ),
          ),
        ),
      ),
    );
  }
}
