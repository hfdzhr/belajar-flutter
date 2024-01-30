import 'package:flutter/material.dart';

class LatihanGridCount extends StatelessWidget {
  const LatihanGridCount({super.key});

  @override
  Widget build(BuildContext context) {
    var data = 1; // Inisiasi count grid
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(
          9,
          (index) => Container(
                child: Card(
                  color: Colors.yellow,
                  child: Center(child: Text('${data++}')),
                ),
              )),
    );
  }
}
