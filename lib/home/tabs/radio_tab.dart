import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,

      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [Text("4",style: TextStyle(fontSize: 60,color: Colors.black),)],
      ),
    ),);
  }
}
