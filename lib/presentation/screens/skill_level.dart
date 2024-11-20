
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/presentation/widgets/next_Button.dart';
import 'package:whatsapp_clone/presentation/widgets/weight_height_widget.dart';

import '../widgets/custom_heading.dart';
import '../widgets/skill_card.dart';


class SkillLevelScreen extends StatefulWidget {
  const SkillLevelScreen({super.key});

  @override
  State<SkillLevelScreen> createState() => _SkillLevelScreenState();
}

class _SkillLevelScreenState extends State<SkillLevelScreen> {

    String _selectedSkillLevel = '';

  void _selectSkillLevel(String level) {
    setState(() {
      _selectedSkillLevel = level;
    });
  }
      void _submitSkillLevel() {
    if (_selectedSkillLevel.isNotEmpty) {
      // Implement submission logic here
      print('Selected Skill Level: $_selectedSkillLevel');

//      Navigator.push(context, MaterialPageRoute(builder: (context) => SportsFormScreen(),));
    } else {
      // Show an error message or toast
      print('Please select a skill level');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.only(right: 10.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'السابق',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),
                ),
                Icon(Icons.arrow_forward),
              ],
            ),
            SizedBox(height: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'الخطوة 3',
                  textAlign: TextAlign.right,
                  style: TextStyle(  color: Color(0xFF919FB6),fontSize: 14,fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10,),
                Text(
                  'ما هو مستوى مهاراتك؟',
                  textAlign: TextAlign.right,
                  style: TextStyle( fontSize: 28,fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6,),
                Text(
                  'نحتاج لمعرفه مستواك لتحديد الخطة الأنسب لك',
                  textAlign: TextAlign.right,
                  style: TextStyle(  color: Color(0xFF919FB6),fontSize: 16,fontWeight: FontWeight.w400,),
                ),
                                SizedBox(height: 32),
                SkillCard(
                  level: 'مبتدئ',
                  description: "يمكنك القيام ب 5 ضغط فى المره الواحده",
                  iconPath: 'assets/Accesories.png',
                  isSelected: _selectedSkillLevel == 'مبتدئ',
                  onSelect: _selectSkillLevel,
                ),
                SizedBox(height: 8),
                SkillCard(
                  level: 'متوسط',
                  description: "يمكنك القيام ب 10 ضغط فى المرة الواحدة",
                  iconPath: 'assets/ic_action_name.png',
                  isSelected: _selectedSkillLevel == 'متوسط',
                  onSelect: _selectSkillLevel,
                  selectedBackgroundColor: Color(0xFFE6F1FF),
                  selectedBorderColor: Color(0xFF9BBFFE),
                ),
            //     SizedBox(height: 20,),
            // Container(
            //   width: double.infinity,
            //   height: 100,
            //   child: ListView(
            //     children: [
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.end,
            //         children: [
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.end,
            //             children: [
            //               Icon(Icons.lightbulb_outline),
            //               SizedBox(width: 3,),
            //               Text(
            //                 'مبتدئ',
            //                 style: TextStyle(
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: 24
            //                 ),
            //               )
            //             ],
            //           ),
            //           SizedBox(height: 5,),
            //           Text("يمكنك القيام ب 5 ضغط فى المره الواحده",
            //           style: TextStyle(
            //             fontSize: 14,
            //             fontWeight: FontWeight.w400
            //           ),),
            //
            //         ],
            //       )
            //     ],
            //   ),
            // ),
            // SizedBox(height: 3,),
            //     Container(
            //       width: double.infinity,
            //       height: 100,
            //       child: ListView(
            //         children: [
            //           Column(
            //             crossAxisAlignment: CrossAxisAlignment.end,
            //             children: [
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.end,
            //                 children: [
            //                   Icon(Icons.lightbulb_outline),
            //                   SizedBox(width: 3,),
            //                   Text(
            //                     'متوسط',
            //                     style: TextStyle(
            //                         fontWeight: FontWeight.bold,
            //                         fontSize: 24
            //                     ),
            //                   )
            //                 ],
            //               ),
            //               SizedBox(height: 5,),
            //               Text("يمكنك القيام ب 10 ضغط فى المره الواحده",
            //                 style: TextStyle(
            //                     fontSize: 14,
            //                     fontWeight: FontWeight.w400
            //                 ),),
            //
            //             ],
            //           )
            //         ],
            //       ),
            //     ),
            //     SizedBox(height: 3,),
                SkillCard(
                  level: 'محترف',
                  description: "يمكنك القيام ب 5 ضغط فى المرة الواحدة",
                     iconPath: 'assets/Accesories.png',
                  isSelected: _selectedSkillLevel == 'محترف',
                  onSelect: _selectSkillLevel,
                  selectedBackgroundColor: Color(0xFFE6F1FF),
                  selectedBorderColor: Color(0xFF9BBFFE),
                ),
                NextButton(onPressed: _submitSkillLevel)
              ],
            )
            ,

          ],
        ),
      ),
    );
  }
}
