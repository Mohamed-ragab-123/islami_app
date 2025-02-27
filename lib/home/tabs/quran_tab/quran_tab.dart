import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/home/tabs/quran_tab/sura_card.dart';
import 'package:islami_app/home/tabs/quran_tab/sura_name_item.dart';
import 'package:islami_app/model/sura_model.dart';

class QuranTab extends StatefulWidget {
   const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {

  @override

  void initState() {
    super.initState();
    searchController.addListener(onSearch);
  }

   var searchController = TextEditingController();
   onSearch(){
     SuraModel.searchResult.clear();
     String text = searchController.text;
     if (text.isNotEmpty){
       for(String data in SuraModel.arabicQuranSura){
         if(data.contains(text)){
           SuraModel.searchResult.add(data);
         }
       }
     }
     setState(() {});
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _searchItem(),
              const SizedBox(height: 20),
              if (SuraModel.searchResult.isEmpty && searchController.text.isEmpty)
                ...[_suraNameHorizontalList(),],
              const SizedBox(height: 10),
              _suraNameVerticalList(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchItem(){
    return TextField(
      controller: searchController,
      cursorColor: const Color(0xFFE2BE7F),
      style: GoogleFonts.elMessiri(
          color: Colors.white,
          fontSize:20,
          fontWeight: FontWeight.bold
      ),
      decoration: InputDecoration(
        labelText:"Sura Name",
        labelStyle: GoogleFonts.elMessiri(
            color: Colors.white,
            fontSize:16,
            fontWeight: FontWeight.bold
        ),

        prefixIcon:
        Image.asset(
          "assets/images/ic_quran.png",
          color: const Color(0xFFE2BE7F),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xFFE2BE7F),
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xFFE2BE7F),
            width: 2,
          ),
        ),
      ) ,
    );
  }

  Widget _suraNameHorizontalList(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Most Recently ",
          style: GoogleFonts.elMessiri(
              color: Colors.white,
              fontSize:16,
              fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 150,
          child:
          ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return SuraCard(
                model: SuraModel.getSuraModel(index),
              );
            },
            separatorBuilder:
                (context, index) => const SizedBox(width: 10),
            itemCount: SuraModel.length,
          ),
        ),
      ],
    );
  }

  Widget _suraNameVerticalList(){
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Suras List",
            style: GoogleFonts.elMessiri(
                color: Colors.white,
                fontSize:16,
                fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 10),
          Expanded(child:
          ListView.separated(
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return SuraNameItem(
                model: searchController.text.isNotEmpty
                    ? SuraModel.getSelectedSuraModel(index)
                    : SuraModel.getSuraModel(index),
              );
            },
            separatorBuilder:
                (context, index) =>
            const Divider(
              color: Colors.white,
              endIndent: 50,
              indent: 50,
              thickness: 2,
            ),
            itemCount: searchController.text.isNotEmpty
                ? SuraModel.searchResult.length
                : SuraModel.length,
          )
          ),
        ],
      ),
    );
  }
}
