import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuraCard extends StatelessWidget {

  String ayaNum;
  String arName;
  String enName;

  SuraCard(
      {super.key,
        required this.arName,
        required this.enName,
        required this.ayaNum,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      decoration:
      BoxDecoration(
        color: const Color(0xFFE2BE7F),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                enName,
                style: GoogleFonts.elMessiri(
                    color: const Color(0xFF202020),
                    fontSize:24,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 8),
              Text(
                arName,
                style: GoogleFonts.elMessiri(
                    color: const Color(0xFF202020),
                    fontSize:24,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "$ayaNum Verses",
                style: GoogleFonts.elMessiri(
                    color: const Color(0xFF202020),
                    fontSize:24,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          Image.asset(
              "assets/images/sura_card.png",
          )
        ],
      ),
    );
  }
}
