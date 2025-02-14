part of 'theme_bloc.dart';

@immutable
abstract class ThemeState {}

class ThemeInitial extends ThemeState {}

class DarkModeState extends ThemeState {}

class LightModeState extends ThemeState {}
