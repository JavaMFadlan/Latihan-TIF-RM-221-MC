

  import 'package:flutter/material.dart';
  import 'package:http/http.dart' as http;
  import 'dart:convert';
  
  import 'user.dart';
  import 'home_page.dart';
  
  class LoginPage extends StatefulWidget {
    @override
    _LoginPageState createState() => _LoginPageState();
  }
  
  class _LoginPageState extends State<LoginPage> {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
  
    Future<User?> loginUser(String email, String password) async {
      final response = await http.get(Uri.parse('https://dummyjson.com/users'));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body)['users'];
        print(jsonData);
        for (var user in jsonData) {
          if (user['email'] == email && user['password'] == password) {
            return User.fromJson(user);
          }
        }
      }
      return null;
    }
  
    void handleLogin() async {
      String email = emailController.text;
      String password = passwordController.text;
  
      User? user = await loginUser(email, password);
  
      if (user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(user: user),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Login Gagal'),
            content: Text('Email atau password salah.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: handleLogin,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      );
    }
  }