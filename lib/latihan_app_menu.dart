import 'package:flutter/material.dart';

class LatihanAppMenu extends StatelessWidget {
  const LatihanAppMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomIconColumn(icon: Icons.call, label: 'CALL'),
            CustomIconColumn(icon: Icons.near_me, label: 'ROUTER'),
            CustomIconColumn(icon: Icons.share, label: 'SHARE'),
          ],
        ),
      ),
    );
  }
}

// Menggunakan Function Parameter di Stateless widget
class CustomIconColumn extends StatelessWidget {
  // Inisiasi variable
  final IconData icon;
  final String label;
  final Color color;
  final double iconSize;
  final FontWeight labelFontWeight;

  CustomIconColumn({
    required this.icon,
    required this.label,
    this.color = Colors.blue,
    this.iconSize = 24.0,
    this.labelFontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          icon,
          color: color,
          size: iconSize,
        ),
        Container(
          child: Text(
            label,
            style: TextStyle(
              color: color,
              fontWeight: labelFontWeight,
            ),
          ),
        ),
      ],
    );
  }
}
