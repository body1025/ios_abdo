import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'dart:async';

class stat extends StatefulWidget {
  const stat({Key? key}) : super(key: key);

  @override
  State<stat> createState() => _statState();
}

class _statState extends State<stat> {
  Material mychartItems(String title, String pin1of) {
    String s = 'OFF';

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20.0),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(1.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 23.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87),
                    ),
                  ]),

              Row(
                children: [
                  StreamBuilder(
                      stream: _relay1off.stream,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          var content = snapshot.data;

                          return Padding(
                            padding: const EdgeInsets.only(left: 170, top: 25),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Chip(
                                    avatar: Icon(Icons.access_alarm),
                                    backgroundColor: Colors.blue[300],
                                    label: Text(
                                      'Ssss.off',
                                      style: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 23.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }
                        //-----------------------------------------

                        if (snapshot.connectionState != ConnectionState.done) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 170, top: 25),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Chip(
                                    avatar: Icon(
                                      Icons.timer_off,
                                      size: 30,
                                    ),
                                    backgroundColor: Colors.blue[300],
                                    label: Text(
                                      '000 S.off',
                                      style: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 23.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }

                        return Text("Agin Man");
                      }),
                ],
              ),

              //-------------------------------------

              StreamBuilder(
                  stream: _relay1on.stream,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      var content = snapshot.data;
                      return Padding(
                        padding: const EdgeInsets.only(
                            right: 150, top: 30, bottom: 30),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Chip(
                                avatar: Icon(Icons.access_alarm),
                                backgroundColor: Colors.blue[300],
                                label: Text(
                                  'Ssss.ON',
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 23.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }
                    //-----------------------------------------

                    if (snapshot.connectionState != ConnectionState.done) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 170, top: 25),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Chip(
                                avatar: Icon(
                                  Icons.timer_off,
                                  size: 30,
                                ),
                                backgroundColor: Colors.blue[300],
                                label: Text(
                                  '000 S.ON',
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 23.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return Text("Agin Man222");
                  }),

              //-----------------------------

              Padding(
                padding: EdgeInsets.only(top: 5),
                child: StreamBuilder(
                  stream: _statemodepin1.stream,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    var data2 = [
                      0.0,
                      0.0,
                      3.0,
                      3.0,
                      0.0,
                      0.0,
                      3.0,
                      3.0,
                      0.0,
                      0.0,
                      3.0,
                      3.0,
                      0.0,
                      0.0,
                      0.0
                    ];
                    //---------------------     hasdata
                    if (snapshot.hasData) {
                      var content = snapshot.data;
                      if (content == 'OFF') {
                        s = 'OFF';

                        data2 = [
                          3.0,
                          3.0,
                          3.0,
                          3.0,
                          3.0,
                          3.0,
                          3.0,
                          0.0,
                          0.0,
                          0.0,
                          0.0,
                          0.0,
                          0.0,
                          0.0,
                          0.0
                        ];
                      }
                      if (content == 'ON ') {
                        s = 'ON';

                        data2 = [
                          0.0,
                          0.0,
                          0.0,
                          0.0,
                          0.0,
                          0.0,
                          3.0,
                          3.0,
                          3.0,
                          3.0,
                          3.0,
                          3.0,
                          3.0
                        ];
                      } else {}

                      return Container(
                        child: Column(children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(1.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(right: 70.0),
                                  child: Text(
                                    s,
                                    style: TextStyle(
                                      fontSize: 30.0,
                                      color: s == 'OFF'
                                          ? Colors.redAccent
                                          : Colors.greenAccent,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Sparkline(
                            data: data2,
                            fillMode: FillMode.below,
                            fillColor: Colors.lightBlue,
                            lineWidth: 5,
                            pointSize: 13,
                            sharpCorners: true,
                            lineGradient: LinearGradient(colors: [
                              Colors.black,
                              Colors.lightBlue,
                              Colors.black,
                            ]),
                            pointColor: Colors.green,
                          ),
                        ]),
                      );
                    }
                    //----------------------------
                    if (snapshot.connectionState != ConnectionState.done) {
                      return Sparkline(
                        data: data2,
                        fillMode: FillMode.below,
                        fillColor: Colors.lightBlue,
                        lineWidth: 5,
                        sharpCorners: true,
                        lineGradient: LinearGradient(colors: [
                          Colors.black,
                          Colors.lightBlue,
                          Colors.black,
                        ]),
                      );
                    }

                    return Text("Agin Man333");
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  StreamController _relay1off = StreamController();
  StreamController _relay1on = StreamController();
  StreamController _statemodepin1 = StreamController();

  Future relay1off() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.4.1/tofpl'));
      if (response.statusCode == 200) {
        _relay1off.add(response.body);
        return (response.body);
      }
    } catch (_) {}
  }

  Future relay1on() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.4.1/tonpl'));
      if (response.statusCode == 200) {
        _relay1on.add(response.body);
        return (response.body);
      }
    } catch (_) {}
  }

  Future statemodepin1() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.4.1/worknew'));
      if (response.statusCode == 200) {
        _statemodepin1.add(response.body);
        return (response.body);
      }
    } catch (_) {}
  }

  @override
  void initState() {
    _relay1off = StreamController();
    _relay1on = StreamController();

    _statemodepin1 = StreamController();

    try {
      Timer.run(() {
        relay1off();
      });
      Timer.run(() {
        relay1on();
      });
    } catch (_) {}
    try {
      Timer.periodic(Duration(seconds: 1), (_) => statemodepin1());
    } catch (_) {}

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        title: Text(
          'State',
          style: TextStyle(fontSize: 50),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.red,
              Colors.indigo,
              Colors.blue,
              Colors.blue,
            ],
          ),
        ),
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                    width: double.infinity,
                    height: 500,
                    decoration: BoxDecoration(
                      border: Border.all(width: 20, color: Colors.black87),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: mychartItems('State Pin1', '')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
