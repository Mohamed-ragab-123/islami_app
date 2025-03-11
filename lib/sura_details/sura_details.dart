import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/model/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
   const SuraDetailsScreen({super.key});

  static const String routeName = "SuraDetails";

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {

    var model = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if(verses.isEmpty){
      loadSuraFile(model.index+1);
    }

    return Scaffold(
      backgroundColor: const Color(0xFF202020),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          model.enName,
      ),
        titleTextStyle: GoogleFonts.elMessiri(
          color: const Color(0xFFE2BE7F,),
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Color(0xFFE2BE7F,),
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset("assets/images/details_bg.png",
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: Text(
                  model.arName,
                  style: GoogleFonts.elMessiri(
                  color: const Color(0xFFE2BE7F,),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 42),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 120),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: const Color(0xFFE2BE7F,),),
                          ),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text.rich(
                              textAlign: TextAlign.center,
                              TextSpan(
                                  children: [
                                    TextSpan(
                                      text : "${verses[index]} ",
                                      style: GoogleFonts.elMessiri(
                                        color: const Color(0xFFE2BE7F,),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text : "(${index + 1})",
                                      style: GoogleFonts.elMessiri(
                                        color: const Color(0xFFE2BE7F,),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                              ),
                            ),
                          ),
                        );
                        },
                    separatorBuilder: (context, index) => const SizedBox(height: 8),
                    itemCount: verses.length,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  loadSuraFile(int index) async {
    String file = await rootBundle.loadString("assets/files/Suras/$index.txt");
    List<String> lines = file.split("\n");
    verses = lines;
    setState(() {});
  }
}
