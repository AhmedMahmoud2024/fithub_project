import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reusable Modal Bottom Sheet Example',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reusable Modal Bottom Sheet Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showCustomModalBottomSheet(context);
          },
          child: Text('Show Custom Modal Bottom Sheet'),
        ),
      ),
    );
  }

  void _showCustomModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return CustomModalBottomSheet();
      },
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
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Use min to fit the content
        children: <Widget>[
          Text(
            'Modal Title',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Container(
            width: 388,
            height: 172,
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
    );
  }
}