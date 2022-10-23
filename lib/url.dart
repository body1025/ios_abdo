import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:timer_test/settimer.dart';

class abdourl {
  get context => context;

  String? url;

  String? url111;
  String? url222;
  String? url3333;
  String? url44444;

  creatpost(String url, {required Map body}) async {
    //في استدعاء الدالة يرسل urlو bodyبشكل map
    try {
      return http.post(url, body: body).then((http.Response response) {
        //ترجع ارسال عن طريق post وurl and body
        final int statusCode = response
            .statusCode; //اذا تم .then اعمل كائن من كلاس الرد علشان ناخد منة دالة حالة الرد
        print(
            statusCode); // المتغير بة حالة الرد اذا 200نجاج 400فشل اعرض الحالة
        if (statusCode == 400) {
        } else if (statusCode == 200) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => stat()));
        } else {
          showSnack2();
        }
      });
    } catch (_) {
      showSnack2();
    }
  }

  showSnack1() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: Colors.white70,
            title: Text(
              'Error : min = 1 Second ,max = 43200 Second ',
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            elevation: 1,
            content: Icon(
              Icons.error,
              size: 90,
              color: Colors.black,
            ),
            actions: <Widget>[
              FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Exit',
                ),
                backgroundColor: Colors.black,
                mini: true,
              ),
            ],
          );
        });
  }

  showSnack2() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: Colors.white,
            title: Text(
              'Error :Error No Connection  ',
              style: TextStyle(fontSize: 30),
            ),
            elevation: 1,
            content: Icon(
              Icons.cast,
              color: Colors.black,
              size: 90,
            ),
            actions: <Widget>[
              FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Exit'),
                backgroundColor: Colors.black,
                mini: true,
              )
            ],
          );
        });
  }
}
