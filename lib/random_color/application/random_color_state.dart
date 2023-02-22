part of random_color_bloc;

@freezed
class RandomColorState with _$RandomColorState {
  const factory RandomColorState({
    required Color color,
    required RandomColorType randomColorType,
  }) = $RandomColorState;
}
