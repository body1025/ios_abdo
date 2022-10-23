import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:timer_test/settimer.dart';

class text22 {
  final form = GlobalKey<FormState>();
  TextEditingController _toffpine1 = TextEditingController();

  void anaxx() {
    Container(
      child: Form(
        key: form,
        child: TextFormField(
          controller: _toffpine1,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            filled: true,
            hintText: " Time OFF ",
            hintStyle: TextStyle(color: Colors.indigo[900]),
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
    );
  }
}
