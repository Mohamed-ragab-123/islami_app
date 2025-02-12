import 'package:flutter/material.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("5",style: TextStyle(fontSize: 60,color: Colors.black),)],
      ),
    ),);
  }
}
