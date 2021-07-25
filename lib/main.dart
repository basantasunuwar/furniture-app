import 'package:flutter/material.dart';
import 'package:furniture_app/Ui/FurnitureHome.dart';

void main(List<String> args) {
  runApp(FurnitureApp());
}

class FurnitureApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Furniture App",
      debugShowCheckedModeBanner: false,
      home: FurnitureHome(),
    );
  }
}
