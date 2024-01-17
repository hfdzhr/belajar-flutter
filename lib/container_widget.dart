import 'package:belajar_flutter/main.dart';

import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      transform: Matrix4.rotationZ(0.1),
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Colors.black45, Colors.greenAccent]),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black, width: 2)),
      child: BelajarHelloWorld(),
    );
  }
}
