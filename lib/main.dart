import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_theme.dart';
import 'package:islami/screens/layout/hadeeth/hadeeth_details.dart';
import 'package:islami/screens/layout/layout_screen.dart';
import 'package:islami/screens/layout/quraan/surah_details.dart';
import 'package:islami/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: AppTheme.darktheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (context) {
          return SplashScreen();
        },
        LayoutScreen.routeName: (context) {
          return LayoutScreen();
        },
        SurahDetails.routeName: (context) {
          return SurahDetails();
        },
        HadeethDetails.routeName: (context) {
          return HadeethDetails();
        },
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
