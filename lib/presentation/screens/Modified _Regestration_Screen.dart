import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/presentation/widgets/phone.dart';

class ModifiedRegestrationScreen extends StatelessWidget {
  const ModifiedRegestrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.only(left: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
             Text("أكمل التسجيل",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            Text("أكمل أنشاء حسابك بإدخال البيانات ادناه",style: TextStyle(fontSize: 18),),
            SizedBox(height: 30,),
            Text("رقم الهاتف"),
            PhoneNumberInput()
          ],
        ),
      ),
    );
  }
}
