import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/model/sura_model.dart';

class SuraNameItem extends StatelessWidget {

  SuraModel model;

  SuraNameItem(
      {super.key, required this.model,});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            const ImageIcon(
                AssetImage(
                    "assets/images/sura_num.png",
                ),
              color: Colors.white,
              size: 52,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                "${model.index+1}",
                style: GoogleFonts.elMessiri(
                    color: Colors.white,
                    fontSize:16,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.enName,
              style: GoogleFonts.elMessiri(
                  color: Colors.white,
                  fontSize:16,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "${model.ayaNum} Verses",
              style: GoogleFonts.elMessiri(
                  color: Colors.white,
                  fontSize:16,
                  fontWeight: FontWeight.bold
              ),
            ),

          ],
        ),
        const Spacer(),
        Text(
          model.arName,
          style: GoogleFonts.elMessiri(
              color: Colors.white,
              fontSize:16,
              fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
