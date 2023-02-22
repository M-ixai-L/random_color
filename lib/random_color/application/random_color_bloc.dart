part of random_color_bloc;

@injectable
class RandomColorBloc extends Bloc<RandomColorEvent, RandomColorState> {
  final RandomColorService _randomColorService;

  RandomColorBloc({
    required RandomColorService randomColorService,
  })  : _randomColorService = randomColorService,
        super(
          RandomColorState(
            color: randomColorService.getRandomMaterialColor(),
            randomColorType: RandomColorType.materialColor,
          ),
        ) {
    on<ChangeColor>(_changeColor);
  }

  Future<void> _changeColor(
    ChangeColor event,
    Emitter<RandomColorState> emit,
  ) async {
    final RandomColorType randomColorType =
        event.randomColorType ?? state.randomColorType;
    final Color newColor = randomColorType == RandomColorType.materialColor
        ? _randomColorService.getRandomMaterialColor()
        : _randomColorService.getCustomRandomColor();

    emit(state.copyWith(color: newColor, randomColorType: randomColorType));
  }
}
