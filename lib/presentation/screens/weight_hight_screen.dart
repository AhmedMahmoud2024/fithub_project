
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/presentation/widgets/next_Button.dart';
import 'package:whatsapp_clone/presentation/widgets/weight_height_widget.dart';


class WeightHightScreen extends StatelessWidget {
  const WeightHightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
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
                'الخطوة 2',
                textAlign: TextAlign.right,
                style: TextStyle(  color: Color(0xFF919FB6),fontSize: 14,fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10,),
              Text(
                'طولك ووزنك',
                textAlign: TextAlign.right,
                style: TextStyle( fontSize: 28,fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6,),
              Text(
                'لنمنحك تجربة أكثر تخصيصًا، نحتاج إلى معرفة المزيد عنك',
                textAlign: TextAlign.right,
                style: TextStyle(  color: Color(0xFF919FB6),fontSize: 16,fontWeight: FontWeight.w400,),
              ),
              SizedBox(height: 20,),
           WeightHeightWidget(label: 'وزن', unit: 'كحم', controller: TextEditingController(),),
              SizedBox(height: 6,),
              WeightHeightWidget(label: 'طول', unit: 'م', controller: TextEditingController(),),
            NextButton(onPressed: (){})
            ],
          )
          ,

        ],
      ),
    );
  }
}
