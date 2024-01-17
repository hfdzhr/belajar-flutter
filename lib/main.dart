import 'package:flutter/material.dart';
import 'latihan_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Belajar Flutter',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Belajar'),
            backgroundColor: Colors.blue[200],
            centerTitle: true,
          ),
          body: LatihanContainer(),
          backgroundColor: Colors.blue[200],
        ));
  }
}

class BelajarHelloWorld extends StatelessWidget {
  const BelajarHelloWorld({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Hello World',
        style: TextStyle(
            fontSize: 26, fontWeight: FontWeight.bold, color: Colors.red),
      ),
    );
  }
}
