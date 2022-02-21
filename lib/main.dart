import 'package:flutter/material.dart';
import 'package:world_clock_flutter/screen/home.dart';
import 'package:world_clock_flutter/screen/chose_location.dart';
import 'package:world_clock_flutter/screen/loading.dart';
void main() {
  runApp(MaterialApp(
    // initialRoute: '/choseLocation',
    routes: {
      '/': (context) => Home(),
      '/loading': (context) => Loading(),
      '/choseLocation': (context) => ChoseLocation(),
    },
  ));
}

