import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_color/random_color/infrastructure/random_color_service.dart';

void main() {
  final RandomColorService randomColorService = RandomColorService();

  test('get material color', () async {
    final Color color = randomColorService.getRandomMaterialColor();
    expect(Colors.primaries.contains(color), true);
  });
}
