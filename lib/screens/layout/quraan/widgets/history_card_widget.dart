import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/screens/layout/quraan/models/sura_data.dart';
import 'package:islami/screens/layout/quraan/surah_details.dart';

class HistoryCard extends StatelessWidget {
  HistoryCard({required this.suraData});

  @override
  SuraData suraData;
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 4),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, SurahDetails.routeName,
              arguments: suraData);
        },
        child: Container(
          decoration: BoxDecoration(
            color: theme.primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(suraData.suraNameAr,
                        style: theme.textTheme.bodyLarge!
                            .copyWith(color: theme.primaryColorDark)),
                    Text(suraData.suraNameEn,
                        style: theme.textTheme.bodyLarge!
                            .copyWith(color: theme.primaryColorDark)),
                    Text(suraData.ayaVerses!,
                        style: theme.textTheme.bodyLarge!
                            .copyWith(color: theme.primaryColorDark)),
                  ],
                ),
              ),
              Image.asset(AppAssets.history)
            ],
          ),
        ),
      ),
    );
  }
}
