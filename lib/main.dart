import 'package:flutter/material.dart';
import 'package:calculator_app/screens/home_screen.dart' ;

void main () {
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold (
          backgroundColor: Colors.black,
          body: HomeScreen()
        ),
      )
    ),
  );
}