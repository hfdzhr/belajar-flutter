import 'package:flutter/material.dart';

class LatihanContainer extends StatelessWidget {
  const LatihanContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        color: Colors.blue,
        child: Container(
          child: Container(
            color: Colors.red,
            child: Container(
              color: Colors.black,
              margin: EdgeInsets.all(10),
              child: Container(
                color: Colors.black,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text(
                  'Hafid Al Azhar',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ),);
  }
}
