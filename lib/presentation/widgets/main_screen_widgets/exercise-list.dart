
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'exercise-card.dart';

class ExerciseList extends StatelessWidget {
   ExerciseList({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              children: [
                Gap(14),
                RelaxationExerciseCard(
                  imagePath: 'assets/images/background_image.png',
                  exerciseName: " تمرين\n الاسترخاء",
                  progress: 0.8,
                  onPressed: () {
                    _showCustomModalBottomSheet(context);
                  }
                  ,
                ),
                 Gap(8),
                RelaxationExerciseCard(
                  imagePath: 'assets/images/background_image2.jpg',
                  exerciseName: ' تمرين \n تامل ',
                  progress: 0.8, onPressed: () {
                  _showCustomModalBottomSheet(context);
                },
                ),
                 Gap(8),
                RelaxationExerciseCard(
                  imagePath: 'assets/images/background_image2.jpg',
                  exerciseName: ' تمرين \n الدراجة',
                  progress: 0.8, onPressed: () {
                  _showCustomModalBottomSheet(context);
                },
                ),
                Gap(8),
                RelaxationExerciseCard(
                    imagePath: "assets/images/background_image.png",
                    exerciseName: " تمرين\n الغا",
                    progress: 0.12, onPressed: () {
                  _showCustomModalBottomSheet(context);
                },),
                Gap(14)
              ],
            ),
          ),
        ),
      ],
    );
  }
}

void _showCustomModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return CustomModalBottomSheet();
    },
  );
}
class CustomModalBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 428,
      height: double.infinity,
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          //mainAxisSize: MainAxisSize.max, // Use min to fit the content
          children: <Widget>[
            Text(
              'تمارين تقويه عضله الذراع',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Container(
              width: 388,
              height: 70,
              color: Colors.blue[100], // Example background color
              child: Center(child: Text('هىا')),
            ),
            SizedBox(height: 16),
            Text('التعليمات',),
            SizedBox(height: 4),
            SizedBox(
              width: 388,
              child: Container(
                child:Text(
                  'ماراثون رياضي إنساني لدعم أهالي غزة ',
                  style: TextStyle(fontSize: 16,),
                  textAlign: TextAlign.end,
                ),

              ),
            ),
            SizedBox(height: 2),
            Text(
               "ينطلق المعادى ويجوب القاهرة ليختتم في الزمالك.",
              style: TextStyle(),
            ),
            SizedBox(height: 6),
            Text(
                'تتوفر مسارات بمسافات مختلفة تناسب جميع الأعمار ومستويات '
            ),

            Text("اللياقة البدنية."),
            Text("رسوم التسجيل 100 جنيه تُخصص لدعم المتضررين من اهل غزه.",),
            SizedBox(height: 16),
            Text(
              'العضلات الستهدفه',
                ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('القدم',),
                Text('القدم',),
                Text('الفخذ',),
                Text('الركبه',),
              ],
            ),
            SizedBox(height: 16),
            Container(
              width: double.infinity,
             // decoration: BoxDecoration(color: Colors.blueAccent),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0560FD),
                  minimumSize: Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                   _showExerciseModalBottomSheet(context);
               //   Navigator.pop(context); // Close the bottom sheet
                },
                child: Text('بدء التمرين',style: TextStyle(color: Colors.blueAccent),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
void _showEvaluationModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return EvaluationModalBottomSheet();
    },
  );
}
class EvaluationModalBottomSheet extends StatefulWidget {
  @override
  _EvaluationModalBottomSheetState createState() => _EvaluationModalBottomSheetState();
}

class _EvaluationModalBottomSheetState extends State<EvaluationModalBottomSheet> {
  int _rating = 0; // To hold the star rating
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Use min to fit the content
          children: <Widget>[
            Text(
              'تقييم التمرين', // Centered title in Arabic
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _rating ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                  ),
                  onPressed: () {
                    setState(() {
                      _rating = index + 1; // Update the rating
                    });
                  },
                );
              }),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _controller,
              maxLines: 4, // Allow multiple lines
              decoration: InputDecoration(
                labelText: 'اكتب تقييمك هنا', // Label in Arabic
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle the submission of the evaluation
                String evaluation = _controller.text;
                // You can process the evaluation and rating here
                print('Rating: $_rating, Evaluation: $evaluation');
                _showEvaluationModalBottomSheet(context);
             //   Navigator.pop(context); // Close the bottom sheet
              },
              child: Text('تقييم',), // Button text in Arabic
            ),
          ],
        ),
      ),
    );
  }
}
void _showExerciseModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return ExerciseModalBottomSheet();
    },
  );
}
class ExerciseModalBottomSheet extends StatefulWidget {
  @override
  _ExerciseModalBottomSheetState createState() => _ExerciseModalBottomSheetState();
}

class _ExerciseModalBottomSheetState extends State<ExerciseModalBottomSheet> {
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
              Navigator.pop(context); // Close the bottom sheet
            },
            child: Text('إغلاق'), // Close button in Arabic
          ),
        ],
      ),
    );
  }
}