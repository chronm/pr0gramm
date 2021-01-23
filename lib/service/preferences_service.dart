import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:pr0gramm_api/pr0gramm_api.dart';

@immutable
class PreferencesState {
  final Pr0grammTheme theme;

  PreferencesState(this.theme);

  PreferencesState copyWith({Pr0grammTheme theme}) {
    return PreferencesState(
      theme ?? this.theme,
    );
  }

  factory PreferencesState.fromMap(Map<String, dynamic> map) => PreferencesState(Pr0grammTheme.values[(map["theme"] as int)]);

  Map<String, dynamic> toMap() => {"theme": theme.index};
}

class PreferencesService extends HydratedCubit<PreferencesState> {
  PreferencesService() : super(PreferencesState(Pr0grammTheme.BEWAEHRTES_ORANGE));

  void setTheme(Pr0grammTheme theme) => emit(state.copyWith(theme: theme));

  @override
  PreferencesState fromJson(Map<String, dynamic> json) => PreferencesState.fromMap(json);

  @override
  Map<String, dynamic> toJson(PreferencesState state) => state.toMap();
}
