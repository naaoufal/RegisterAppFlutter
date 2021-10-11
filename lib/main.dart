import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterSection(),
    );
  }
}

class RegisterSection extends StatelessWidget {
  var name;
  var email;
  var password;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // ignore: prefer_const_constructors
      navigationBar: CupertinoNavigationBar(
        automaticallyImplyLeading: false,
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CupertinoTextField(
                placeholder: "Enter Your Name",
                onChanged: (value) {
                  name = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CupertinoTextField(
                placeholder: "Enter Your Email",
                onChanged: (value) {
                  email = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CupertinoTextField(
                placeholder: "Enter Your Password",
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
              ),
            ),
            FlatButton.icon(
              onPressed: () {
                print(name);
                print(email);
                print(password);
                saveUser(name, email, password);
              },
              icon: Icon(Icons.save),
              label: Text("Register"),
            )
          ],
        ),
      ),
    );
  }
}

saveUser(name, email, password) async {
  var url = "http://192.168.1.2:3001/api/users/add";
  final http.Response response = await http.post(
    url,
    headers: <String, String>{'Content-Type': 'application/json'},
    body: jsonEncode(
        <String, String>{'name': name, 'email': email, 'password': password}),
  );

  // check if response is ok :
  print(response);
}
