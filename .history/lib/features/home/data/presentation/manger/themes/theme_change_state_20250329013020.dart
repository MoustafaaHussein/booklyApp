part of 'theme_change_cubit.dart';

sealed class ThemeChangeState extends Equatable {
  const ThemeChangeState(this.themeMode);
  final ThemeMode themeMode;
  @override
  List<Object> get props => [];
}

final class ThemeChangeInitial extends ThemeChangeState {
  const ThemeChangeInitial() : super(ThemeMode.light);
}

final class DarkTheme extends ThemeChangeState {
  const DarkTheme() : super(ThemeMode.dark);
}

final class LightTheme extends ThemeChangeState {
  const LightTheme() : super(ThemeMode.light);
}
