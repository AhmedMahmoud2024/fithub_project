import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../widgets/main_screen_widgets/event-list.dart';
import '../../widgets/main_screen_widgets/exercise-list.dart';
import '../../widgets/main_screen_widgets/icon_text_row.dart';
import '../../widgets/main_screen_widgets/leaderboard.dart';
import '../../widgets/main_screen_widgets/status_of_exercise.dart';

class MyHomePage extends StatefulWidget {
   MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: double.infinity,
        leading: const Padding(
          padding: EdgeInsets.only(left: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CircleAvatar(
                backgroundImage:
                    NetworkImage("https://thispersondoesnotexist.com/"),
                radius: 24,
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/icons/bell.svg'),
            onPressed: () {
              print('presed');
            },
          ),
          IconButton(

            icon: SvgPicture.asset('assets/icons/message.svg'),
            onPressed: () {
              print('presed');
            }, // Replace with your SVG file path
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
        //  padding: const EdgeInsets.all(0),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(14.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'مرحباً, محمد',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff101C2D)),
                    ),
                    Text(
                      'اليك تمارينك لهذا اليوم لا تتكاسل وابدا التمرين',
                      style: TextStyle(fontSize: 16, color: Color(0xff66768E)),
                    ),
                  ],
                ),
              ),
              Gap(24),
              statusOfExercise(),
              Gap(24),
              ExerciseList(),
              Gap(24),
              EventList(),
              Gap(24),
              Padding(
                padding: EdgeInsets.all(14.0),
                child: Leaderboard(),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
         _showModalBottomSheet(context);
          },
        tooltip: 'فطين',
        backgroundColor: const Color(0xFF0560FD),
        child: SvgPicture.asset('assets/icons/bot.svg'),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );

  }

}



Future _showModalBottomSheet(BuildContext context) {
 return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min, // Use min to fit the content
          children: <Widget>[
            Center(
              child: Text(
                'فطين مساعدك الشخصى',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            SizedBox(height: 10),
            IconTextRow(text: 'متابعة تقدمك',icon: Icons.home,),
            IconTextRow(icon: Icons.settings, text: 'دردشة عن حالتك وخطتك'),
            IconTextRow(icon: Icons.info, text: 'محادثة عامة'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the bottom sheet
              },
              child: Text('Close'),
            ),
          ],
        ),
      );
    },
  );
}
