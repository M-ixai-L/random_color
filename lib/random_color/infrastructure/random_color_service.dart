import 'dart:math';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

/// A service that generates random colors
@injectable
class RandomColorService {
  // ignore: no-magic-number
  int get _getRandomColorValue => Random().nextInt(256);

  double get _getRandomOpacityValue => Random().nextDouble();

  /// Generate a random material color
  Color getRandomMaterialColor() {
    const List<MaterialColor> materialColorsList = Colors.primaries;

    return materialColorsList[Random().nextInt(Colors.primaries.length)];
  }

  /// Generate a random custom color
  Color getCustomRandomColor() {
    return Color.fromRGBO(
      _getRandomColorValue,
      _getRandomColorValue,
      _getRandomColorValue,
      _getRandomOpacityValue,
    );
  }
}
