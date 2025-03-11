import 'package:flutter/material.dart';
import 'package:islami_app/cache/cache_helper.dart';
import 'package:islami_app/home/home_screen.dart';
import 'package:islami_app/my_theme_data.dart';
import 'package:islami_app/onboarding_screen.dart';
import 'package:islami_app/sura_details/sura_details.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: CacheHelper.getEligibility() == true
          ?HomeScreen.routeName
          :OnboardingScreen.routeName,
      routes: {
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        SuraDetailsScreen.routeName: (context) =>  const SuraDetailsScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
    );
  }
}
