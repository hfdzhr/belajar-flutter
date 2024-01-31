// import 'package:belajar_flutter/column_widget.dart';
// import 'package:belajar_flutter/latihan_app_menu.dart';
// import 'package:belajar_flutter/latihan_list_view.dart';
// import 'package:belajar_flutter/latihan_list_view_2.dart';
// import 'package:belajar_flutter/latihan_list_view_3.dart';
// import 'package:belajar_flutter/latihan_list_view_4.dart';
// import 'package:belajar_flutter/ujian_list_view.dart';
import 'package:belajar_flutter/grid_build.dart';
import 'package:belajar_flutter/grid_count.dart';
import 'package:belajar_flutter/grid_view.dart';
import 'package:belajar_flutter/latihan_list_view.dart';
import 'package:belajar_flutter/latihan_list_view_2.dart';
import 'package:belajar_flutter/navigation/home.dart';
import 'package:belajar_flutter/navigation/latihan_navigation.dart';
import 'package:belajar_flutter/ujian_grid_list.dart';
import 'package:belajar_flutter/ujian_list_view.dart';
import 'package:flutter/material.dart';

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
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
          '/tugasgrid': (context) => UjianGridList(),
          '/tugaslist': (context) => UjianListView(),
          '/gridview': (context) => LatihanGridView(),
          '/listview': (context) => LatihanListView(),
          '/gridcount': (context) => LatihanGridCount(),
          '/listview2': (context) => LatihanListView2()
        });
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

class BottomNavigationExample extends StatefulWidget {
  const BottomNavigationExample({super.key});

  @override
  State<BottomNavigationExample> createState() =>
      _BottomNavigationExampleState();
}

class _BottomNavigationExampleState extends State<BottomNavigationExample> {
  int _selectedTab = 0;

  List _pages = [
    Center(
      child: UjianGridList(),
    ),
    Center(
      child: Text("About"),
    ),
    Center(
      child: Text("Products"),
    ),
    Center(
      child: Text("Contact"),
    ),
    Center(
      child: Text("Settings"),
    ),
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedTab,
      onTap: (index) => _changeTab(index),
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "About"),
        BottomNavigationBarItem(
            icon: Icon(Icons.grid_3x3_outlined), label: "Product"),
        BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail), label: "Contact"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ],
    );
  }
}
