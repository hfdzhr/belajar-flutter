import 'package:flutter/material.dart';

class UjianListView extends StatelessWidget {
  final List<String> playerName = [
    'viktor',
    'zalnando',
    'fitrul',
    'alberto',
    'ciro',
    'dds',
    'sato',
    'nick'
  ];
  final List<String> judulBerita = [
    'Pemain Persib alami cedera',
    'Teja sedang pemulihan',
    'Bojan uji tanding',
    'David da silva target juara',
    'Latihan pemain persib'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Berita',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 430,
              child: ListView.builder(
                itemCount: judulBerita.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => Container(
                  height: 150,
                  width: 150,
                  margin: EdgeInsets.all(10),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Image.asset('assets/img/persib.png'),
                        Text(
                          '${judulBerita[index]}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white),
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                  ),
                  color: Colors.blue[800],
                ),
              ),
            ),
            Text('Galeri',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            Container(
              child: SizedBox(
                height: 150,
                child: ListView.builder(
                  itemCount: playerName.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.all(10),
                    child: Center(
                        child:
                            Image.asset('assets/img/${playerName[index]}.png')),
                    color: Colors.blue[700],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
