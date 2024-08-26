import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  String userName='asd';
  HomeScreen({super.key, required this.userName });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title : Text("Home"),


      ),
      
      
      body : Center(child: Text("Bienvenido $userName"),)



    );
  }
}