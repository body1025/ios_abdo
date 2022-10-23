import 'package:flutter/material.dart';
import 'package:timer_test/settimer.dart';
import 'package:timer_test/json.dart';
import 'package:timer_test/main.dart';
import 'text22.dart';
import 'url.dart';

import 'json.dart';
import 'settimer.dart';
import 'package:http/http.dart' as http;
import 'package:nice_button/NiceButton.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: "PlayfairDisplay"),
    home: Apptimer(),
  ));
}

class Apptimer extends StatefulWidget {
  @override
  _ApptimerState createState() => _ApptimerState();
}

class _ApptimerState extends State<Apptimer> {
  var tito = abdourl();
  var abdo = text22();

  String url = "http://192.168.4.1/pinl.ton.loop";
  String url1 = "http://192.168.4.1/pinl.ton.oneonly";
  TextEditingController _toffpine1 = TextEditingController();
  TextEditingController _tonpin1 = TextEditingController();
  final form = GlobalKey<FormState>();
  final form1 = GlobalKey<FormState>();

  //------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text(
          'Esp8266 & App ',
          style: TextStyle(
            fontSize: 35,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 90),
              child: NiceButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => stat()));
                },
                text: 'State',
                width: 150,
                icon: Icons.timeline,
                fontSize: 23,
                elevation: 8.0,
                radius: 10.0,
                textColor: Colors.white,
                gradientColors: [
                  Colors.indigo,
                  Colors.lightBlueAccent,
                  Colors.indigo,
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: EdgeInsets.all(13),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Form(
                                    key: form,
                                    child: TextFormField(
                                      controller: _toffpine1,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        filled: true,
                                        hintText: " Time OFF ",
                                        hintStyle: TextStyle(
                                            color: Colors.indigo[900]),
                                        icon: Icon(
                                          Icons.access_time,
                                          size: 35,
                                          color: Colors.black,
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'please fill number';
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Form(
                                    key: form1,
                                    child: TextFormField(
                                      controller: _tonpin1,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        filled: true,
                                        hintText: " Time ON ",
                                        hintStyle: TextStyle(
                                            color: Colors.indigo[900]),
                                        icon: Icon(
                                          Icons.access_time,
                                          size: 35,
                                          color: Colors.black,
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'please fill number';
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 70, top: 10),
                            child: Column(children: <Widget>[
                              NiceButton(
                                width: 200,
                                icon: Icons.loop,
                                fontSize: 23,
                                elevation: 8.0,
                                radius: 10.0,
                                text: "Timer Loop",
                                textColor: Colors.white,
                                gradientColors: [
                                  Colors.indigo,
                                  Colors.lightBlueAccent,
                                  Colors.indigo,
                                ],
                                onPressed: () async {},
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              NiceButton(
                                  width: 200,
                                  icon: Icons.plus_one,
                                  fontSize: 23,
                                  elevation: 8.0,
                                  radius: 10.0,
                                  text: "One Only",
                                  textColor: Colors.white,
                                  gradientColors: [
                                    Colors.indigo,
                                    Colors.lightBlueAccent,
                                    Colors.indigo,
                                  ],
                                  onPressed: () async {
                                    try {
                                      if (form1.currentState!.validate() &&
                                          form.currentState!.validate() &&
                                          int.parse(_tonpin1.text) <= 43200 &&
                                          int.parse(_tonpin1.text) > 0 &&
                                          int.parse(_toffpine1.text) <= 43200 &&
                                          int.parse(_toffpine1.text) > 0) {
                                        Post newPost = new Post(
                                          _toffpine1.text,
                                          _tonpin1.text,
                                        );
                                        await tito.creatpost(url1,
                                            body: newPost.tomap());
                                        print(int.parse(_toffpine1.text));
                                        print(int.parse(_tonpin1.text));
                                      } else {
                                        tito.showSnack1();
                                      }
                                    } catch (_) {
                                      tito.showSnack2();
                                    }
                                  }),
                            ]),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
