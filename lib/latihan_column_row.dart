import 'package:flutter/material.dart';

class LatihanColumnRow extends StatelessWidget {
  const LatihanColumnRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 350,
              height: 40,
              color: Colors.black,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 10),
              child: Text(
                'Home',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 150,
              width: 150,
              color: Colors.black,
              child: Container(
                margin: EdgeInsets.all(30),
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxd5SkzuxQLMFqZHeaDM-CYe2fcKEWetMA3Q&usqp=CAU',
                  fit: BoxFit.cover,
                ),
                color: Colors.amber,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 150,
              width: 150,
              color: Colors.black,
              child: Container(
                margin: EdgeInsets.all(30),
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/e/ee/Cameo-Logo.png',
                  fit: BoxFit.cover,
                ),
                color: Colors.amber,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 350,
                height: 150,
                color: Colors.black,
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCcl0kVD7_YqbS_CcM4G_SYYrV0FKth9ONRA&usqp=CAU',
                          fit: BoxFit.cover,
                        )),
                    Text('Halo ahdksjhda',
                        style: TextStyle(color: Colors.white)),
                  ],
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 350,
                height: 150,
                color: Colors.black,
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Image.asset('assets/img/logo.webp'),
                    ),
                    Text('Halo ahdksjhda',
                        style: TextStyle(color: Colors.white)),
                  ],
                )),
          ],
        )
      ],
    );
  }
}
