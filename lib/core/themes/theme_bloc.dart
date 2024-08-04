// theme_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kanban_test/core/themes/themes.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeData: lightTheme)) {
    on<ToggleThemeEvent>((event, emit) {
      final isDark = state.themeData.brightness == Brightness.dark;
      emit(ThemeState(themeData: isDark ? lightTheme : darkTheme));
    });
  }
}
