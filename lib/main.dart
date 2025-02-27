import 'package:flutter/material.dart';
import 'package:islami_app/cache/cache_helper.dart';
import 'package:islami_app/home/home_screen.dart';
import 'package:islami_app/onboarding_screen.dart';

Future<void> main() async {
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
      initialRoute: CacheHelper.getEligibility() == true
          ?HomeScreen.routeName
          :OnboardingScreen.routeName,
      routes: {
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
    );
  }
}
