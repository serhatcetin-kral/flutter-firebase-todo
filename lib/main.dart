import 'package:firebasetodo/Auth/authscreen.dart';
import 'package:flutter/material.dart';
import 'home.dart';
void main()=> runApp(MyApp());


class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.light,primaryColor: Colors.purple),
      home:AuthScreen(),
      debugShowCheckedModeBanner: false,

    );
  }
}

