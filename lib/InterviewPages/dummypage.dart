import 'package:flutter/material.dart';

class dummy extends StatelessWidget {
  Map<String,dynamic> data;
  dummy({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Text(data.toString())),
    );
  }
}