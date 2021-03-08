import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text(""),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: Center(
            child: Text(
              "Hello Flutter",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40.0,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  color: Colors.red
              ),
            ),
          ),
          backgroundColor: Colors.black,

        ),
      )
  );
}