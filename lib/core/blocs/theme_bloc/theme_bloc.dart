import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_egypt_with_firebase/core/helpers/shared_pref_helper.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  bool darkMode = false;

  ThemeBloc() : super(ThemeInitial()) {
    on<ToggleTheme>((event, emit) async {
      darkMode = !darkMode;
      if (darkMode == true) {
        await SharedPrefHelper.setData("isDark", true);
        emit(DarkModeState());
      } else if (darkMode == false) {
        await SharedPrefHelper.setData("isDark", false);
        emit(LightModeState());
      }
    });
    on<DetectTheme>((event, emit) async {
      darkMode = await SharedPrefHelper.getBool("isDark") ?? false;
      if (darkMode == true) {
        emit(DarkModeState());
      } else if (darkMode == false) {
        emit(LightModeState());
      }
    });
  }
}
