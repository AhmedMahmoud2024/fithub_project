import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../widgets/main_screen_widgets/event-list.dart';
import '../../widgets/main_screen_widgets/exercise-list.dart';
import '../../widgets/main_screen_widgets/leaderboard.dart';

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
        onPressed: () { context.go('/profile'); },
        tooltip: 'Increment',
        backgroundColor: const Color(0xFF0560FD),
        child: SvgPicture.asset('assets/icons/bot.svg'),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Widget statusOfExercise(){
  return Container(
    width: double.infinity,
    height: 60,
    decoration: BoxDecoration(
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
                "5 أيام على التوالي",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.orangeAccent
              ),
            ),
            SizedBox(height: 6,),
            Text(
                "عمل مذهل انت تقترب اكثر من هدفك حافظ على تقدمك بالقيام بتمارينك اليومية",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.orangeAccent

              ),
            )
          ],
        ),
        SizedBox(width: 4,),
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
                image: NetworkImage(
                    "https://s3-alpha-sig.figma.com/img/11d8/4f19/f522af725e8e00e2169cbdec9440d49c?Expires=1734307200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Qitu79Dv2bn54LJtjRUO7aV7GDxzznAnLc8JPWWRrgoIe93QPxZLhJNocGN7XEweCCG3AlfQmu8frxbjW4R9Yrsj1WmX4IDQaEJbkVpOtHdFTy1SrJtMvnz3rmVE7E1gMk5xCwp6wjxjxOZxA4fyLBDTQc2BvNM1PYbn4XjPiHbaqovTklGcugpr5NNeZ-uHXuvtTMBYy~IeTmG8AxlG7aWWUj035wXFmpJty9TKBgrUqMitzpvDUpej6uAkeqszm5EHWOCI4b5Pr2Dk-b~yzwD12Bk0e7RySg-3N2koqyxN06QWILNTu0gJO5ihWbMQqKo1cwWCJtjYmEWMEHg3qA__"
                )
            ),

          ),
          child: Center(
           //  child: Expanded(
           //   
           //    //child: NetworkImage("")
           // // Image.asset("assets/3dicons.svg")
           //  ),
          ),
        ),
      ],
    ),
  );
}