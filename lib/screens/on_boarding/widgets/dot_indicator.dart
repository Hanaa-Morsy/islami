import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';

class DotIndicator extends StatelessWidget {
  DotIndicator({required this.isActive});
  late bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        height: 8,
        width: isActive ? 24 : 8,
        decoration: BoxDecoration(
            color: isActive ? AppColors.coffe : Color(0xff707070),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
