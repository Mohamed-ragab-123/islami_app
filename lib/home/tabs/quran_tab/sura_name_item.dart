import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuraNameItem extends StatelessWidget {

  int index;
  String ayaNum;
  String arName;
  String enName;

   SuraNameItem(
       {super.key,required this.index,
         required this.arName,
         required this.enName,
         required this.ayaNum,
       });

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
                "$index",
                style: GoogleFonts.elMessiri(
                    color: Colors.white,
                    fontSize:20,
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
              enName,
              style: GoogleFonts.elMessiri(
                  color: Colors.white,
                  fontSize:16,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "$ayaNum Verses",
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
          arName,
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
