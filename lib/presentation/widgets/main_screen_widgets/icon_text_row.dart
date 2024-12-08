// Reusable Row Widget
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconTextRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconTextRow({Key? key, required this.icon, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
              Icons.arrow_back
          ),
          SizedBox(width: 10),
          Text(text, style: TextStyle(fontSize: 16)),
          SizedBox(width: 10),
          Icon(icon, size: 24.0),
          // Space between icon and text

        ],
      ),
    );
  }
}