import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Latihan Navigation'),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                    buttonText: 'Tugas Grid View', routeName: '/tugasgrid'),
                CustomButton(
                    buttonText: 'Tugas List View', routeName: '/tugaslist')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(buttonText: 'Grid View', routeName: '/gridview'),
                CustomButton(buttonText: 'List View', routeName: '/listview')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(buttonText: 'Grid Count', routeName: '/gridcount'),
                CustomButton(buttonText: 'List View 2', routeName: '/listview2')
              ],
            ),
          ],
        ));
  }
}

class CustomButton extends StatelessWidget {
  final String buttonText;
  final String routeName;

  CustomButton({required this.buttonText, required this.routeName});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 100,
        width: 200,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.blue)),
          onPressed: () {
            Navigator.pushNamed(context, routeName);
          },
          child: Container(
            child: Text(
              buttonText,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
