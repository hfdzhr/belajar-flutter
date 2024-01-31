import 'package:flutter/material.dart';

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nextgen Halaman 1'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue)),
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: Text(
                'Text pergi ke halaman 2',
                style: TextStyle(color: Colors.white),
              ))),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nextgen Halaman 2'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
          child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Kembali',
                style: TextStyle(color: Colors.white),
              ))),
    );
  }
}
