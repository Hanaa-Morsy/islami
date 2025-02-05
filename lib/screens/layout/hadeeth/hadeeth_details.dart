import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/screens/layout/hadeeth/models/hadeeth_model.dart';

class HadeethDetails extends StatefulWidget {
  static const String routeName = 'hadeeth details';

  @override
  State<HadeethDetails> createState() => _HadeethDetailsState();
}

class _HadeethDetailsState extends State<HadeethDetails> {
  String suraContent = '';
  List ayaList = [];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var arg = ModalRoute.of(context)!.settings.arguments as HadeethModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(arg.title),
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
                    child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Center(
                      child: Text(
                    arg.title,
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: theme.primaryColor),
                  )),
                )),
                Image.asset(AppAssets.surah_details_right),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Text(
                  arg.content,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
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
}
