import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/screens/layout/radio/widgets/container_widget.dart';

class RadioScreen extends StatefulWidget {
  RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  bool isRadioSelected = true;

  bool isRecitersSelected = false;
  List<String> radio = [
    'Radio Ibrahim Al-Akdar',
    'Radio Al-Qaria Yassen',
    'Radio Ahmed Al-trabulsi',
    'Radio Addokali Mohammad Alalim'
  ];
  List<String> reciters = [
    'Ibrahim Al-Akdar',
    'Akram Alalaqmi',
    'Majed Al-Enezi',
    'Malik shaibat Alhamed'
  ];
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                AppAssets.radio_bg,
              ),
              fit: BoxFit.cover)),
      child: SafeArea(
        child: Column(
          children: [
            Image.asset(AppAssets.homelogo),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          isRadioSelected = true;
                          isRecitersSelected = false;
                          setState(() {});
                        },
                        child: Text(
                          'Radio',
                          style: theme.textTheme.bodyLarge!.copyWith(
                              color: isRadioSelected == true
                                  ? theme.primaryColorDark
                                  : Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            backgroundColor: isRadioSelected == true
                                ? theme.primaryColor
                                : Colors.transparent),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          isRadioSelected = false;
                          isRecitersSelected = true;
                          setState(() {});
                        },
                        child: Text(
                          'Reciters',
                          style: theme.textTheme.bodyLarge!.copyWith(
                              color: isRecitersSelected == true
                                  ? theme.primaryColorDark
                                  : Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            backgroundColor: isRecitersSelected == true
                                ? theme.primaryColor
                                : Colors.transparent),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return isRadioSelected == true
                      ? ContainerWidget(
                          name: radio[index],
                        )
                      : ContainerWidget(name: reciters[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
