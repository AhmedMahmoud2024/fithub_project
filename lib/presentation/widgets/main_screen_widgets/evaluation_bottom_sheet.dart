
import 'package:flutter/material.dart';

class EaluationModalBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise Evaluation'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showEvaluationModalBottomSheet(context);
          },
          child: Text('Evaluate Exercise'),
        ),
      ),
    );
  }

  void _showEvaluationModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return EvaluationModalBottomSheet();
      },
    );
  }
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
                //  _showEvaluationModalBottomSheet(context);
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
