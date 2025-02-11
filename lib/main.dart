import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_theme.dart';
import 'package:islami/screens/layout/hadeeth/hadeeth_details.dart';
import 'package:islami/screens/layout/layout_screen.dart';
import 'package:islami/screens/layout/quraan/surah_details.dart';
import 'package:islami/screens/on_boarding/on_boarding.dart';
import 'package:islami/screens/splash/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  var isFirstTime=await checkFirstTime();
  runApp( MyApp(firstTime: isFirstTime,));
}

Future<bool> checkFirstTime()async {
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
 bool firstTime= await sharedPreferences.getBool('first')??true;
 return firstTime;
}

class MyApp extends StatelessWidget {
  final bool firstTime;
   MyApp({required this.firstTime});

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
        OnBoarding.routeName: (context) {
          return OnBoarding();
        },
      },
      initialRoute:firstTime? OnBoarding.routeName:SplashScreen.routeName,
    );
  }
}
