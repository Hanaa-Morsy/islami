import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/core/theme/app_colors.dart';

class SebhaScreen extends StatefulWidget {
  SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  @override
  List<String> tasabeeh = [
    'سبحان الله',
    'الحمد لله',
    'لا إله إلا الله',
    ' الله أكبر'
  ];

  int count = 0;

  int index = 0;
  double turns = 0;

  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
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
            Text(
              'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 36,
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                      left: MediaQuery.of(context).size.width * .47,
                      child: Image.asset(
                        AppAssets.sebha_head,
                        height: MediaQuery.of(context).size.height * .1,
                      )),
                  Positioned(
                      top: MediaQuery.of(context).size.height * .09,
                      left: MediaQuery.of(context).size.width * .07,
                      child: AnimatedRotation(
                        duration: Duration(milliseconds: 500),
                        turns: turns,
                        child: InkWell(
                            onTap: () {
                              update();
                            },
                            child: Image.asset(
                              AppAssets.sebha_body,
                              height: MediaQuery.of(context).size.height * .4,
                            )),
                      )),
                  Positioned(
                    top: MediaQuery.of(context).size.height * .22,
                    left: MediaQuery.of(context).size.width * .3,
                    child: Text(
                      tasabeeh[index],
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * .3,
                    left: MediaQuery.of(context).size.width * .45,
                    child: Text(
                      count.toString(),
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void update() {
    count++;
    turns = turns + (3.14 / 99);
    if (count == 34) {
      index = index + 1;
      count = 0;
      if (index == 4) {
        index = 0;
      }
    }
    setState(() {});
  }
}
