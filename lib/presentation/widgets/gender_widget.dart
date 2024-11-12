import 'package:flutter/material.dart';

class GenderSelectionWidget extends StatefulWidget {
  @override
  _GenderSelectionWidgetState createState() => _GenderSelectionWidgetState();
}

class _GenderSelectionWidgetState extends State<GenderSelectionWidget> {
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    // Get the width of the screen
    double cardWidth = MediaQuery.of(context).size.width * 1.0; // 80% of screen width
    double cardHight = MediaQuery.of(context).size.height * 0.25; // 80% of screen width

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedGender = 'Male';
              });
            },
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: _selectedGender == 'Male' ? Colors.blue : Colors.white, // Change card color
              child: Container(
                width: cardWidth,
                height: cardHight,
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        Icons.male,
                        size: 40,
                        color: _selectedGender == 'Male' ? Colors.white : Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'ذكر',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20), // Space between cards
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedGender = 'Female';
              });
            },
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: _selectedGender == 'Female' ? Colors.pink : Colors.white, // Change card color
              child: Container(
                width: cardWidth,
                height: cardHight,
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        Icons.female,
                        size: 40,
                        color: _selectedGender == 'Female' ? Colors.white : Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'أنثى',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20), // Space before the button
          ElevatedButton(
            onPressed: () {
              if (_selectedGender != null) {
                print('تم اختيار الجنس: $_selectedGender');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('تم اختيار الجنس: $_selectedGender')),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('يرجى اختيار الجنس أولاً.')),
                );
              }
            },
            child: Text('طباعة الاختيار'),
          ),
        ],
      ),
    );
  }
}