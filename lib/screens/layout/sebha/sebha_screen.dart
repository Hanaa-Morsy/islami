import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/core/theme/app_colors.dart';

class SebhaScreen extends StatelessWidget {
  const SebhaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    return  Container(
      width: double.infinity,
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage(
        AppAssets.sebha_bg,
    ),
    fit: BoxFit.cover)),
    child: SafeArea(
      child: Column(
        children: [
          Image.asset(AppAssets.homelogo),
          Text('سَبِّحِ اسْمَ رَبِّكَ الأعلى',style:TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
            fontSize: 36,
          ) ,),
          Expanded(
            child: Stack(
              children: [
Row(),
                Positioned(
                    left: MediaQuery.of(context).size.width*.47,
                    child: Image.asset(AppAssets.sebha_head,height: MediaQuery.of(context).size.height*.1,)),
                Positioned(
                  top:MediaQuery.of(context).size.height*.09  ,
                    left: MediaQuery.of(context).size.width*.08,
                child: Image.asset(AppAssets.sebha_body,height: MediaQuery.of(context).size.height*.4,)),
                Text('dfgh')
              ],
            ),
          )
        ],
      ),
    ),);
  }
}
