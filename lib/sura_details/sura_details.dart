import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(
        title: Text(
          model.enName,
      ),
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
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
                  style: Theme.of(context).textTheme.titleLarge,
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
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          child: Text.rich(
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.center,
                            TextSpan(
                                children: [
                                  TextSpan(
                                    text : "${verses[index]} ",
                                    style: Theme.of(context).textTheme.titleMedium,
                                  ),
                                  TextSpan(
                                    text : "(${index + 1})",
                                    style: Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
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
    List<String> lines = file.trim().split("\n");
    verses = lines;
    setState(() {});
  }
}
