import 'package:flutter/material.dart';

class Post {
  final String time1;
  final String time2;

  Post(this.time1, this.time2);

  Map tomap() {
    //عمل دالة نوع map علشان يكون عندي اسم  متغير وقيمتة
    var map = Map<String,
        dynamic>(); //تعريف متغير ياخد من نوع map نوع المتغير نص وقيمتة ممكن تكون اي شئ
    map["name1"] = time1; //name1=3  اسم المتغير الذي يتم ارسال
    map["name2"] =
        time2; //time2قيمتة المتغير علشان  نضع القيمة من الادخال المستخدم

    return map; //ترجع متغير بنوع الارسال
  }
}
