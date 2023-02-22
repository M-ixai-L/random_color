part of random_color_bloc;

abstract class RandomColorEvent {
  const RandomColorEvent();
}

/// Event for change color in RandomColorBloc state
@freezed
class ChangeColor with _$ChangeColor implements RandomColorEvent {
  /// randomColorType: This is the type of color returned (material or custom)
  const factory ChangeColor([RandomColorType? randomColorType]) = ChangeColor$;
}
