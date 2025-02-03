import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/screens/layout/adhan/adhan_screen.dart';
import 'package:islami/screens/layout/hadeeth/hadeeth_screen.dart';
import 'package:islami/screens/layout/quraan/quraan_screen.dart';
import 'package:islami/screens/layout/radio/radio_screen.dart';
import 'package:islami/screens/layout/sebha/sebha_screen.dart';

class LayoutScreen extends StatefulWidget {
  LayoutScreen({super.key});

  @override
  static const String routeName = 'layout';

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int selectedIndex = 0;
  List<Widget> screens = [
    QuranScreen(),
    HadeethScreen(),
    SebhaScreen(),
    RadioScreen(),
    AdhanScreen(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.coffe,
          fixedColor: AppColors.white,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          selectedIconTheme: IconThemeData(color: AppColors.white),
          selectedLabelStyle: TextStyle(color: AppColors.white),
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
          currentIndex: selectedIndex,
          items: [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.quran_icon)),
                label: 'Quran',
                activeIcon: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                      color: AppColors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(15)),
                  child: ImageIcon(AssetImage(AppAssets.quran_icon)),
                )),
            BottomNavigationBarItem(
              icon: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: selectedIndex != 1
                          ? Colors.transparent
                          : AppColors.black.withOpacity(0.6)),
                  child: ImageIcon(AssetImage(AppAssets.hadeeth_icon))),
              label: 'Hadeeth',
            ),
            BottomNavigationBarItem(
              icon: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: selectedIndex != 2
                          ? Colors.transparent
                          : AppColors.black.withOpacity(0.6)),
                  child: ImageIcon(AssetImage(AppAssets.sebha_icon))),
              label: 'Sebha',
            ),
            BottomNavigationBarItem(
              icon: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: selectedIndex != 3
                          ? Colors.transparent
                          : AppColors.black.withOpacity(0.6)),
                  child: ImageIcon(AssetImage(AppAssets.radio_icon))),
              label: 'Radio',
            ),
            BottomNavigationBarItem(
              icon: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: selectedIndex != 4
                          ? Colors.transparent
                          : AppColors.black.withOpacity(0.6)),
                  child: ImageIcon(AssetImage(AppAssets.adhan_icon))),
              label: 'Adhan',
            ),
          ]),
      body: screens[selectedIndex],
    );
  }
}
