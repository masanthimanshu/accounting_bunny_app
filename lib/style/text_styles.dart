import 'package:flutter/material.dart';

enum CustomTextStyle {
  headingLargeBold,
  headingLarge,
  headingMediumBold,
  headingMedium,
  headingSmallBold,
  headingSmall,
}

extension CustomTextStyleExtension on CustomTextStyle {
  TextStyle get style {
    switch (this) {
      case CustomTextStyle.headingLargeBold:
        return const TextStyle(fontSize: 40, fontWeight: FontWeight.bold);
      case CustomTextStyle.headingLarge:
        return const TextStyle(fontSize: 40);
      case CustomTextStyle.headingMediumBold:
        return const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
      case CustomTextStyle.headingMedium:
        return const TextStyle(fontSize: 30);
      case CustomTextStyle.headingSmallBold:
        return const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
      case CustomTextStyle.headingSmall:
        return const TextStyle(fontSize: 20);
    }
  }
}
