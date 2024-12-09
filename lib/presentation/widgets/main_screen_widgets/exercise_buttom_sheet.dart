import 'dart:async';

import 'package:flutter/material.dart';

import 'evaluation_bottom_sheet.dart';
import 'exercise-list.dart';

class ExerciseModalBottomSheet extends StatelessWidget {
  const ExerciseModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise Evaluation'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showExerciseModalBottomSheet(context);
          },
          child: Text('Evaluate Exercise'),
        ),
      ),
    );
  }
  void _showExerciseModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ExerciseModalBottomSheet1();
      },
    );
  }
}


class ExerciseModalBottomSheet1 extends StatefulWidget {
  @override
  _ExerciseModalBottomSheetState createState() => _ExerciseModalBottomSheetState();
}

class _ExerciseModalBottomSheetState extends State<ExerciseModalBottomSheet1> {
  int _seconds = 0; // Counter for seconds
  Timer? _timer; // Timer instance
  bool _isRunning = false; // To track if the timer is running

  void _startTimer() {
    _isRunning = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  void _stopTimer() {
    _isRunning = false;
    _timer?.cancel();
  }

  void _resetTimer() {
    _stopTimer();
    setState(() {
      _seconds = 0;
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String formatDuration(int seconds) {
      final minutes = (seconds ~/ 60) % 60;
      final hours = (seconds ~/ 3600);
      return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${(seconds % 60).toString().padLeft(2, '0')}';
    }

    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Use min to fit the content
        children: <Widget>[
          Text(
            'وقت التمرين', // Centered title in Arabic
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            formatDuration(_seconds), // Display the formatted time
            style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  _startTimer(); // Start the timer
                },
                child: Text('انضم للتمرين'), // Join Exercise in Arabic
              ),
              ElevatedButton(
                onPressed: () {
                  if (_isRunning) {
                    _stopTimer(); // Stop the timer
                  } else {
                    _startTimer(); // Continue the timer
                  }
                },
                child: Text(_isRunning ? 'أوقف التمرين' : 'استمر في التمرين'), // Stop/Continue Exercise in Arabic
              ),
            ],
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              _resetTimer(); // Reset the timer
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>EvaluationModalBottomSheet()));
              // Close the bottom sheet
            },
            child: Text('إغلاق'), // Close button in Arabic
          ),
        ],
      ),
    );
  }
}