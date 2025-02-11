import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/core/theme/app_colors.dart';

class AdhanScreen extends StatelessWidget {
  const AdhanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                AppAssets.adhan_bg,
              ),
              fit: BoxFit.cover)),
      child: SafeArea(
        child: Column(
          children: [
            Image.asset(AppAssets.homelogo),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                    color:  AppColors.coffe,
                    borderRadius: BorderRadius.circular(20)
                ),

                child: Container(
                  width: double.infinity,

                  decoration: BoxDecoration(
                    color:  AppColors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: ClipPath(
                    clipper: CurveClipper(),
                    child: Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.coffe,
                      ),

                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height*0.3);


    path.quadraticBezierTo(size.width * 0.2,size.height*.3,
        size.width * 0.2, 0);
    path.lineTo(size.width*0.8,0);

    path.quadraticBezierTo(size.width * 0.8, size.height*.3,
        size.width , size.height * 0.3);

    path.lineTo(size.width,size.height);
    path.lineTo(0,size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
