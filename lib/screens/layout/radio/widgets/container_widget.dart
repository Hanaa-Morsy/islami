import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_assets.dart';

class ContainerWidget extends StatefulWidget {
  late String name;

  ContainerWidget({
    super.key,
    required this.name,
  });

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  bool isPlayed = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Image.asset(
                isPlayed == false
                    ? AppAssets.radio_list_bg
                    : 'assets/images/Mask group (5).png',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('${widget.name}',
                      style: TextStyle(
                          color: theme.primaryColorDark,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          isPlayed = !isPlayed;
                          setState(() {});
                        },
                        icon: Icon(
                          isPlayed == false ? Icons.play_arrow : Icons.pause,
                          color: theme.primaryColorDark,
                          size: 40,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          isPlayed == false
                              ? Icons.volume_up_sharp
                              : Icons.volume_off_sharp,
                          color: theme.primaryColorDark,
                          size: 40,
                        ))
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
