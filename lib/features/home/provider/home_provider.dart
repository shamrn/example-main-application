import 'package:injectable/injectable.dart';
import 'package:main_application/common/utils/base_state_notifier.dart';
import 'package:main_application/features/home/models/home_errors.dart';
import 'package:main_application/features/home/provider/home_state.dart';
import 'package:main_library/features/character/use_case/character_use_case.dart';
import 'package:main_library/features/common/exceptions/server_error_exception.dart';
import 'package:main_library/features/common/exceptions/unknown_error_exception.dart';

@lazySingleton
class HomeProvider extends BaseStateNotifier<HomeState> {
  HomeProvider({
    required CharacterUseCase characterUseCase,
  })  : _characterUseCase = characterUseCase,
        super(const HomeState());

  final CharacterUseCase _characterUseCase;

  @override
  Future<void> onInit() async {
    try {
      final characters = await _characterUseCase.getCharacters();

      state = state.copyWith(isLoading: false, characters: characters);
    } on ServerErrorException catch (_) {
      state = state.copyWith(
        isLoading: false,
        errors: const HomeErrors(isServerError: true),
      );
    } on UnknownErrorException catch (_) {
      state = state.copyWith(
        isLoading: false,
        errors: const HomeErrors(isUnknownError: true),
      );
    }
  }
}
