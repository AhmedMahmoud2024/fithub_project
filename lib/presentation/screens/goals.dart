
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/presentation/widgets/next_Button.dart';
import 'package:whatsapp_clone/presentation/widgets/weight_height_widget.dart';

import '../widgets/custom_heading.dart';
import '../widgets/goal_card.dart';
import '../widgets/skill_card.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {

  List<String> _selectedGoals=[];

  void _selectGoal(String goal){
    setState(() {
      if(_selectedGoals.contains(goal)){
        _selectedGoals.remove(goal);
      }else{
        _selectedGoals.add(goal);
      }
    });
  }



    void _submitGoals() {
    if (_selectedGoals.isNotEmpty) {
      // Implement submission logic here
      print('Selected Goals: $_selectedGoals');

    } else {
      // Show an error message or toast
      print('Please select at least one goal');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.only(right: 10.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomHeading(
                    step: 'الخطوة 5',
                    question: 'ما هي أهدافك؟',
                    subtitle: 'بناءً على أهدافك سننشئ الخطة المناسبة للوصول لها فى بأنسب طريقة ممكنه.',
                ),
                SizedBox(height: 32),
                GoalCard(
                title: 'فقدان الوزن',
                description: "تحقيق وزن جسم صحي من خلال تغذية متوازنة وممارسة الرياضة بانتظام، مما يؤدي إلى تحسين الصحة العامة والعافية.",
                isSelected: _selectedGoals.contains('فقدان الوزن'),
                onSelect: _selectGoal,
              ),
              const SizedBox(height: 5),
              GoalCard(
                title: 'زيادة العضلات',
                description: "بناء كتلة عضلية نحينة وقوة من خلال التدريب على المقاومة المستهدفة والتغذية السليمة، مما يعزز الأداء البدني والمظهر.",
                isSelected: _selectedGoals.contains('زيادة العضلات'),
                onSelect: _selectGoal,
           //     backgroundColor: Color(0xFFE6EFFF),
              ),
              const SizedBox(height: 5),
              GoalCard(
                title: 'لياقة عامة',
                description: "تحسين مستويات اللياقة العامة والقدرة على التحمل والقدرة على التحمل من خلال مزيج متوازن من التمارين القلبية وتدريبات القوة وتمارين المرونة.",
                isSelected: _selectedGoals.contains('لياقة عامة'),
                onSelect: _selectGoal,
             //   backgroundColor: Color(0xFFE6EFFF),
              ),
              const SizedBox(height: 5),
              GoalCard(
                title: 'أداء رياضي',
                description: "تعزيز الأداء الرياضي ومهارات التمرين في رياضة معينة أو نشاط من خلال التدريب المركز، وتنقيح التقنيات، واستراتيجيات تحسين الأداء.",
                isSelected: _selectedGoals.contains('أداء رياضي'),
                onSelect: _selectGoal,
               // backgroundColor: Color(0xFFE6EFFF),
              ),
              const SizedBox(height: 5),
              GoalCard(
                title: 'المرونة والتنقل',
                description: "زيادة المرونة ونطاق الحركة وتحرك المفاصل لمنع الإصابات، وتحسين الوضع، وتعزيز أنماط الحركة الوظيفية للأنشطة اليومية والتمرين.",
                isSelected: _selectedGoals.contains('المرونة والتنقل'),
                onSelect: _selectGoal,
              ),
              const SizedBox(height: 5),
              GoalCard(
                title: 'تقليل الضغط النفسي',
                description: "تقليل مستويات الضغط النفسي، وتعزيز الاسترخاء، وتحسين الرفاهية العقلية من خلال ممارسات العقل والجسد مثل اليوغا والتأمل وتمارين التنفس العميق.",
                isSelected: _selectedGoals.contains('تقليل الضغط النفسي'),
                onSelect: _selectGoal,
               // backgroundColor: Color(0xFFE6EFFF),
              ),
              const SizedBox(height: 5),
                  NextButton(onPressed: _submitGoals),

              ],
            )
            ,

          ],
        ),

        ),
      );

  }
}
