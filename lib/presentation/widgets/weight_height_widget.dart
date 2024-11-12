import 'package:flutter/material.dart';

class WeightHeightWidget extends StatefulWidget {
  @override
  _WeightHeightWidgetState createState() => _WeightHeightWidgetState();
}

class _WeightHeightWidgetState extends State<WeightHeightWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'إدخال الوزن والطول',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'أدخل الوزن',
                        border: OutlineInputBorder(),
                        suffixText: 'كجم', // Unit for weight
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'يرجى إدخال الوزن';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: SingleChildScrollView(
                      child: TextFormField(
                        controller: _heightController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'أدخل الطول',
                          border: OutlineInputBorder(),
                          suffixText: 'سم', // Unit for height
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يرجى إدخال الطول';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process the input values
                    String weight = _weightController.text;
                    String height = _heightController.text;
                    print('الوزن: $weight كجم, الطول: $height سم');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('الوزن: $weight كجم, الطول: $height سم')),
                    );
                  }
                },
                child: Text('إرسال'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}