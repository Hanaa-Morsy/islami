import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_assets.dart';

class SebhaScreen extends StatelessWidget {
  const SebhaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage(
        AppAssets.quran_bg,
    ),
    fit: BoxFit.cover)),
    child: Column(
      children: [
        Image.asset(AppAssets.homelogo)
      ],
    ),);
  }
}
