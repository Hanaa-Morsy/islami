import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/screens/layout/quraan/models/sura_data.dart';

class SurahDetails extends StatefulWidget {
  static const String routeName = 'surah details';

  @override
  State<SurahDetails> createState() => _SurahDetailsState();
}

class _SurahDetailsState extends State<SurahDetails> {
  String suraContent = '';
  List ayaList = [];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var arg = ModalRoute.of(context)!.settings.arguments as SuraData;
    if (suraContent == '') {
      readFile(arg.index);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(arg.suraNameEn),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              textDirection: TextDirection.ltr,
              children: [
                Image.asset(AppAssets.surah_details_left),
                Expanded(
                    child: Center(
                        child: Text(
                  arg.suraNameAr,
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: theme.primaryColor),
                ))),
                Image.asset(AppAssets.surah_details_right),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Text.rich(
                  TextSpan(
                      children: ayaList.map((e) {
                    int index = ayaList.indexOf(e);
                    return TextSpan(
                        text: e, children: [TextSpan(text: '[${index + 1}] ')]);
                  }).toList()),
                  textDirection: TextDirection.rtl,
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: theme.primaryColor),
                ),
              ),
            ),
          ),
          Image.asset(AppAssets.bottom_mosque),
        ],
      ),
    );
  }

  void readFile(int index) async {
    suraContent = await rootBundle.loadString('assets/Suras/${index + 1}.txt');
    ayaList = suraContent.trim().split('\n');
    setState(() {});
  }
}
