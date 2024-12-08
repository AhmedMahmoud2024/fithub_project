
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
      height: 662,
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max, // Use min to fit the content
          children: <Widget>[
            Text(
              'Modal Title',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Container(
              width: 388,
              height: 70,
              color: Colors.blue[100], // Example background color
              child: Center(child: Text('Content goes here')),
            ),
            SizedBox(height: 16),
            Text('This is some additional text below the container.'),
            SizedBox(height: 16),
            SizedBox(
              width: 388,
              child: Text.rich(
                TextSpan(
                  text: 'This is a rich text example. ',
                  style: TextStyle(fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'This part is bold.',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: ' And this is normal text.'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Text('Another piece of text below the rich text.'),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('Item 1'),
                Text('Item 2'),
                Text('Item 3'),
                Text('Item 4'),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the bottom sheet
              },
              child: Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}