import 'package:flutter/material.dart';
import 'package:islami_app/home/tabs/hadith_tab.dart';
import 'package:islami_app/home/tabs/quran_tab/quran_tab.dart';
import 'package:islami_app/home/tabs/radio_tab.dart';
import 'package:islami_app/home/tabs/sebiha_tab.dart';
import 'package:islami_app/home/tabs/time_tab.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key});

  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image:
          DecorationImage(
            image: AssetImage("assets/images/${getBackgroundName(selectedIndex)}.png"),
              fit:BoxFit.cover),),
        child: Scaffold(
      backgroundColor: Colors.transparent,
bottomNavigationBar: BottomNavigationBar(backgroundColor:
const Color(0xFFE2BE7F)
    ,type:
BottomNavigationBarType.fixed,
    showSelectedLabels: true,
    showUnselectedLabels: false,
    selectedItemColor: Colors.white,
    unselectedItemColor: const Color(0xFF202020),
    currentIndex: selectedIndex,
onTap: (value) {
  selectedIndex=value;
  setState(() {

  });
},
    items: [
  BottomNavigationBarItem(icon:_buildNavItem("ic_quran",0),label: "Quran",),
  BottomNavigationBarItem(icon: _buildNavItem("ic_hadith",1),label: "Hadith"),
  BottomNavigationBarItem(icon: _buildNavItem("ic_sebiha",2),label: "Sebiha"),
  BottomNavigationBarItem(icon: _buildNavItem("ic_radio",3),label: "Radio"),
  BottomNavigationBarItem(icon: _buildNavItem("ic_time",4),label: "Time"),]),
          body: Column(
            children: [
              const SizedBox(height: 30),
              Image.asset("assets/images/onboarding_header.png"),
              Expanded(child: tabs[selectedIndex]),

            ],
          ),
    ),);
  }

  List<Widget> tabs=[
    const QuranTab(),
    const HadithTab(),
    const SebihaTab(),
    const RadioTab(),
    const TimeTab(),
  ];

  String getBackgroundName(int index){
    switch(index){
      case 0:
        return "home_bg";
      case 1:
        return "hadith_bg";
      case 2:
        return "sebiha_bg";
      case 3:
        return "radio_bg";
      case 4:
        return "time_bg";
      default:
        return "home_bg";
    }
  }

Widget _buildNavItem(String imageName,int index){
    return selectedIndex==index?Container(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 6),
      decoration:
      BoxDecoration(

        borderRadius:
        BorderRadius.circular(66),
        color: const Color(0x99202020),
      ),
      child: ImageIcon(
        AssetImage(
            "assets/images/$imageName.png"),),)
        :ImageIcon(
      AssetImage(
          "assets/images/$imageName.png"),);
}

}
