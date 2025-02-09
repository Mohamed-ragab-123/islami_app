import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app/home_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  static const String routeName = "OnboardingScreen";

  Widget _buildImage(String assetName) {
    return Image.asset(
      'assets/images/$assetName.png',
    );
  }

  @override
  Widget build(BuildContext context) {
    var bodyStyle = GoogleFonts.elMessiri(
      fontSize: 20.0,
      color: Color(0xFFE2BE7F),
    );

    var pageDecoration = PageDecoration(
      titleTextStyle: GoogleFonts.elMessiri(
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
        color: Color(0xFFE2BE7F),
      ),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Color(0xFF202020),
      imagePadding: EdgeInsets.zero,
      imageFlex: 4,
    );

    return IntroductionScreen(
      dotsDecorator: DotsDecorator(
        color: Color(0xFF707070),
        activeColor: Color(0xFFE2BE7F),
      ),
      dotsFlex: 3,
      globalBackgroundColor: Color(0xFF202020),
      globalHeader: Image.asset(
        "assets/images/onboarding_header.png",
      ),
      showDoneButton: true,
      onDone: () {
        Navigator.pushNamed(context, HomeScreen.routeName);
      },
      done: Text(
        "Finish",
        style: GoogleFonts.elMessiri(
          fontSize: 16.0,
          color: Color(0xFFE2BE7F),
        ),
      ),
      showNextButton: true,
      next: Text(
        "Next",
        style: GoogleFonts.elMessiri(
          fontSize: 16.0,
          color: Color(0xFFE2BE7F),
        ),
      ),
      showBackButton: true,
      back: Text(
        "Back",
        style: GoogleFonts.elMessiri(
          fontSize: 16.0,
          color: Color(0xFFE2BE7F),
        ),
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
