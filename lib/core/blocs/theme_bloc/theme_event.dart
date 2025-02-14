part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {}

class ToggleTheme extends ThemeEvent {}

class DetectTheme extends ThemeEvent {}
