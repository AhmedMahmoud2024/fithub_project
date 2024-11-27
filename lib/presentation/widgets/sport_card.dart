import 'package:flutter/material.dart';

class SportCard extends StatelessWidget {
  final String sport;
  final String iconPath;
  final bool isSelected;
  final Function(String) onSelect;
  final Color selectedBackgroundColor;
  final Color selectedBorderColor;

  const SportCard({
    required this.sport,
    required this.iconPath,
    required this.isSelected,
    required this.onSelect,
    this.selectedBackgroundColor = const Color(0xFFE6F1FF),
    this.selectedBorderColor = const Color(0xFFDDE4EE),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelect(sport),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? selectedBackgroundColor : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: isSelected ? selectedBorderColor : Color(0xFFDDE4EE)),
        ),
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Image.asset(
              iconPath,
              width: 48,
              height: 48,
            ),
            const SizedBox(width: 8),
            Text(
              sport,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF101C2D),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
