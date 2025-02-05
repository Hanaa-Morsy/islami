import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/screens/layout/hadeeth/models/hadeeth_model.dart';
import 'package:islami/screens/layout/hadeeth/widgets/hadeeth_widget/hadeeth_card_widget.dart';

class HadeethScreen extends StatefulWidget {
  HadeethScreen({super.key});

  @override
  State<HadeethScreen> createState() => _HadeethScreenState();
}

class _HadeethScreenState extends State<HadeethScreen> {
  @override
  List<HadeethModel> ahadeeth = [];

  Widget build(BuildContext context) {
    if (ahadeeth.isEmpty) {
      readHadeethFile();
    }
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                AppAssets.hadeeth_bg,
              ),
              fit: BoxFit.cover)),
      child: SafeArea(
        child: Column(
          children: [
            Image.asset(AppAssets.homelogo),
            ahadeeth.isEmpty
                ? Center(child: CircularProgressIndicator())
                : Expanded(
                    child: CarouselSlider.builder(
                        itemCount: ahadeeth.length,
                        itemBuilder: (context, index, realIndex) {
                          return HadeethCardWidget(
                              hadeethModel: ahadeeth[index]);
                        },
                        options: CarouselOptions(
                            enlargeCenterPage: true,
                            height: MediaQuery.of(context).size.height * .7)),
                  )
          ],
        ),
      ),
    );
  }

  void readHadeethFile() async {
    for (int i = 1; i <= 50; i++) {
      String hadeeth = await rootBundle.loadString('assets/Hadeeth/h${i}.txt');
      List<String> splitHadeeth = hadeeth.split('\n');
      ahadeeth.add(HadeethModel(
          title: splitHadeeth[0].trim(), content: splitHadeeth[1].trim()));
    }

    setState(() {});
  }
}
