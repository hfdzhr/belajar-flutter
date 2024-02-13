import 'dart:convert';
import 'package:belajar_flutter/providers/api.dart';
import 'package:belajar_flutter/screens/list_fauna_screen.dart';
import 'package:belajar_flutter/screens/profile_screen.dart';
import 'package:belajar_flutter/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  var _isLoading = false;
  bool _isObscure = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void initState() {
    emailController.text = '';
    passwordController.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  'QuickGrocer',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 32),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Input your email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock_outlined),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    )),
                obscureText: _isObscure, // hide password input
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Input your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  _submit();
                },
                child: Text('Login'),
              ),
              SizedBox(height: 16),
              RegisterLink(),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      _formKey.currentState!.save();
      String email = emailController.text;
      String password = passwordController.text;

      var data = {'email': email, 'password': password};

      var res = await Api().auth(data, '/users/login');

      var body = json.decode(res.body);
      _formKey.currentState!.save();

      if (res.statusCode == 200) {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', json.encode(body['data']['token']));
        localStorage.setString('user', json.encode(body['data']['user']));
        Navigator.pushReplacement(
          context,
          new MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
      } else {
        setState(() {
          _isLoading = false;
        });
      }

      // Perform login logic here, such as sending the email and password to a server.
    }
  }
}

class RegisterLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the registration screen.
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Register()),
        );
      },
      child: RichText(
        text: TextSpan(
          text: 'Don\'t have an account? ',
          children: [
            TextSpan(
                text: 'Register here',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
