import 'package:flutter/material.dart';
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
        color: Theme.of(context).primaryColor,
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
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                model.arName,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "${model.ayaNum} Verses",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).secondaryHeaderColor,
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
