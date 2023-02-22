import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_color/random_color/application/entities/random_color_type.dart';
import 'package:random_color/random_color/random_color.dart';

// ignore: prefer-match-file-name
class MockRandomColorService extends Mock implements RandomColorService {}

void main() {
  MockRandomColorService randomColorService = MockRandomColorService();
  // ignore: avoid-late-keyword
  late RandomColorBloc randomColorBloc;

  setUp(() {
    randomColorService = MockRandomColorService();

    when(() => randomColorService.getRandomMaterialColor())
        .thenReturn(Colors.white);
    when(() => randomColorService.getCustomRandomColor())
        .thenReturn(Colors.black);

    randomColorBloc = RandomColorBloc(
      randomColorService: randomColorService,
    );
  });

  test('initial state', () {
    expect(
      randomColorBloc.state,
      const RandomColorState(
        color: Colors.white,
        randomColorType: RandomColorType.materialColor,
      ),
    );
  });

  blocTest<RandomColorBloc, RandomColorState>(
    'get custom color',
    build: () => randomColorBloc,
    act: (RandomColorBloc bloc) =>
        bloc.add(const ChangeColor(RandomColorType.customColor)),
    expect: () => <RandomColorState>[
      const RandomColorState(
        color: Colors.black,
        randomColorType: RandomColorType.customColor,
      )
    ],
  );

  blocTest<RandomColorBloc, RandomColorState>(
    'get material color',
    build: () => randomColorBloc,
    setUp: () {
      when(() => randomColorService.getRandomMaterialColor())
          .thenReturn(Colors.red);
    },
    act: (RandomColorBloc bloc) =>
        bloc.add(const ChangeColor(RandomColorType.materialColor)),
    expect: () => <RandomColorState>[
      const RandomColorState(
        color: Colors.red,
        randomColorType: RandomColorType.materialColor,
      )
    ],
  );
}
