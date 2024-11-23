import 'package:flutter/material.dart';

class SkillCard extends StatelessWidget {
  final String level;
  final String description;
  final String iconPath;
  final bool isSelected;
  final Function(String) onSelect;
  final Color selectedBackgroundColor;
  final Color selectedBorderColor;

  SkillCard({
    required this.level,
    required this.description,
    required this.iconPath,
    required this.isSelected,
    required this.onSelect,
    this.selectedBackgroundColor = Colors.white,
    this.selectedBorderColor = const Color(0xFFDDE4EE),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelect(level),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? selectedBackgroundColor : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: isSelected ? selectedBorderColor : Color(0xFFDDE4EE)),
        ),
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  level,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF101C2D),
                  ),
                ),
                SizedBox(width: 8),
                Image.asset(
                  iconPath,
                  width: 24,
                  height: 24,
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF66768E),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
