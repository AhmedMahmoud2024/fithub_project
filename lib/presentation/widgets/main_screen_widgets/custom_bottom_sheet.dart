import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'exercise_buttom_sheet.dart';

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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ExerciseModalBottomSheet1()));
                  //          context.go("/EaluationModalBottomSheet");
                  //      _showExerciseModalBottomSheet(context);
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