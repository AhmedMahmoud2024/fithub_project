
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/gender_widget.dart';

class GenderSelection extends StatelessWidget {
  const GenderSelection({super.key});

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
                'الخطوة 1',
                textAlign: TextAlign.right,
                style: TextStyle(  color: Color(0xFF919FB6),fontSize: 14,fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10,),
              Text(
                'اى واحد من هؤلاء انت؟',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6,),
              Text(
                'لنمنحك تجربة أكثر تخصيصًا، نحتاج إلى معرفة المزيد عنك',
                textAlign: TextAlign.right,
                style: TextStyle(  color: Color(0xFF919FB6),fontSize: 16,fontWeight: FontWeight.w400,),
              ),
              SizedBox(height: 20,),
              GenderSelectionWidget()
              // Container(
              //   width: 800,
              //   height: 174,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     CircleAvatar(
              //       radius: 60,
              //       backgroundImage: AssetImage("Accesories.png"),
              //     ),
              //     SizedBox(height: 15,),
              //     Text(
              //       'ذكر',
              //       textAlign: TextAlign.center,
              //       style: TextStyle(
              //         color: Color(0xFF101C2D),
              //         fontSize: 18,
              //       //  fontFamily: 'Poppins',
              //         fontWeight: FontWeight.w600,
              //         height: 0.06,
              //       ),
              //     )
              //   ],
              // ),
              // ),
              // SizedBox(height: 6,),
              // Container(
              //   width: 800,
              //   height: 174,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       CircleAvatar(
              //         radius: 60,
              //         backgroundImage: AssetImage("assets/Accesories.png"),
              //       ),
              //       SizedBox(height: 15,),
              //       Text(
              //         'أنثى',
              //         textAlign: TextAlign.center,
              //         style: TextStyle(
              //           color: Color(0xFF101C2D),
              //           fontSize: 18,
              //           //  fontFamily: 'Poppins',
              //           fontWeight: FontWeight.w600,
              //           height: 0.06,
              //         ),
              //       )
              //     ],
              //   ),
              // ),
            ],
          )
        ,

        ],
      ),
    );
  }
}
