
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/presentation/widgets/next_Button.dart';
import 'package:whatsapp_clone/presentation/widgets/weight_height_widget.dart';


class SkillLevelScreen extends StatelessWidget {
  const SkillLevelScreen({super.key});

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
                SizedBox(height: 20,),
            Container(
              width: double.infinity,
              height: 100,
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.lightbulb_outline),
                          SizedBox(width: 3,),
                          Text(
                            'مبتدئ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 5,),
                      Text("يمكنك القيام ب 5 ضغط فى المره الواحده",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                      ),),

                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 3,),
                Container(
                  width: double.infinity,
                  height: 100,
                  child: ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.lightbulb_outline),
                              SizedBox(width: 3,),
                              Text(
                                'متوسط',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 5,),
                          Text("يمكنك القيام ب 10 ضغط فى المره الواحده",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                            ),),

                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 3,),
                Container(
                  width: double.infinity,
                  height: 100,
                  child: ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.fireplace_outlined),
                              SizedBox(width: 3,),
                              Text(
                                'محترف',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 5,),
                          Text("يمكنك القيام ب 15 ضغط فى المره الواحده",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                            ),),

                        ],
                      )
                    ],
                  ),
                ),
            //    WeightHeightWidget(label: 'وزن', unit: 'كحم', controller: TextEditingController(),),
             //   SizedBox(height: 6,),
              //  WeightHeightWidget(label: 'طول', unit: 'م', controller: TextEditingController(),),
                NextButton(onPressed: (){})
              ],
            )
            ,

          ],
        ),
      ),
    );
  }
}
