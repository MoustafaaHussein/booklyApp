part of 'theme_change_cubit.dart';

sealed class ThemeChangeState extends Equatable {
  const ThemeChangeState();

  @override
  List<Object> get props => [];
}

final class ThemeChangeInitial extends ThemeChangeState {}
