import 'dart:convert';

import 'package:belajar_flutter/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:belajar_flutter/main.dart'; // Import your main file or wherever your app's navigation is defined

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _logout(context);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: _getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            var user = snapshot.data;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Text(
                  user['email']!
                ),
                SizedBox(height: 10),
                // Text(
                //   // user['email'], // Replace with your user data
                //   style: TextStyle(fontSize: 16),
                // ),
              ],
            );
          }
        },
      ),
    );
  }

  Future<Map<String, dynamic>> _getUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? userDataString = localStorage.getString('user');
    return json.decode(userDataString!);
  }

  void _logout(BuildContext context) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('token');
    localStorage.remove('user');

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (context) => Login()), // Replace with your login screen
      (Route<dynamic> route) => false,
    );
  }
}
