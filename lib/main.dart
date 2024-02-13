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
import 'package:belajar_flutter/screens/detail_fauna_screen.dart';
import 'package:belajar_flutter/screens/form_screen.dart';
import 'package:belajar_flutter/screens/list_fauna_screen.dart';
import 'package:belajar_flutter/screens/login_screen.dart';
import 'package:belajar_flutter/screens/register_screen.dart';
import 'package:belajar_flutter/ujian_grid_list.dart';
import 'package:belajar_flutter/ujian_list_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

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
      home: CheckAuth(),
    );
  }
}

class CheckAuth extends StatefulWidget {
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;

  @override
  void initState() {
    super.initState();
    _checkIfLoggedIn();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      if (mounted) {
        setState(() {
          isAuth = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isAuth) {
      child = ListFaunaScreen();
    } else {
      child = Login();
    }

    return Scaffold(
      body: child,
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
