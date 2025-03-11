import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app/cache/cache_helper.dart';
import 'package:islami_app/home/home_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  static const String routeName = "OnboardingScreen";

  Widget _buildImage(String assetName) {
    return Image.asset('assets/images/$assetName.png',);
  }

  @override
  Widget build(BuildContext context) {
    var bodyStyle = GoogleFonts.elMessiri(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).primaryColor,
    );

    var pageDecoration = PageDecoration(
      titleTextStyle: GoogleFonts.elMessiri(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).primaryColor,
      ),
      bodyTextStyle: bodyStyle,
      bodyPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Theme.of(context).secondaryHeaderColor,
      imagePadding: EdgeInsets.zero,
      imageFlex: 4,
    );

    return IntroductionScreen(
      dotsDecorator:  DotsDecorator(
        color: const Color(0xFF707070),
        activeColor: Theme.of(context).primaryColor,
      ),
      dotsFlex: 3,
      globalBackgroundColor: Theme.of(context).secondaryHeaderColor,
      globalHeader: Image.asset(
        "assets/images/onboarding_header.png",
      ),
      showDoneButton: true,
      onDone: () {
        CacheHelper.saveEligibility();
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      },
      done: Text(
        "Finish",
        style: Theme.of(context).textTheme.titleSmall
      ),
      showNextButton: true,
      next: Text(
        "Next",
        style: Theme.of(context).textTheme.titleSmall
      ),
      showBackButton: true,
      back: Text(
        "Back",
        style: Theme.of(context).textTheme.titleSmall
      ),
      pages: [
        PageViewModel(
          title: "Welcome To Islmi App",
          body: "",
          image: _buildImage('onboarding1'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Welcome To Islami",
          body: "We Are Very Excited To Have You In Our Community",
          image: _buildImage('onboarding2'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Reading the Quran",
          body: "Read, and your Lord is the Most Generous",
          image: _buildImage('onboarding3'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Bearish",
          body: "Praise the name of your Lord, the Most High",
          image: _buildImage('onboarding4'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Holy Quran Radio",
          body:
              "You can listen to the Holy Quran Radio through the application for free and easily",
          image: _buildImage('onboarding5'),
          decoration: pageDecoration,
        ),
      ],
    );
  }
}
