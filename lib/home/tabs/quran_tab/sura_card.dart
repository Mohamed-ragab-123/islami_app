import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/model/sura_model.dart';

class SuraCard extends StatelessWidget {

  SuraModel model;

  SuraCard(
      {super.key, required this.model,});

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
                model.enName,
                style: GoogleFonts.elMessiri(
                    color: const Color(0xFF202020),
                    fontSize:24,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 8),
              Text(
                model.arName,
                style: GoogleFonts.elMessiri(
                    color: const Color(0xFF202020),
                    fontSize:24,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "${model.ayaNum} Verses",
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
