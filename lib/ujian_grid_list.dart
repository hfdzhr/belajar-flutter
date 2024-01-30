import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UjianGridList extends StatelessWidget {
  UjianGridList({super.key});

  var data = 1;
  final List<String> character = [
    'rudy',
    'reg',
    'snap',
    'penny',
    'trina',
    'queen'
  ];
  final List<String> gallery = [
    'season_1',
    'season_2',
    'maps',
    'city',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(child: Image.asset('assets/img/Chalkzone_Logo.webp')),
          Text(
            'Karakter',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
          ),
          Container(
            height: 435,
            width: 435,
            child: GridView.count(
              crossAxisCount: 2,
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  character.length,
                  (index) => Container(
                        child: Card(
                          color: Colors.yellow,
                          child: Center(
                              child: Image.asset(
                                  'assets/img/${character[index]}.webp')),
                        ),
                      )),
            ),
          ),
          Text(
            'Gallery',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
          ),
          Container(
            child: Column(
              children: List.generate(
                  gallery.length,
                  (index) => Container(
                        margin: EdgeInsets.all(10),
                        child: Center(
                          child:
                              Image.asset('assets/img/${gallery[index]}.webp'),
                        ),
                      )),
            ),
          )
        ],
      ),
    );
  }
}
