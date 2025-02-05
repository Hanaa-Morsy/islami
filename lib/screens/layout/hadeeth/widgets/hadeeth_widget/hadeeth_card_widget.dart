import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/screens/layout/hadeeth/hadeeth_details.dart';
import 'package:islami/screens/layout/hadeeth/models/hadeeth_model.dart';

class HadeethCardWidget extends StatelessWidget {
  HadeethCardWidget({
    required this.hadeethModel,
  });

  HadeethModel hadeethModel;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, HadeethDetails.routeName,
              arguments: hadeethModel);
        },
        child: Container(
          decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding:
                const EdgeInsets.only(bottom: 0, top: 8, left: 8, right: 8),
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(child: Image.asset(AppAssets.hadeeth_bg2)),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          AppAssets.bottom_mosque,
                          color: theme.primaryColorDark,
                        ))
                  ],
                ),
                Column(
                  children: [
                    Row(
                      textDirection: TextDirection.ltr,
                      children: [
                        Image.asset(
                          AppAssets.surah_details_left,
                          color: theme.primaryColorDark,
                        ),
                        Expanded(
                            child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Center(
                              child: Text(
                            hadeethModel.title,
                            style: theme.textTheme.bodyLarge!
                                .copyWith(color: theme.primaryColorDark),
                          )),
                        )),
                        Image.asset(
                          AppAssets.surah_details_right,
                          color: theme.primaryColorDark,
                        ),
                      ],
                    ),
                    Center(
                        child: Text(
                      hadeethModel.content,
                      style: theme.textTheme.bodyLarge!
                          .copyWith(color: theme.primaryColorDark),
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                    ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
