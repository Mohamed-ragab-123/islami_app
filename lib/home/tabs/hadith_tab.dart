import 'package:flutter/material.dart';

class HadithTab extends StatelessWidget {
  const HadithTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [Text("2",style: TextStyle(fontSize: 60,color: Colors.black),)],
          ),
        ],
      ),
    ),);
  }
}
