import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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