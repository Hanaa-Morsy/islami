import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/screens/layout/quraan/models/sura_data.dart';
import 'package:islami/screens/layout/quraan/surah_details.dart';

class QuraanCard extends StatelessWidget {
  QuraanCard({
    required this.suraData,
    required this.onTap,
  });
  SuraData suraData;
  Function(int value) onTap;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return ListTile(
      leading: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            '${suraData.index + 1}',
            style: TextStyle(
              color: AppColors.white,
            ),
          ),
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            AppAssets.surah_icon,
          ),
        )),
      ),
      title: Text(
        '${suraData.suraNameEn}',
        style: theme.textTheme.bodyLarge,
      ),
      subtitle: Text(
        '${suraData.ayaVerses} verses',
        style: theme.textTheme.bodySmall,
      ),
      trailing: Text(
        '${suraData.suraNameAr}',
        style: theme.textTheme.bodyLarge,
      ),
      onTap: () {
        onTap(suraData.index);
        Navigator.pushNamed(context, SurahDetails.routeName,
            arguments: SuraData(
                suraNameAr: suraData.suraNameAr,
                suraNameEn: suraData.suraNameEn,
                index: suraData.index));
      },
    );
  }
}
