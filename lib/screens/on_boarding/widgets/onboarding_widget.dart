import 'package:flutter/material.dart';
import 'package:islami/screens/on_boarding/models/on_boarding_model.dart';

class OnBoardingWidget extends StatelessWidget {
  OnBoardingWidget({required this.onBoardingModel});
  OnBoardingModel onBoardingModel;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Expanded(child: Image.asset(onBoardingModel.image)),
        Padding(
          padding: const EdgeInsets.only(
            top: 16,
          ),
          child: Text(
            onBoardingModel.title,
            style:
                theme.textTheme.bodyLarge!.copyWith(color: theme.primaryColor),
          ),
        ),
        if (onBoardingModel.description != null)
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                onBoardingModel.description!,
                style: theme.textTheme.bodySmall!
                    .copyWith(color: theme.primaryColor),
                textAlign: TextAlign.center,
              ),
            ),
          )
      ],
    );
  }
}
