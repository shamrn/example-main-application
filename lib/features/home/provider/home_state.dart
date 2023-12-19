import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:main_application/features/home/models/home_errors.dart';
import 'package:main_library/features/character/models/character_ui.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(true) bool isLoading,
    @Default([]) List<CharacterUi> characters,
    HomeErrors? errors,
  }) = _HomeState;
}
